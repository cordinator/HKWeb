package com.hk.api.response.ui.base.url;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class UrlIdentifiers {

  @JsonProperty(DtoJsonConstants.NAV_KEY)
  private String navKey;
  @JsonProperty(DtoJsonConstants.URL_FRAGMENT)
  private String urlFragment;


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
