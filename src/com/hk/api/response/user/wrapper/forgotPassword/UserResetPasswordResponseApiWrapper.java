package com.hk.api.response.user.wrapper.forgotPassword;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.user.response.forgotPassword.UserResetPasswordApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class UserResetPasswordResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private UserResetPasswordApiResponse userResetPasswordApiResponse;


  public UserResetPasswordApiResponse getUserResetPasswordApiRepsonse() {
    return userResetPasswordApiResponse;
  }

  public void setUserResetPasswordApiRepsonse(UserResetPasswordApiResponse userResetPasswordApiResponse) {
    this.userResetPasswordApiResponse = userResetPasswordApiResponse;
  }
}
