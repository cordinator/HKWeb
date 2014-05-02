package com.hk.web.resource.location;

import com.hk.api.response.location.response.CityApiResponse;
import com.hk.api.response.location.response.CountryApiResponse;
import com.hk.api.response.location.response.PincodeApiResponse;
import com.hk.api.response.location.response.StateApiResponse;
import com.hk.constants.rest.HKWebRequestConstants;
import com.hk.pact.service.location.LocationService;
import com.hk.web.response.location.CitiesInStateResponse;
import com.hk.web.response.location.CountriesResponse;
import com.hk.web.response.location.PincodeResponse;
import com.hk.web.response.location.StatesInCountryResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 * @author Rimal
 */

@Component
@Path("/location/")
public class LocationResource {

  @Autowired
  private LocationService locationService;


  @GET
  @Path("/countries")
  public CountriesResponse getAllCountries() {
    CountriesResponse statesInCountryResponse = new CountriesResponse();

    CountryApiResponse countryResponse = getLocationService().getAllCountries();
    if (countryResponse != null && countryResponse.getCountries() != null) {
      statesInCountryResponse.setCountries(countryResponse.getCountries());
    }

    return statesInCountryResponse;
  }

  /*@GET
  @Path("/country/id/{countryId}/states")
  public StatesInCountryResponse getStatesInCountry(@PathParam(HKWebRequestConstants.COUNTRY_ID) Long countryId) {
    StatesInCountryResponse statesInCountryResponse = new StatesInCountryResponse();

    StateApiResponse stateResponse = getLocationService().getAllStatesForCountry(countryId);
    if (stateResponse != null && stateResponse.getStates() != null) {
      statesInCountryResponse.setStates(stateResponse.getStates());
    }

    return statesInCountryResponse;
  }*/

  @GET
  @Path("/country/code/{countryCode}/states")
  public StatesInCountryResponse getStatesInCountry(@PathParam(HKWebRequestConstants.COUNTRY_CODE) String countryCode) {
    StatesInCountryResponse statesInCountryResponse = new StatesInCountryResponse();

    StateApiResponse stateResponse = getLocationService().getAllStatesForCountry(countryCode);
    if (stateResponse != null && stateResponse.getStates() != null) {
      statesInCountryResponse.setStates(stateResponse.getStates());
    }

    return statesInCountryResponse;
  }

  @GET
  @Path("/{stateId}/cities")
  public CitiesInStateResponse getCitiesForState(@PathParam(HKWebRequestConstants.STATE_ID) Long stateId) {
    CitiesInStateResponse citiesInStateResponse = new CitiesInStateResponse();

    CityApiResponse cityApiResponse = getLocationService().getAllCitiesForState(stateId);
    if (cityApiResponse != null && cityApiResponse.getCities() != null) {
      citiesInStateResponse.setCityList(cityApiResponse.getCities());
    }

    return citiesInStateResponse;
  }

  /*@GET
  @Path("/{cityId}/places")
  public PlacesInCityResponse getPlacesForCity(@PathParam(HKWebRequestConstants.CITY_ID) Long cityId) {
    PlacesInCityResponse placesInCityResponse = new PlacesInCityResponse();

    PlaceApiResponse placeResponse = getLocationService().getAllPlacesForCity(cityId);
    if (placeResponse != null && placeResponse.getPlaces() != null) {
      placesInCityResponse.setPlaces(placeResponse.getPlaces());
    }

    return placesInCityResponse;
  }*/

  @GET
  @Path("/{pincode}/location/details")
  @Produces("application/json")
  public PincodeResponse getLocationDetailsFromPincode(@PathParam(HKWebRequestConstants.PINCODE) String pincodeString) {
    PincodeResponse pincodeResponse = new PincodeResponse();

    PincodeApiResponse pincodeApiResponse = getLocationService().getLocationDetailsFromPincode(pincodeString);
    if (pincodeApiResponse != null && pincodeApiResponse.getPincode() != null) {
      pincodeResponse.setPincode(pincodeApiResponse.getPincode());
    }

    return pincodeResponse;
  }


  public LocationService getLocationService() {
    return locationService;
  }
}