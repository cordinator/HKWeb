package com.hk.api.response.ui.base.breadcrumb;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.manager.LinkManager;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Sep 17, 2013
 * Time: 1:24:43 PM
 */
public class BreadCrumb {

  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.NAV_KEY)
  private String navKey;
  @JsonProperty(DtoJsonConstants.URL_FRAGMENT)
  private String urlFragment;
  @JsonProperty(DtoJsonConstants.TYPE)
  private int type;

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
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

  public int getType() {
    return type;
  }

  public void setType(int type) {
    this.type = type;
  }

  public String getUrl() {
    switch (this.type) {
      case BreadCrumbType.HOME:
        return LinkManager.getHomePageUrl();
      case BreadCrumbType.CATEGORY:
      case BreadCrumbType.CATALOG:
      case BreadCrumbType.MENU_NODE:

        return LinkManager.getGenericLandingPageUrl(this.urlFragment, this.navKey);
      case BreadCrumbType.BRAND_LISTING:
        return LinkManager.getBrandListingUrl();

      case BreadCrumbType.LAST:
        return "#";

    }

    return "#";
  }
}
