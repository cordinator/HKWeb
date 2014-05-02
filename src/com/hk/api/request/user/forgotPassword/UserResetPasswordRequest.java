package com.hk.api.request.user.forgotPassword;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Rimal
 */
public class UserResetPasswordRequest {

  private static Logger logger = LoggerFactory.getLogger(UserResetPasswordRequest.class);

  private String token;
  private String newPassword;

  private Long storeId;


  public boolean validate() {
    boolean valid = true;

    if (StringUtils.isBlank(token)) {
      logger.error("Error validating" + this.getClass().getSimpleName() + " token cannot be null");
      valid = false;
    }

    if (valid && StringUtils.isBlank(newPassword)) {
      logger.error("Error validating" + this.getClass().getSimpleName() + " new password cannot be null");
      valid = false;
    }


    return valid;
  }


  public String getToken() {
    return token;
  }

  public void setToken(String token) {
    this.token = token;
  }

  public String getNewPassword() {
    return newPassword;
  }

  public void setNewPassword(String newPassword) {
    this.newPassword = newPassword;
  }

  public Long getStoreId() {
    return storeId;
  }

  public void setStoreId(Long storeId) {
    this.storeId = storeId;
  }


  public Map<String, String> getParams() {
    Map<String, String> params = new HashMap<String, String>();

    params.put("token", token);
    params.put("newPassword", newPassword);
    params.put("storeId", storeId.toString());

    return params;
  }
}
