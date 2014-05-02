package com.hk.api.response.user.response;


import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

public class UserExistApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.USER_EXIST)
  private boolean isUserExist;

  public boolean isUserExist() {
    return isUserExist;
  }

  public void setUserExist(boolean userExist) {
    isUserExist = userExist;
  }
}
