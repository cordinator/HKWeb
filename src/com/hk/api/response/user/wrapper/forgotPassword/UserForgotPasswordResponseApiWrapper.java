package com.hk.api.response.user.wrapper.forgotPassword;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.user.response.forgotPassword.UserForgotPasswordApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class UserForgotPasswordResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private UserForgotPasswordApiResponse userForgotPasswordApiResponse;


  public UserForgotPasswordApiResponse getUserForgotPasswordApiResponse() {
    return userForgotPasswordApiResponse;
  }

  public void setUserForgotPasswordApiResponse(UserForgotPasswordApiResponse userForgotPasswordApiResponse) {
    this.userForgotPasswordApiResponse = userForgotPasswordApiResponse;
  }
}
