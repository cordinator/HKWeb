package com.hk.web.response.hkr;


import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.response.GenericResponse;

import java.util.ArrayList;
import java.util.List;

public class HkWebSpeakToResponse extends GenericResponse{

  private String name;
  private String email;

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

  @Override
  protected List<String> getKeys() {
    List<String> keys = new ArrayList<String>();
    keys.add(DtoJsonConstants.NAME);
    keys.add(DtoJsonConstants.EMAIL);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = new ArrayList<Object>();
    values.add(this.name);
    values.add(this.email);
    return values;
  }
}
