package com.hk.api.response.user.response.account;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.user.response.activation.UserActivationTokenApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class UserEmailUpdateApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.USER_ACCOUNT_UPDATE_RESP)
  private UserAccountUpdateApiResponse userAccountUpdateApiResponse;
  @JsonProperty(DtoJsonConstants.ACTIVATION_TOKEN)
  private UserActivationTokenApiResponse userActivationTokenApiResponse;


  public UserAccountUpdateApiResponse getUserAccountUpdateApiResponse() {
    return userAccountUpdateApiResponse;
  }

  public void setUserAccountUpdateApiResponse(UserAccountUpdateApiResponse userAccountUpdateApiResponse) {
    this.userAccountUpdateApiResponse = userAccountUpdateApiResponse;
  }

  public UserActivationTokenApiResponse getUserActivationTokenApiResponse() {
    return userActivationTokenApiResponse;
  }

  public void setUserActivationTokenApiResponse(UserActivationTokenApiResponse userActivationTokenApiResponse) {
    this.userActivationTokenApiResponse = userActivationTokenApiResponse;
  }
}
