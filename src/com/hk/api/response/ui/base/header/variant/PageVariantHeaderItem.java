package com.hk.api.response.ui.base.header.variant;

import com.hk.api.response.variant.response.StoreVariantBasicApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 6:18:22 PM
 */
public class PageVariantHeaderItem {

  @JsonProperty(DtoJsonConstants.STORE_VARIANT_ID)
  private Long storeVariantId;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private Long displayOrder;

  @JsonProperty(DtoJsonConstants.VARIANT_HEADER_ITEM_RESPONSE)
  private StoreVariantBasicApiResponse variantBasicResponse;

  public Long getStoreVariantId() {
    return storeVariantId;
  }

  public void setStoreVariantId(Long storeVariantId) {
    this.storeVariantId = storeVariantId;
  }

  public Long getDisplayOrder() {
    return displayOrder;
  }

  public void setDisplayOrder(Long displayOrder) {
    this.displayOrder = displayOrder;
  }

  public StoreVariantBasicApiResponse getVariantBasicResponse() {
    return variantBasicResponse;
  }

  public void setVariantBasicResponse(StoreVariantBasicApiResponse variantBasicResponse) {
    this.variantBasicResponse = variantBasicResponse;
  }
}
