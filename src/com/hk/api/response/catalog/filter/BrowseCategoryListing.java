package com.hk.api.response.catalog.filter;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.common.json.JSONObject;
import com.hk.web.manager.LinkManager;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Sep 11, 2013
 * Time: 5:01:59 PM
 */
public class BrowseCategoryListing extends JSONObject {

  @JsonProperty(DtoJsonConstants.CAT_PREFIX)
  private String categoryPrefix;
  @JsonProperty(DtoJsonConstants.NAME)
  private String name;

  @JsonProperty(DtoJsonConstants.NO_PRODUCT)
  private int noOfVariants;

  @JsonProperty(DtoJsonConstants.NAV_KEY)
  private String navKey;

  @JsonProperty(DtoJsonConstants.URL_FRAGMENT)
  private String urlFragment;

  

  public String getCategoryPrefix() {
    return categoryPrefix;
  }

  public void setCategoryPrefix(String categoryPrefix) {
    this.categoryPrefix = categoryPrefix;
  }

  public String getName() {
    return name;
  }

  public String getUrl(){
    return LinkManager.getBrandCategoryPageUrl(this);
  }
  public void setName(String name) {
    this.name = name;
  }

  public int getNoOfVariants() {
    return noOfVariants;
  }

  public void setNoOfVariants(int noOfVariants) {
    this.noOfVariants = noOfVariants;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keyList = new ArrayList<String>(0);

    keyList.add(DtoJsonConstants.CAT_PREFIX);
    keyList.add(DtoJsonConstants.NAME);
    keyList.add(DtoJsonConstants.NO_PRODUCT);
    keyList.add(DtoJsonConstants.URL);

    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> valueList = new ArrayList<Object>(0);

    valueList.add(this.categoryPrefix);
    valueList.add(this.name);
    valueList.add(this.noOfVariants);
    valueList.add(LinkManager.getBrandCategoryPageUrl(this));

    return valueList;
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
}
