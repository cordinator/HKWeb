package com.hk.api.response.location.address;

import org.codehaus.jackson.annotate.JsonProperty;
import com.hk.common.constants.DtoJsonConstants;

/**
 * @author Rimal
 */
public class Address {

  @JsonProperty(DtoJsonConstants.ID)
  private Long id;
  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.LINE1)
  private String line1;
  @JsonProperty(DtoJsonConstants.LANDMARK)
  private String landmark;
  @JsonProperty(DtoJsonConstants.CONTACT_NUMBER)
  private String contactNumber;
  @JsonProperty(DtoJsonConstants.ALTERNATE_CONTACT_NUMBER)
  private String alternateContactNumber;

  @JsonProperty(DtoJsonConstants.STATE_ID)
  private Long stateId;
  @JsonProperty(DtoJsonConstants.STATE_NAME)
  private String stateName;

  @JsonProperty(DtoJsonConstants.CITY_ID)
  private Long cityId;
  @JsonProperty(DtoJsonConstants.CITY_NAME)
  private String cityName;

  @JsonProperty(DtoJsonConstants.PLACE_ID)
  private Long placeId;
  @JsonProperty(DtoJsonConstants.PLACE_NAME)
  private String placeName;

  @JsonProperty(DtoJsonConstants.PINCODE_ID)
  private Long pincodeId;
  @JsonProperty(DtoJsonConstants.PINCODE)
  private String pincode;


  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getLine1() {
    return line1;
  }

  public void setLine1(String line1) {
    this.line1 = line1;
  }

  public String getLandmark() {
    return landmark;
  }

  public void setLandmark(String landmark) {
    this.landmark = landmark;
  }

  public String getContactNumber() {
    return contactNumber;
  }

  public void setContactNumber(String contactNumber) {
    this.contactNumber = contactNumber;
  }

  public String getAlternateContactNumber() {
    return alternateContactNumber;
  }

  public void setAlternateContactNumber(String alternateContactNumber) {
    this.alternateContactNumber = alternateContactNumber;
  }

  public Long getStateId() {
    return stateId;
  }

  public void setStateId(Long stateId) {
    this.stateId = stateId;
  }

  public String getStateName() {
    return stateName;
  }

  public void setStateName(String stateName) {
    this.stateName = stateName;
  }

  public Long getCityId() {
    return cityId;
  }

  public void setCityId(Long cityId) {
    this.cityId = cityId;
  }

  public Long getPincodeId() {
    return pincodeId;
  }

  public void setPincodeId(Long pincodeId) {
    this.pincodeId = pincodeId;
  }

  public Long getPlaceId() {
    return placeId;
  }

  public void setPlaceId(Long placeId) {
    this.placeId = placeId;
  }

  public String getCityName() {
    return cityName;
  }

  public void setCityName(String cityName) {
    this.cityName = cityName;
  }

  public String getPlaceName() {
    return placeName;
  }

  public void setPlaceName(String placeName) {
    this.placeName = placeName;
  }

  public String getPincode() {
    return pincode;
  }

  public void setPincode(String pincode) {
    this.pincode = pincode;
  }
}