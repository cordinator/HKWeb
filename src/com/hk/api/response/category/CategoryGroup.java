package com.hk.api.response.category;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class CategoryGroup {

  @JsonProperty(DtoJsonConstants.CAT_PREFIX)
  private String categoryPrefix;
  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.DISPLAY_NAME)
  private String displayName;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private int displayOrder;

  @JsonProperty(DtoJsonConstants.ATTRIBUTES)
  private List<CategoryGroupValue> categoryGroupValueList = new ArrayList<CategoryGroupValue>(0);


  public String getCategoryPrefix() {
    return categoryPrefix;
  }

  public void setCategoryPrefix(String categoryPrefix) {
    this.categoryPrefix = categoryPrefix;
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

  public int getDisplayOrder() {
    return displayOrder;
  }

  public void setDisplayOrder(int displayOrder) {
    this.displayOrder = displayOrder;
  }

  public List<CategoryGroupValue> getCategoryGroupValueList() {
    return categoryGroupValueList;
  }

  public void setCategoryGroupValueList(List<CategoryGroupValue> categoryGroupValueList) {
    this.categoryGroupValueList = categoryGroupValueList;
  }
}
