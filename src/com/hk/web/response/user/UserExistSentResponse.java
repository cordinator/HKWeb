package com.hk.web.response.user;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.response.GenericResponse;

import java.util.List;

public class UserExistSentResponse extends GenericResponse {

  private boolean userExist;

  public boolean isUserExist() {
    return userExist;
  }

  public void setUserExist(boolean userExist) {
    this.userExist = userExist;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys  = super.getKeys();
    keys.add(DtoJsonConstants.USER_EXIST);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.userExist);
    return values;
  }
}
