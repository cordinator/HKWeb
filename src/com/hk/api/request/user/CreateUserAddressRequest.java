package com.hk.api.request.user;

import com.hk.api.request.AbstractUserRequest;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Rimal
 */
public class CreateUserAddressRequest extends AbstractUserRequest {

  private static Logger logger = LoggerFactory.getLogger(CreateUserAddressRequest.class);

  protected String name;
  protected String line1;
  protected String landmark;
  protected String cityName;

  protected Long stateId;
  protected Long cityId;
  protected Long placeId;
  protected String pincode;
  protected String contactNo;
  protected String alternateContactNo;


  @Override
  public boolean validate() {
    boolean valid = super.validate();

    if (valid && StringUtils.isBlank(name)) {
      logger.error("Error validating " + this.getClass().getSimpleName() + " name cannot be blank");
      valid = false;
    }

    if (valid && StringUtils.isBlank(line1)) {
      logger.error("Error validating " + this.getClass().getSimpleName() + " line1 cannot be blank");
      valid = false;
    }

    if (valid && (stateId == null)) {
      logger.error("Error validating " + this.getClass().getSimpleName() + " stateId cannot be blank");
      valid = false;
    }

    if (valid && StringUtils.isBlank(cityName)) {
      logger.error("Error validating " + this.getClass().getSimpleName() + " cityName cannot be blank");
      valid = false;
    }

    if (valid && StringUtils.isBlank(pincode)) {
      logger.error("Error validating " + this.getClass().getSimpleName() + " pincode cannot be blank");
      valid = false;
    }

    return valid;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getLine1() {
    return line1;
  }

  public void setLine1(String line1) {
    this.line1 = line1;
  }

  public String getLandmark() {
    return landmark;
  }

  public void setLandmark(String landmark) {
    this.landmark = landmark;
  }

  public String getCityName() {
    return cityName;
  }

  public void setCityName(String cityName) {
    this.cityName = cityName;
  }

  public Long getStateId() {
    return stateId;
  }

  public void setStateId(Long stateId) {
    this.stateId = stateId;
  }

  public Long getCityId() {
    return cityId;
  }

  public void setCityId(Long cityId) {
    this.cityId = cityId;
  }

  public Long getPlaceId() {
    return placeId;
  }

  public void setPlaceId(Long placeId) {
    this.placeId = placeId;
  }

  public String getPincode() {
    return pincode;
  }

  public void setPincode(String pincode) {
    this.pincode = pincode;
  }

  public String getContactNo() {
    return contactNo;
  }

  public void setContactNo(String contactNo) {
    this.contactNo = contactNo;
  }

  public String getAlternateContactNo() {
    return alternateContactNo;
  }

  public void setAlternateContactNo(String alternateContactNo) {
    this.alternateContactNo = alternateContactNo;
  }


  public Map<String, String> getParams() {
    Map<String, String> params = new HashMap<String, String>(0);

    params.put("name", name);
    params.put("line1", line1);
    params.put("landmark", landmark);

    if (cityId != null) {
      params.put("cityId", cityId.toString());
    }

    if (placeId != null) {
      params.put("placeId", placeId.toString());
    }
    params.put("stateId", stateId.toString());
    params.put("cityName", cityName);
    params.put("pincode", pincode);
    params.put("contactNo", contactNo);
    params.put("alternateContactNo", alternateContactNo);
    params.put("storeId", storeId.toString());
    params.put("userId", userId.toString());

    return params;
  }
}