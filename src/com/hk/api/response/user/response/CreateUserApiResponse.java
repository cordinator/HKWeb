package com.hk.api.response.user.response;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.user.response.activation.UserActivationTokenApiResponse;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 31, 2013
 * Time: 4:12:54 PM
 */
public class CreateUserApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.USER)
  private UserApiResponse userResponse;

  @JsonProperty(DtoJsonConstants.ACTIVATION_TOKEN)
  private UserActivationTokenApiResponse activationTokenResponse;
  @JsonProperty(DtoJsonConstants.ACTIVE)
  private boolean activated;


  public CreateUserApiResponse() {
  }


  public UserApiResponse getUserResponse() {
    return userResponse;
  }

  public void setUserResponse(UserApiResponse userResponse) {
    this.userResponse = userResponse;
  }

  public UserActivationTokenApiResponse getActivationTokenResponse() {
    return activationTokenResponse;
  }

  public void setActivationTokenResponse(UserActivationTokenApiResponse activationTokenResponse) {
    this.activationTokenResponse = activationTokenResponse;
  }

  public boolean isActivated() {
    return activated;
  }

  public void setActivated(boolean activated) {
    this.activated = activated;
  }
}