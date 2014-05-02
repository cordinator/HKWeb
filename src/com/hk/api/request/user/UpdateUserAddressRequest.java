package com.hk.api.request.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Rimal
 */
public class UpdateUserAddressRequest extends CreateUserAddressRequest {

  private static Logger logger = LoggerFactory.getLogger(UpdateUserAddressRequest.class);

  private Long addressId;


  @Override
  public boolean validate() {
    boolean valid = super.validate();

    if (addressId == null) {
      logger.error("Error validating " + this.getClass().getSimpleName() + " addressId cannot be blank");
      valid = false;
    }

    return valid;
  }

  public Long getAddressId() {
    return addressId;
  }

  public void setAddressId(Long addressId) {
    this.addressId = addressId;
  }

  public Map<String, String> getParams() {
    Map<String, String> params = super.getParams();
    params.put("addressId", addressId.toString());

    return params;
  }
}