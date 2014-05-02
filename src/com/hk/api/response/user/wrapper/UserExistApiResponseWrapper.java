package com.hk.api.response.user.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.user.response.UserExistApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;


public class UserExistApiResponseWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private UserExistApiResponse userExistApiResponse;

  public UserExistApiResponse getUserExistApiResponse() {
    return userExistApiResponse;
  }

  public void setUserExistApiResponse(UserExistApiResponse userExistApiResponse) {
    this.userExistApiResponse = userExistApiResponse;
  }
}
