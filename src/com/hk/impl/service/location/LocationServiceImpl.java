package com.hk.impl.service.location;

import com.hk.api.response.location.response.CityApiResponse;
import com.hk.api.response.location.response.CountryApiResponse;
import com.hk.api.response.location.response.PincodeApiResponse;
import com.hk.api.response.location.response.StateApiResponse;
import com.hk.api.response.location.wrapper.CityResponseApiWrapper;
import com.hk.api.response.location.wrapper.CountryResponseApiWrapper;
import com.hk.api.response.location.wrapper.PincodeResponseApiWrapper;
import com.hk.api.response.location.wrapper.StateResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.location.LocationService;
import org.springframework.stereotype.Service;

/**
 * @author Rimal
 */
@Service
public class LocationServiceImpl implements LocationService {

  private static final String COUNTRY = "countries";
  //  private static final String COUNTRY_ID = "country/id/";
  private static final String COUNTRY_CODE = "country/code/";
  private static final String STATE = "/states";
  private static final String CITY = "/cities";
  //  private static final String PLACE_SERVICE_END_POINT = "/places";
  private static final String LOCATION_DETAILS_FROM_PINCODE = "/location/details";


  @Override
  public CountryApiResponse getAllCountries() {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.LOCATION + COUNTRY);

    CountryResponseApiWrapper countryResponseWrapper = (CountryResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), CountryResponseApiWrapper.class);
    if (countryResponseWrapper != null) {
      return countryResponseWrapper.getCountryResponse();
    }

    return null;
  }

  @Override
  public StateApiResponse getAllStatesForCountry(String countryCode) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.LOCATION + COUNTRY_CODE + countryCode + STATE);

    StateResponseApiWrapper stateResponseWrapper = (StateResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), StateResponseApiWrapper.class);
    if (stateResponseWrapper != null) {
      return stateResponseWrapper.getStateResponse();
    }

    return null;
  }

  /*@Override
  public StateApiResponse getAllStatesForCountry(Long countryId) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.LOCATION + COUNTRY_ID + countryId.toString() + STATE);

    StateResponseApiWrapper stateResponseWrapper = (StateResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), StateResponseApiWrapper.class);
    if (stateResponseWrapper != null) {
      return stateResponseWrapper.getStateResponse();
    }

    return null;
  }*/

  @Override
  public CityApiResponse getAllCitiesForState(Long stateId) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.LOCATION + stateId.toString() + CITY);

    CityResponseApiWrapper cityResponseApiWrapper = (CityResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), CityResponseApiWrapper.class);
    if (cityResponseApiWrapper != null) {
      return cityResponseApiWrapper.getCityApiResponse();
    }

    return null;
  }

  /*  @Override
public PlaceApiResponse getAllPlacesForCity(Long cityId) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.LOCATION + cityId.toString() + PLACE_SERVICE_END_POINT);

    PlaceResponseApiWrapper placeResponseWrapper = (PlaceResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), PlaceResponseApiWrapper.class);
    if (placeResponseWrapper != null) {
      return placeResponseWrapper.getPlaceResponse();
    }

    return null;
  }*/

  @Override
  public PincodeApiResponse getLocationDetailsFromPincode(String pincodeString) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.LOCATION + pincodeString + LOCATION_DETAILS_FROM_PINCODE);

    PincodeResponseApiWrapper pincodeResponseApiWrapper = (PincodeResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), PincodeResponseApiWrapper.class);
    if (pincodeResponseApiWrapper != null) {
      return pincodeResponseApiWrapper.getPincodeApiResponse();
    }

    return null;
  }

}