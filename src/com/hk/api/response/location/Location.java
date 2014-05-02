package com.hk.api.response.location;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.common.json.JSONObject;
import com.hk.constants.rest.HKWebJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;
import java.util.ArrayList;

/**
 * @author Rimal
 */
public abstract class Location extends JSONObject {

  @JsonProperty(DtoJsonConstants.ID)
  protected Long id;
  @JsonProperty(DtoJsonConstants.NAME)
  protected String name;


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


  @Override
  protected List<String> getKeys() {
    List<String> keys = new ArrayList<String>();
    keys.add(HKWebJsonConstants.ID);
    keys.add(HKWebJsonConstants.NAME);

    return keys;

  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = new ArrayList<Object>();
    values.add(this.id);
    values.add(this.name);

    return values;
  }
}
