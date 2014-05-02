package com.hk.api.request.payment;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 24, 2013
 * Time: 6:32:08 PM
 */
public class AcceptPaymentForCartRequest {


  private String hkPayChecksum;
  private String hkPayGatewayOrderId;
  private Double hkPayAmount;
  private String hkPayStatus;
  private String accountId;


  public Map<String, String> getParameters() {

    Map<String, String> params = new HashMap<String, String>();
    params.put("hkPayChecksum", hkPayChecksum);
    params.put("hkPayGatewayOrderId", hkPayGatewayOrderId);
    if (hkPayAmount != null) {
      params.put("hkPayAmount", hkPayAmount.toString());
    }

    params.put("hkPayStatus", hkPayStatus);
    params.put("accountId", accountId);


    return params;
  }

  public String getHkPayChecksum() {
    return hkPayChecksum;
  }

  public void setHkPayChecksum(String hkPayChecksum) {
    this.hkPayChecksum = hkPayChecksum;
  }

  public String getHkPayGatewayOrderId() {
    return hkPayGatewayOrderId;
  }

  public void setHkPayGatewayOrderId(String hkPayGatewayOrderId) {
    this.hkPayGatewayOrderId = hkPayGatewayOrderId;
  }

  public Double getHkPayAmount() {
    return hkPayAmount;
  }

  public void setHkPayAmount(Double hkPayAmount) {
    this.hkPayAmount = hkPayAmount;
  }

  public String getHkPayStatus() {
    return hkPayStatus;
  }

  public void setHkPayStatus(String hkPayStatus) {
    this.hkPayStatus = hkPayStatus;
  }

  public String getAccountId() {
    return accountId;
  }

  public void setAccountId(String accountId) {
    this.accountId = accountId;
  }
}
