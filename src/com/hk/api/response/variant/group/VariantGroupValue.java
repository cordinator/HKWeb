package com.hk.api.response.variant.group;

import com.hk.api.response.variant.attribute.VariantDetailGroupValueImageDTO;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class VariantGroupValue {

  @JsonProperty(DtoJsonConstants.NAME)
  private String name;  //this is the internal name
  @JsonProperty(DtoJsonConstants.DISPLAY_NAME)
  private String displayName;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private int displayOrder;
  @JsonProperty(DtoJsonConstants.DISPLAY_VALUE)
  private String value;

  @JsonProperty(DtoJsonConstants.MANDATORY)
  private boolean mandatory;


  @JsonProperty(DtoJsonConstants.OPTION_VAL_TYPE)
  private Long optionValueType;
  @JsonProperty(DtoJsonConstants.IMAGE)
  private VariantDetailGroupValueImageDTO imageDTO;

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

  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }

  public boolean isMandatory() {
    return mandatory;
  }

  public void setMandatory(boolean mandatory) {
    this.mandatory = mandatory;
  }

  public Long getOptionValueType() {
    return optionValueType;
  }

  public void setOptionValueType(Long optionValueType) {
    this.optionValueType = optionValueType;
  }

  public VariantDetailGroupValueImageDTO getImageDTO() {
    return imageDTO;
  }

  public void setImageDTO(VariantDetailGroupValueImageDTO imageDTO) {
    this.imageDTO = imageDTO;
  }
}
