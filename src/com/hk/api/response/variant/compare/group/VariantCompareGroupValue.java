package com.hk.api.response.variant.compare.group;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class VariantCompareGroupValue {

  private String name;  //this is the internal name
  private String displayName;
  private int displayOrder;
  private List<String> values = new ArrayList<String>(0);

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

  public List<String> getValues() {
    return values;
  }

  public void setValues(List<String> values) {
    this.values = values;
  }
}
