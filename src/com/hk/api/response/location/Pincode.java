package com.hk.api.response.location;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.common.json.JSONObject;
import com.hk.constants.rest.HKWebJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class Pincode extends JSONObject {

  @JsonProperty(DtoJsonConstants.ID)
  private Long id;
  @JsonProperty(DtoJsonConstants.PINCODE)
  private String pincode;

  @JsonProperty(DtoJsonConstants.CITY_ID)
  private Long cityId;
  @JsonProperty(DtoJsonConstants.CITY_NAME)
  private String cityName;

  @JsonProperty(DtoJsonConstants.STATE_ID)
  private Long stateId;
  @JsonProperty(DtoJsonConstants.STATE_NAME)
  private String stateName;


  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getPincode() {
    return pincode;
  }

  public void setPincode(String pincode) {
    this.pincode = pincode;
  }

  public Long getCityId() {
    return cityId;
  }

  public void setCityId(Long cityId) {
    this.cityId = cityId;
  }

  public String getCityName() {
    return cityName;
  }

  public void setCityName(String cityName) {
    this.cityName = cityName;
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

  @Override
  protected List<String> getKeys() {
    List<String> keys = new ArrayList<String>();
    keys.add(HKWebJsonConstants.ID);
    keys.add(HKWebJsonConstants.PINCODE);
    keys.add(HKWebJsonConstants.CITY_ID);
    keys.add(HKWebJsonConstants.CITY_NAME);
    keys.add(HKWebJsonConstants.STATE_ID);
    keys.add(HKWebJsonConstants.STATE_NAME);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = new ArrayList<Object>();
    values.add(this.id);
    values.add(this.pincode);
    values.add(this.cityId);
    values.add(this.cityName);
    values.add(this.stateId);
    values.add(this.stateName);
    return values;
  }
}