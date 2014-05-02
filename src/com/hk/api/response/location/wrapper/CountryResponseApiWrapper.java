package com.hk.api.response.location.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.location.response.CountryApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class CountryResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private CountryApiResponse countryResponse;


  public CountryApiResponse getCountryResponse() {
    return countryResponse;
  }

  public void setCountryResponse(CountryApiResponse countryResponse) {
    this.countryResponse = countryResponse;
  }
}