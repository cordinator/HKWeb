package com.hk.api.response.variant.group;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Rimal
 */
public class VariantGroup {

  @JsonProperty(DtoJsonConstants.NAME)
  private String name;  // this is the internal name
  @JsonProperty(DtoJsonConstants.DISPLAY_NAME)
  private String displayName;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private int displayOrder;

  @JsonProperty(DtoJsonConstants.VALUES)
  private List<VariantGroupValue> groupValues = new ArrayList<VariantGroupValue>(0);

  List<VariantGroupValue> mandatoryGroupValues = null;
  private Map<String, VariantGroupValue> internalNameToValue = null;

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

  public List<VariantGroupValue> getGroupValues() {
    return groupValues;
  }

  public void setGroupValues(List<VariantGroupValue> groupValues) {
    this.groupValues = groupValues;
  }

  public VariantGroupValue getGroupValue(String valueInternalName) {
    if (internalNameToValue == null) {
      internalNameToValue = new HashMap<String, VariantGroupValue>(0);
      for (VariantGroupValue variantGroupValue : this.getGroupValues()) {
        internalNameToValue.put(variantGroupValue.getName(), variantGroupValue);
      }
    }

    return internalNameToValue.get(valueInternalName);
  }

  public List<VariantGroupValue> getMandatoryGroupValues() {
    if (mandatoryGroupValues == null) {
      mandatoryGroupValues = new ArrayList<VariantGroupValue>(0);
      for (VariantGroupValue groupValue : this.groupValues) {
        if (groupValue.isMandatory()) {
          mandatoryGroupValues.add(groupValue);
        }
      }
    }
    return mandatoryGroupValues;
  }

  /*public VariantGroupValue getMandatoryGroupValue(String valueInternalName) {
    if (internalNameToValue == null) {
      internalNameToValue = new HashMap<String, VariantGroupValue>(0);
      for (VariantGroupValue variantGroupValue : this.getMandatoryGroupValues()) {
        internalNameToValue.put(variantGroupValue.getName(), variantGroupValue);
      }
    }

    return internalNameToValue.get(valueInternalName);
  }*/
}