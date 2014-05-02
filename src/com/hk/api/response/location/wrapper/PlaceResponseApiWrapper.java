package com.hk.api.response.location.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.location.response.PlaceApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class PlaceResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private PlaceApiResponse placeResponse;


  public PlaceApiResponse getPlaceResponse() {
    return placeResponse;
  }

  public void setPlaceResponse(PlaceApiResponse placeResponse) {
    this.placeResponse = placeResponse;
  }
}
