package com.hk.web.response.location;

import com.hk.web.response.GenericResponse;
import com.hk.api.response.location.City;
import com.hk.constants.rest.HKWebJsonConstants;

import java.util.List;
import java.util.ArrayList;

/**
 * @author Rimal
 */
public class CitiesInStateResponse extends GenericResponse {

  private List<City> cityList = new ArrayList<City>(0);


  public List<City> getCityList() {
    return cityList;
  }

  public void setCityList(List<City> cityList) {
    this.cityList = cityList;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(HKWebJsonConstants.CITIES);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.cityList);
    return values;
  }
}
