package com.hk.web.request.user.account;

import com.hk.api.request.AbstractUserRequest;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Rimal
 */
public class UpdateUserPasswordRequest extends AbstractUserRequest {

  private static Logger logger = LoggerFactory.getLogger(UpdateUserPasswordRequest.class);

  private String oldPassword;
  private String newPassword;


  @Override
  public boolean validate() {
    boolean valid = super.validate();

    if (valid) {
      if (StringUtils.isBlank(oldPassword)) {
        logger.error("Error validating " + this.getClass().getSimpleName() + " oldPassword cannot be blank");
        valid = false;
      }

      if (valid) {
        if (StringUtils.isBlank(newPassword)) {
          logger.error("Error validating " + this.getClass().getSimpleName() + " newPassword cannot be blank");
          valid = false;
        }
      }
    }

    return valid;
  }


  public String getOldPassword() {
    return oldPassword;
  }

  public void setOldPassword(String oldPassword) {
    this.oldPassword = oldPassword;
  }

  public String getNewPassword() {
    return newPassword;
  }

  public void setNewPassword(String newPassword) {
    this.newPassword = newPassword;
  }


  public Map<String, String> getParameters() {
    Map<String, String> params = new HashMap<String, String>();
    params.put("oldPassword", oldPassword);
    params.put("newPassword", newPassword);
    params.put("userId", userId.toString());
    params.put("storeId", storeId.toString());
    return params;
  }
}
