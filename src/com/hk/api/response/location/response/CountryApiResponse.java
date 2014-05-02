package com.hk.api.response.location.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.location.Country;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class CountryApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.COUNTRIES)
  private List<Country> countries = new ArrayList<Country>(0);


  public List<Country> getCountries() {
    return countries;
  }

  public void setCountries(List<Country> countries) {
    this.countries = countries;
  }
}
