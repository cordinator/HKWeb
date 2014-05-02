package com.hk.api.response.category;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class CategoryGroupValue {

  @JsonProperty(DtoJsonConstants.NAME)
  private String name;  //this is the internal name
  @JsonProperty(DtoJsonConstants.DISPLAY_NAME)
  private String displayName;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private int displayOrder;
  @JsonProperty(DtoJsonConstants.MANDATORY)
  private boolean mandatory;


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

  public boolean isMandatory() {
    return mandatory;
  }

  public void setMandatory(boolean mandatory) {
    this.mandatory = mandatory;
  }
}
