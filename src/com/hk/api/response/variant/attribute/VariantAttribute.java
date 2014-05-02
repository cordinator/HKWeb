package com.hk.api.response.variant.attribute;

import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

import com.hk.common.constants.DtoJsonConstants;

/**
 * @author Rimal
 */
public class VariantAttribute {

  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.DISPLAY_NAME)
  private String displayName;

  @JsonProperty(DtoJsonConstants.VALUES)
  private List<VariantAttributeValue> attrValues = new ArrayList<VariantAttributeValue>();

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

  public List<VariantAttributeValue> getAttrValues() {
    return attrValues;
  }

  public void setAttrValues(List<VariantAttributeValue> attrValues) {
    this.attrValues = attrValues;
  }
}
