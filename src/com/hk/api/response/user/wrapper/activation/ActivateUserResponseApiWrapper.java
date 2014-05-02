package com.hk.api.response.user.wrapper.activation;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.user.response.activation.ActivateUserApiResponse;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class ActivateUserResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private ActivateUserApiResponse activateUserResponse;


  public ActivateUserApiResponse getActivateUserResponse() {
    return activateUserResponse;
  }

  public void setActivateUserResponse(ActivateUserApiResponse activateUserResponse) {
    this.activateUserResponse = activateUserResponse;
  }
}
