package com.hk.api.response.user.wrapper.activation;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.user.response.activation.UserActivationTokenApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class UserActivationTokenResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private UserActivationTokenApiResponse userActivationTokenResponse;


  public UserActivationTokenApiResponse getUserActivationTokenResponse() {
    return userActivationTokenResponse;
  }

  public void setUserActivationTokenResponse(UserActivationTokenApiResponse userActivationTokenResponse) {
    this.userActivationTokenResponse = userActivationTokenResponse;
  }
}
