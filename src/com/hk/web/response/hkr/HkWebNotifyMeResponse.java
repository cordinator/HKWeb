package com.hk.web.response.hkr;


import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.response.GenericResponse;

import java.util.List;

public class HkWebNotifyMeResponse extends GenericResponse {

  private String name;
  private String email;
  private boolean isSubscribedForNotify;

  private String contactNumber;
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

  public boolean isSubscribedForNotify() {
    return isSubscribedForNotify;
  }

  public void setSubscribedForNotify(boolean subscribedForNotify) {
    isSubscribedForNotify = subscribedForNotify;
  }

  public String getContactNumber() {
    return contactNumber;
  }

  public void setContactNumber(String contactNumber) {
    this.contactNumber = contactNumber;
  }

  public String getAccountLink() {
    return accountLink;
  }

  public void setAccountLink(String accountLink) {
    this.accountLink = accountLink;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(DtoJsonConstants.NAME);
    keys.add(DtoJsonConstants.EMAIL);
    keys.add(DtoJsonConstants.CONTACT_NUMBER);
    keys.add(DtoJsonConstants.IS_SUBSCRIBED_FOR_NOTIFY);
    keys.add(DtoJsonConstants.ACCOUNT_LINK);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.name);
    values.add(this.email);
    values.add(this.contactNumber);
    values.add(this.isSubscribedForNotify);
    values.add(this.accountLink);
    return values;
  }
}
