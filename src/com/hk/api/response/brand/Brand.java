package com.hk.api.response.brand;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.manager.LinkManager;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class Brand {

  @JsonProperty(DtoJsonConstants.ID)
  private Long id;
  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.DISPLAY_NAME)
  private String displayName;
  @JsonProperty(DtoJsonConstants.RANK)
  private Long rank;

  @JsonProperty(DtoJsonConstants.NAV_KEY)
  private String navKey;
  @JsonProperty(DtoJsonConstants.URL_FRAGMENT)
  private String urlFragment;


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

  public String getDisplayName() {
    return displayName;
  }

  public void setDisplayName(String displayName) {
    this.displayName = displayName;
  }

  public Long getRank() {
    return rank;
  }

  public void setRank(Long rank) {
    this.rank = rank;
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
    return LinkManager.getBrandPageUrl(this);
  }
}
