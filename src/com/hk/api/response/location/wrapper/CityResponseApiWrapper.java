package com.hk.api.response.location.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.location.response.CityApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class CityResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private CityApiResponse cityApiResponse;


  public CityApiResponse getCityApiResponse() {
    return cityApiResponse;
  }

  public void setCityApiResponse(CityApiResponse cityApiResponse) {
    this.cityApiResponse = cityApiResponse;
  }
}
