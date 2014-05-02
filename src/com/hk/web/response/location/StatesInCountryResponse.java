package com.hk.web.response.location;

import com.hk.web.response.GenericResponse;
import com.hk.api.response.location.State;
import com.hk.constants.rest.HKWebJsonConstants;

import java.util.List;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 18, 2013
 * Time: 7:17:24 PM
 */
public class StatesInCountryResponse extends GenericResponse {

  private List<State> states = new ArrayList<State>();


  public List<State> getStates() {
    return states;
  }

  public void setStates(List<State> states) {
    this.states = states;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(HKWebJsonConstants.STATES);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.states);
    return values;
  }
}
