package com.hk.api.response.pack;

import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;
import java.util.ArrayList;

import com.hk.common.constants.DtoJsonConstants;

/**
 * @author Rimal
 */
public class PackStoreProductOption {

  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.DISPLAY_NAME)
  private String displayName;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private int displayOrder;

  @JsonProperty(DtoJsonConstants.PACK_STORE_PRODUCT_OPTION_VALUES)
  private List<PackStoreProductOptionValue> packStoreProductOptionValues = new ArrayList<PackStoreProductOptionValue>(0);


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

  public List<PackStoreProductOptionValue> getPackStoreProductOptionValues() {
    return packStoreProductOptionValues;
  }

  public void setPackStoreProductOptionValues(List<PackStoreProductOptionValue> packStoreProductOptionValues) {
    this.packStoreProductOptionValues = packStoreProductOptionValues;
  }
}
