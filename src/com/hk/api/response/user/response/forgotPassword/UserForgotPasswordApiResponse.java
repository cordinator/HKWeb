package com.hk.api.response.user.response.forgotPassword;

import com.hk.api.response.user.response.AbstractTokenApiResponse;
import com.hk.api.response.user.response.UserApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class UserForgotPasswordApiResponse extends AbstractTokenApiResponse {

  @JsonProperty(DtoJsonConstants.USER_DETAILS)
  private UserApiResponse userApiResponse;

  public UserApiResponse getUserApiResponse() {
    return userApiResponse;
  }

  public void setUserApiResponse(UserApiResponse userApiResponse) {
    this.userApiResponse = userApiResponse;
  }
}
