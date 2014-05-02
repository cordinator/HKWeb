package com.hk.api.response.variant.config;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;
import com.hk.api.response.variant.config.VariantConfigOptionValue;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class VariantConfigOption {

  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.DISPLAY_NAME)
  private String displayName;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private int displayOrder;

  @JsonProperty(DtoJsonConstants.VALUES)
  private List<VariantConfigOptionValue> configOptionValueList = new ArrayList<VariantConfigOptionValue>();


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

  public List<VariantConfigOptionValue> getConfigOptionValueList() {
    return configOptionValueList;
  }

  public void setConfigOptionValueList(List<VariantConfigOptionValue> configOptionValueList) {
    this.configOptionValueList = configOptionValueList;
  }
}
