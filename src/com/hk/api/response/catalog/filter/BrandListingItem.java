package com.hk.api.response.catalog.filter;

import org.codehaus.jackson.annotate.JsonProperty;
import com.hk.common.constants.DtoJsonConstants;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 5, 2013
 * Time: 7:31:28 PM
 */
public class BrandListingItem {

  @JsonProperty(DtoJsonConstants.NAME)
  private String brandName;

  @JsonProperty(DtoJsonConstants.INTERNAL_NAME)
  private String brandInternalName;
  @JsonProperty(DtoJsonConstants.NO_PRODUCT)
  private int noOfVariants;

  @JsonProperty(DtoJsonConstants.ID)
  private long brandId;

  @JsonProperty(DtoJsonConstants.SELECTED)
  private boolean selected;


  public String getBrandName() {
    return brandName;
  }

  public void setBrandName(String brandName) {
    this.brandName = brandName;
  }

  public String getBrandInternalName() {
    return brandInternalName;
  }

  public void setBrandInternalName(String brandInternalName) {
    this.brandInternalName = brandInternalName;
  }

  public int getNoOfVariants() {
    return noOfVariants;
  }

  public void setNoOfVariants(int noOfVariants) {
    this.noOfVariants = noOfVariants;
  }

  public long getBrandId() {
    return brandId;
  }

  public void setBrandId(long brandId) {
    this.brandId = brandId;
  }

  public boolean isSelected() {
    return selected;
  }

  public void setSelected(boolean selected) {
    this.selected = selected;
  }
}
