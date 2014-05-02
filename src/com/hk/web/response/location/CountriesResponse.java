package com.hk.web.response.location;

import com.hk.api.response.location.Country;
import com.hk.constants.rest.HKWebJsonConstants;
import com.hk.web.response.GenericResponse;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class CountriesResponse extends GenericResponse {

  private List<Country> countries = new ArrayList<Country>(0);


  public List<Country> getCountries() {
    return countries;
  }

  public void setCountries(List<Country> countries) {
    this.countries = countries;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(HKWebJsonConstants.COUNTRIES);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.countries);
    return values;
  }
}
