package com.hk.web.request.user.account;

import com.hk.api.request.AbstractUserRequest;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Date;
import java.util.Map;
import java.util.HashMap;

/**
 * @author Rimal
 */
public class UpdateUserBasicInfoRequest extends AbstractUserRequest {

  private static Logger logger = LoggerFactory.getLogger(UpdateUserBasicInfoRequest.class);

  private String name;
  private String gender;
  private String birthDate;

  @Override
  public boolean validate() {
    boolean valid = super.validate();

    if (valid) {
      if (StringUtils.isBlank(name)) {
        logger.error("Error validating " + this.getClass().getSimpleName() + " name cannot be blank");
        valid = false;
      }
    }

    return valid;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public String getBirthDate() {
    return birthDate;
  }

  public void setBirthDate(String birthDate) {
    this.birthDate = birthDate;
  }

  public Map<String, String> getParameters() {
    Map<String, String> params = new HashMap<String, String>();
    params.put("name", name);
    params.put("gender", gender);
    params.put("userId", userId.toString());
    params.put("storeId", storeId.toString());
    params.put("birthDate", birthDate);
    return params;
  }
}
