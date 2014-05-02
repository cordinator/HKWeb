package com.hk.api.response.ui.base.header.category;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.manager.LinkManager;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 6:18:46 PM
 */
public class PageCategoryHeader {

  @JsonProperty(DtoJsonConstants.ID)
  private Long id;
  @JsonProperty(DtoJsonConstants.DISPLAY_NAME)
  private String displayName;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private Long displayOrder;

  @JsonProperty(DtoJsonConstants.NAV_KEY)
  private String navKey;

  @JsonProperty(DtoJsonConstants.URL_FRAGMENT)
  private String urlFragment;

  @JsonProperty(DtoJsonConstants.HEADER_IMAGE)
  private PageCategoryHeaderImage headerImage;
  @JsonProperty(DtoJsonConstants.CAT_HEADER_ITEMS)
  private List<PageCategoryHeaderItem> items = new LinkedList<PageCategoryHeaderItem>();


  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getDisplayName() {
    return displayName;
  }

  public void setDisplayName(String displayName) {
    this.displayName = displayName;
  }

  public Long getDisplayOrder() {
    return displayOrder;
  }

  public void setDisplayOrder(Long displayOrder) {
    this.displayOrder = displayOrder;
  }

  public PageCategoryHeaderImage getHeaderImage() {
    return headerImage;
  }

  public void setHeaderImage(PageCategoryHeaderImage headerImage) {
    this.headerImage = headerImage;
  }

  public List<PageCategoryHeaderItem> getItems() {
    return items;
  }

  public void setItems(List<PageCategoryHeaderItem> items) {
    this.items = items;
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
}
