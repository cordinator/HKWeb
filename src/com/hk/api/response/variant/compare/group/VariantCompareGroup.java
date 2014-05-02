package com.hk.api.response.variant.compare.group;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class VariantCompareGroup {

  private String name;  // this is the internal name
  private String displayName;
  private int displayOrder;
  private List<VariantCompareGroupValue> groupValues = new ArrayList<VariantCompareGroupValue>();

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

  public List<VariantCompareGroupValue> getGroupValues() {
    return groupValues;
  }

  public void setGroupValues(List<VariantCompareGroupValue> groupValues) {
    this.groupValues = groupValues;
  }
}
