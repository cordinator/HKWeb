package com.hk.pact.service.location;

import com.hk.api.response.location.response.CityApiResponse;
import com.hk.api.response.location.response.CountryApiResponse;
import com.hk.api.response.location.response.PincodeApiResponse;
import com.hk.api.response.location.response.StateApiResponse;

/**
 * @author Rimal
 */
public interface LocationService {

  public CountryApiResponse getAllCountries();

  public StateApiResponse getAllStatesForCountry(String countryCode);

//  public StateApiResponse getAllStatesForCountry(Long countryId);

  public CityApiResponse getAllCitiesForState(Long stateId);

//  public PlaceApiResponse getAllPlacesForCity(Long cityId);

  public PincodeApiResponse getLocationDetailsFromPincode(String pincodeString);
}
