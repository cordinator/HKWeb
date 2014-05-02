package com.hk.api.response.location.response;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.location.State;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class StateApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.STATES)
  private List<State> states = new ArrayList<State>(0);


  public List<State> getStates() {
    return states;
  }

  public void setStates(List<State> states) {
    this.states = states;
  }
}
