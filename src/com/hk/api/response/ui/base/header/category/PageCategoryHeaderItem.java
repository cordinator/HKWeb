package com.hk.api.response.ui.base.header.category;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.manager.LinkManager;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 6:18:36 PM
 */
public class PageCategoryHeaderItem {

  @JsonProperty(DtoJsonConstants.DISPLAY_NAME)
  private String displayName;

  @JsonProperty(DtoJsonConstants.NAV_KEY)
  private String navKey;

  @JsonProperty(DtoJsonConstants.URL_FRAGMENT)
  private String urlFragment;

  /* @JsonProperty(DtoJsonConstants.PAGE_TYPE)
private Long pageTypeId;
@JsonProperty(DtoJsonConstants.PAGE_TYPE_VAL)
private String pageTypeValue;*/
  /* @JsonProperty(DtoJsonConstants.CAT_PREFIX)
private String catPrefix;*/

  public String getDisplayName() {
    return displayName;
  }

  public void setDisplayName(String displayName) {
    this.displayName = displayName;
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

  public String getUrl() {
    return LinkManager.getPCHItemUrl(this.urlFragment, this.navKey);
  }

  /*public Long getPageTypeId() {
    return pageTypeId;
  }

  public void setPageTypeId(Long pageTypeId) {
    this.pageTypeId = pageTypeId;
  }

  public String getPageTypeValue() {
    return pageTypeValue;
  }

  public void setPageTypeValue(String pageTypeValue) {
    this.pageTypeValue = pageTypeValue;
  }*/

  /* public String getCatPrefix() {
    return catPrefix;
  }

  public void setCatPrefix(String catPrefix) {
    this.catPrefix = catPrefix;
  }*/
}
