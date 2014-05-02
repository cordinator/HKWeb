package com.hk.api.request.payment;

import com.hk.api.request.AbstractUserRequest;
import com.hk.common.constants.payment.EnumPaymentStatus;
import com.hk.common.constants.payment.EnumPaymentType;
import org.apache.commons.lang.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 15, 2013
 * Time: 4:33:32 PM
 */
public class CreatePaymentForCartRequest extends AbstractUserRequest {

  protected String contactName;
  protected String contactNo;

  protected Long paymentStatusId;
  protected Long paymentTypeId;
  protected String amount;
  protected Long addressId;


  @Override
  public boolean validate() {
    boolean valid = super.validate();

    if (valid && paymentTypeId == null) {
      valid = false;
    }

    if (valid && amount == null) {
      valid = false;
    }


    if (valid && addressId == null) {
      valid = false;
    }


    EnumPaymentStatus enumPaymentStatus = EnumPaymentStatus.getById(paymentStatusId);
    if (enumPaymentStatus == null) {
      valid = false;
    }


    if (valid && EnumPaymentType.COD.getId().equals(this.paymentTypeId)) {

      if (StringUtils.isBlank(contactName) || StringUtils.isBlank(contactNo)) {
        valid = false;
      }
    }

    return valid;
  }

  public String getContactName() {
    return contactName;
  }

  public void setContactName(String contactName) {
    this.contactName = contactName;
  }

  public String getContactNo() {
    return contactNo;
  }

  public void setContactNo(String contactNo) {
    this.contactNo = contactNo;
  }

  public Long getPaymentStatusId() {
    return paymentStatusId;
  }

  public void setPaymentStatusId(Long paymentStatusId) {
    this.paymentStatusId = paymentStatusId;
  }

  public Long getPaymentTypeId() {
    return paymentTypeId;
  }

  public void setPaymentTypeId(Long paymentTypeId) {
    this.paymentTypeId = paymentTypeId;
  }

  public String getAmount() {
    return amount;
  }

  public void setAmount(String amount) {
    this.amount = amount;
  }

  public Long getAddressId() {
    return addressId;
  }

  public void setAddressId(Long addressId) {
    this.addressId = addressId;
  }

  public Map<String, String> getParameters() {

    Map<String, String> params = new HashMap<String, String>();
    params.put("storeId", storeId.toString());

    if (userId != null) {
      params.put("userId", userId.toString());
    }


    if (StringUtils.isNotBlank(contactName)) {
      params.put("contactName", contactName);
    }
    if (StringUtils.isNotBlank(contactNo)) {
      params.put("contactNo", contactNo);
    }

    params.put("paymentStatusId", paymentStatusId.toString());
    params.put("paymentTypeId", paymentTypeId.toString());
    params.put("amount", amount.toString());
    params.put("addressId", addressId.toString());
    return params;
  }
}
