package com.hk.api.request.user;

import org.apache.commons.lang.StringUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 30, 2013
 * Time: 5:26:41 PM
 */
public class CreateUserRequest {

  private String email;
  private String name;
  private String password;
  private String roleName;

  private Long referredByUserId;
  private Long guestUserId;

  private Long storeId;


  public boolean validate() {
    boolean valid = true;

    if (StringUtils.isBlank(email)) {
      valid = false;
    }
    if (valid && StringUtils.isBlank(password)) {
      valid = false;
    }

    return valid;
  }


  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getRoleName() {
    return roleName;
  }

  public void setRoleName(String roleName) {
    this.roleName = roleName;
  }

  public Long getReferredByUserId() {
    return referredByUserId;
  }

  public void setReferredByUserId(Long referredByUserId) {
    this.referredByUserId = referredByUserId;
  }

  public Long getGuestUserId() {
    return guestUserId;
  }

  public void setGuestUserId(Long guestUserId) {
    this.guestUserId = guestUserId;
  }

  public Map<String, String> getParameters() {

    Map<String, String> params = new HashMap<String, String>();
    params.put("email", email);
    params.put("name", name);
    params.put("password", password);
    if (StringUtils.isNotBlank(roleName)) {
      params.put("roleName", roleName);
    }
    params.put("storeId", storeId.toString());
    if (referredByUserId != null) {
      params.put("referredByUserId", referredByUserId.toString());
    }
    if (guestUserId != null) {
      params.put("guestUserId", guestUserId.toString());
    }
    return params;
  }


  public Long getStoreId() {
    return storeId;
  }

  public void setStoreId(Long storeId) {
    this.storeId = storeId;
  }
}
