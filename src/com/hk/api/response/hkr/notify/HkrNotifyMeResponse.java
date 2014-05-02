package com.hk.api.response.hkr.notify;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;


public class HkrNotifyMeResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.EMAIL)
  private String email;
  @JsonProperty(DtoJsonConstants.CONTACT_NUMBER)
  private String contactNumber;
  @JsonProperty(DtoJsonConstants.IS_SUBSCRIBED_FOR_NOTIFY)
  private boolean isSubscribedForNotify;
  @JsonProperty(DtoJsonConstants.ACCOUNT_LINK)
  private String accountLink;

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

  public boolean isSubscribedForNotify() {
    return isSubscribedForNotify;
  }

  public void setSubscribedForNotify(boolean subscribedForNotify) {
    isSubscribedForNotify = subscribedForNotify;
  }

  public String getAccountLink() {
    return accountLink;
  }

  public void setAccountLink(String accountLink) {
    this.accountLink = accountLink;
  }
}
