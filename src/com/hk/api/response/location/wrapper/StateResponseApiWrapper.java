package com.hk.api.response.location.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.location.response.StateApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class StateResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private StateApiResponse stateResponse;


  public StateApiResponse getStateResponse() {
    return stateResponse;
  }

  public void setStateResponse(StateApiResponse stateResponse) {
    this.stateResponse = stateResponse;
  }
}
