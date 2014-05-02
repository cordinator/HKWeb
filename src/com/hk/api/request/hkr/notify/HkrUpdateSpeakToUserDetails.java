package com.hk.api.request.hkr.notify;


import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.HashMap;
import java.util.Map;

public class HkrUpdateSpeakToUserDetails {

  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.EMAIL)
  private String email;
  @JsonProperty(DtoJsonConstants.CONTACT_NUMBER)
  private String contactNumber;
  @JsonProperty(DtoJsonConstants.SUBSCRIBE)
  private Boolean subscribe;
  @JsonProperty(DtoJsonConstants.CATEGORY_NAME)
  private String categoryName;

  public Map<String, String> getParameters(){
    Map<String, String> parameters = new HashMap<String, String>();
    parameters.put(DtoJsonConstants.NAME, this.name);
    parameters.put(DtoJsonConstants.EMAIL, this.email);
    parameters.put(DtoJsonConstants.CONTACT_NUMBER, this.contactNumber);
    parameters.put(DtoJsonConstants.SUBSCRIBE, this.subscribe.toString());
    parameters.put(DtoJsonConstants.CATEGORY_NAME, this.categoryName);
    return parameters;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getContactNumber() {
    return contactNumber;
  }

  public void setContactNumber(String contactNumber) {
    this.contactNumber = contactNumber;
  }

  public Boolean getSubscribe() {
    return subscribe!=null ? subscribe.booleanValue() : false;
  }

  public void setSubscribe(Boolean subscribe) {
    this.subscribe = subscribe!=null ? subscribe : false;
  }

  public String getCategoryName() {
    return categoryName;
  }

  public void setCategoryName(String categoryName) {
    this.categoryName = categoryName;
  }
}
