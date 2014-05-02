package com.hk.api.response.ui.base.tags;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class StoreVariantTag extends AbstractTag {

  @JsonProperty(DtoJsonConstants.STORE_VARIANT_ID)
  private Long storeVariantId;


  public Long getStoreVariantId() {
    return storeVariantId;
  }

  public void setStoreVariantId(Long storeVariantId) {
    this.storeVariantId = storeVariantId;
  }
}
