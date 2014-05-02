package com.hk.api.response.variant.attribute;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class VariantAttributeValue {

  @JsonProperty(DtoJsonConstants.DISPLAY_VALUE)
  private String displayValue;
  @JsonProperty(DtoJsonConstants.FILTER_VALUE)
  private String internalValue;

  @JsonProperty(DtoJsonConstants.COUNT)
  private int count;

  @JsonProperty(DtoJsonConstants.OPTION_VAL_TYPE)
  private Long optionValueType;
  @JsonProperty(DtoJsonConstants.IMAGE)
  private VariantDetailGroupValueImageDTO imageDTO;


  public String getDisplayValue() {
    return displayValue;
  }

  public void setDisplayValue(String displayValue) {
    this.displayValue = displayValue;
  }

  public String getInternalValue() {
    return internalValue;
  }

  public void setInternalValue(String internalValue) {
    this.internalValue = internalValue;
  }

  public int getCount() {
    return count;
  }

  public void setCount(int count) {
    this.count = count;
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
