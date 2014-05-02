package com.hk.api.response.payment;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class BaseOrderAddress {

    @JsonProperty(DtoJsonConstants.NAME)
    private String name;
    @JsonProperty(DtoJsonConstants.LINE1)
    private String line1;
    @JsonProperty(DtoJsonConstants.LANDMARK)
    private String landMark;
    @JsonProperty(DtoJsonConstants.CONTACT_NUMBER)
    private String contactNumber;
    @JsonProperty(DtoJsonConstants.ALTERNATE_CONTACT_NUMBER)
    private String alternateContactNumber;

    @JsonProperty(DtoJsonConstants.STATE_NAME)
    private String stateName;
    @JsonProperty(DtoJsonConstants.CITY_NAME)
    private String cityName;
    @JsonProperty(DtoJsonConstants.PLACE_NAME)
    private String placeName;
    @JsonProperty(DtoJsonConstants.PINCODE)
    private String pincode;


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

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getStateName() {
        return stateName;
    }

    public void setStateName(String stateName) {
        this.stateName = stateName;
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

    public String getLandMark() {
        return landMark;
    }

    public void setLandMark(String landMark) {
        this.landMark = landMark;
    }

    public String getAlternateContactNumber() {
        return alternateContactNumber;
    }

    public void setAlternateContactNumber(String alternateContactNumber) {
        this.alternateContactNumber = alternateContactNumber;
    }
}
