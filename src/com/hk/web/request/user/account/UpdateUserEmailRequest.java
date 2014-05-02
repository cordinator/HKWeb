package com.hk.web.request.user.account;

import com.hk.api.request.AbstractUserRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.commons.lang.StringUtils;

import java.util.Map;
import java.util.HashMap;

/**
 * @author Rimal
 */
public class UpdateUserEmailRequest extends AbstractUserRequest {

  private static Logger logger = LoggerFactory.getLogger(UpdateUserEmailRequest.class);

  private String newEmail;


  @Override
  public boolean validate() {
    boolean valid = super.validate();

    if (valid) {
      if (StringUtils.isBlank(newEmail)) {
        logger.error("Error validating " + this.getClass().getSimpleName() + " newEmail cannot be blank");
        valid = false;
      }
    }

    return valid;
  }


  public String getNewEmail() {
    return newEmail;
  }

  public void setNewEmail(String newEmail) {
    this.newEmail = newEmail;
  }

  public Map<String, String> getParameters() {
    Map<String, String> params = new HashMap<String, String>();
    params.put("newEmail", newEmail);
    params.put("userId", userId.toString());
    params.put("storeId", storeId.toString());
    return params;
  }
}
