package com.hk.api.response.autocompleter.response;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.common.json.JSONObject;
import com.hk.web.manager.LinkManager;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 17, 2013
 * Time: 9:05:31 PM
 */
public class AutoCompleterResponseItem extends JSONObject {

  @JsonProperty(DtoJsonConstants.NAME)
  protected String fullName;
  @JsonProperty(DtoJsonConstants.TYPE)
  private int type;
  @JsonProperty(DtoJsonConstants.VALUE)
  protected String value;

  @JsonProperty(DtoJsonConstants.NAV_KEY)
  protected String navKey;
  @JsonProperty(DtoJsonConstants.URL_FRAGMENT)
  protected String urlFragment;


  public String getFullName() {
    return fullName;
  }

  public void setFullName(String fullName) {
    this.fullName = fullName;
  }

  public int getType() {
    return type;
  }

  public void setType(int type) {
    this.type = type;
  }

  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }

  public String getNavKey() {
    return navKey;
  }

  public void setNavKey(String navKey) {
    this.navKey = navKey;
  }

  public String getUrlFragment() {
    return urlFragment;
  }

  public void setUrlFragment(String urlFragment) {
    this.urlFragment = urlFragment;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys = new ArrayList<String>();
    keys.add(DtoJsonConstants.NAME);
    keys.add(DtoJsonConstants.TYPE);
    keys.add(DtoJsonConstants.VALUE);
    keys.add(DtoJsonConstants.URL);


    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = new ArrayList<Object>();
    values.add(this.fullName);
    values.add(this.type);
    values.add(this.value);
    values.add(LinkManager.getAutoCompleterItemUrl(this));


    return values;
  }
}
