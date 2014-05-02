package com.hk.api.response.variant.config;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class VariantConfigOptionValue {

  @JsonProperty(DtoJsonConstants.VALUE)
  private String value;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private int displayOrder;


  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }

  public int getDisplayOrder() {
    return displayOrder;
  }

  public void setDisplayOrder(int displayOrder) {
    this.displayOrder = displayOrder;
  }
}
