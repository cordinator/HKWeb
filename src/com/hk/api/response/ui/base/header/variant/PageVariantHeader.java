package com.hk.api.response.ui.base.header.variant;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 6:18:02 PM
 */
public class PageVariantHeader {


  @JsonProperty(DtoJsonConstants.DISPLAY_NAME)
  private String displayName;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private Long displayOrder;
  @JsonProperty(DtoJsonConstants.VARIANT_HEADER_ITEMS)
  private List<PageVariantHeaderItem> items = new ArrayList<PageVariantHeaderItem>();


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

  public List<PageVariantHeaderItem> getItems() {
    return items;
  }

  public void setItems(List<PageVariantHeaderItem> items) {
    this.items = items;
  }
}
