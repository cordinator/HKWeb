package com.hk.api.response.location.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.location.City;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class CityApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.CITIES)
  private List<City> cities = new ArrayList<City>(0);


  public List<City> getCities() {
    return cities;
  }

  public void setCities(List<City> cities) {
    this.cities = cities;
  }
}
