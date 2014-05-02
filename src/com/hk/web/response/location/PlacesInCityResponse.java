package com.hk.web.response.location;

import com.hk.web.response.GenericResponse;
import com.hk.api.response.location.Place;
import com.hk.constants.rest.HKWebJsonConstants;

import java.util.List;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 18, 2013
 * Time: 7:17:48 PM
 */
public class PlacesInCityResponse extends GenericResponse {

  private List<Place> places = new ArrayList<Place>();


  public List<Place> getPlaces() {
    return places;
  }

  public void setPlaces(List<Place> places) {
    this.places = places;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(HKWebJsonConstants.PLACES);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.places);
    return values;
  }
}
