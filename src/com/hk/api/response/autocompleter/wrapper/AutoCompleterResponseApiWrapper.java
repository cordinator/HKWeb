package com.hk.api.response.autocompleter.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.autocompleter.response.AutoCompleterApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 4, 2013
 * Time: 3:04:44 PM
 */


public class AutoCompleterResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private AutoCompleterApiResponse autoCompleterApiResponse;


  public AutoCompleterApiResponse getAutoCompleterApiResponse() {
    return autoCompleterApiResponse;
  }

  public void setAutoCompleterApiResponse(AutoCompleterApiResponse autoCompleterApiResponse) {
    this.autoCompleterApiResponse = autoCompleterApiResponse;
  }
}
