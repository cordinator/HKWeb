package com.hk.api.response.user.wrapper;


import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.user.response.UserTempResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

public class UserTempApiResponseWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private UserTempResponse userTempResponse;

  public UserTempResponse getUserTempResponse() {
    return userTempResponse;
  }

  public void setUserTempResponse(UserTempResponse userTempResponse) {
    this.userTempResponse = userTempResponse;
  }
}
