package com.hk.api.response.location.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.location.Place;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;
import java.util.ArrayList;

/**
 * @author Rimal
 */
public class PlaceApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.PLACES)
  private List<Place> places = new ArrayList<Place>(0);


  public List<Place> getPlaces() {
    return places;
  }

  public void setPlaces(List<Place> places) {
    this.places = places;
  }
}
