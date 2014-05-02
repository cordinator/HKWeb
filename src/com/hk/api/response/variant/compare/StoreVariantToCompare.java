package com.hk.api.response.variant.compare;

import com.hk.api.response.variant.response.StoreVariantBasicApiResponse;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class StoreVariantToCompare
//    extends JSONObject 
{

  @JsonProperty(com.hk.common.constants.DtoJsonConstants.STORE_VARIANT_ID)
  private Long storeVariantId;
  @JsonProperty(com.hk.common.constants.DtoJsonConstants.CAT_PREFIX)
  private String storeCategoryPrefix;

  @JsonProperty(com.hk.common.constants.DtoJsonConstants.STORE_VARIANT_BASIC_DETAILS)
  private StoreVariantBasicApiResponse storeVariantBasic;

  public StoreVariantToCompare() {
  }

  public StoreVariantToCompare(Long storeVariantId, String storeCategoryPrefix) {
    this.storeVariantId = storeVariantId;
    this.storeCategoryPrefix = storeCategoryPrefix;
  }

  public Long getStoreVariantId() {
    return storeVariantId;
  }

  public void setStoreVariantId(Long storeVariantId) {
    this.storeVariantId = storeVariantId;
  }

  public String getStoreCategoryPrefix() {
    return storeCategoryPrefix;
  }

  public void setStoreCategoryPrefix(String storeCategoryPrefix) {
    this.storeCategoryPrefix = storeCategoryPrefix;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }

    if (o instanceof StoreVariantToCompare) {
      StoreVariantToCompare storeVariantToCompare = (StoreVariantToCompare) o;
      return new EqualsBuilder()
          .append(this.storeVariantId, storeVariantToCompare.getStoreVariantId())
          .isEquals();
    }

    return false;
  }


  public StoreVariantBasicApiResponse getStoreVariantBasic() {
    return storeVariantBasic;
  }

  public void setStoreVariantBasic(StoreVariantBasicApiResponse storeVariantBasic) {
    this.storeVariantBasic = storeVariantBasic;
  }

  @Override
  public int hashCode() {
    return new HashCodeBuilder()
        .append(this.storeVariantId)
        .toHashCode();
  }

  /*@Override
  protected String[] getKeys() {
    return new String[]{"variantId", "catPrefix"};
  }

  @Override
  protected Object[] getValues() {
    return new Object[]{this.storeVariantId, this.storeCategoryPrefix};
  }*/
}
