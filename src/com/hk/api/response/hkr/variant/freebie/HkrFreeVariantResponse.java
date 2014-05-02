package com.hk.api.response.hkr.variant.freebie;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class HkrFreeVariantResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.OLD_VARIANT_ID)
  private String oldVariantId;
  @JsonProperty(DtoJsonConstants.FREEBIE_OLD_PRODUCT_ID)
  private String freebieOldProductId;
  @JsonProperty(DtoJsonConstants.FREEBIE_NAME)
  private String freebieName;


  public String getOldVariantId() {
    return oldVariantId;
  }

  public void setOldVariantId(String oldVariantId) {
    this.oldVariantId = oldVariantId;
  }

  public String getFreebieOldProductId() {
    return freebieOldProductId;
  }

  public void setFreebieOldProductId(String freebieOldProductId) {
    this.freebieOldProductId = freebieOldProductId;
  }

  public String getFreebieName() {
    return freebieName;
  }

  public void setFreebieName(String freebieName) {
    this.freebieName = freebieName;
  }
}
