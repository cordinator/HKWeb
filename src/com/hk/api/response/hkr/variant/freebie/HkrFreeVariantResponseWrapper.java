package com.hk.api.response.hkr.variant.freebie;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class HkrFreeVariantResponseWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private HkrFreeVariantResponse hkrFreeVariantResponse;


  public HkrFreeVariantResponse getHkrFreeVariantResponse() {
    return hkrFreeVariantResponse;
  }

  public void setHkrFreeVariantResponse(HkrFreeVariantResponse hkrFreeVariantResponse) {
    this.hkrFreeVariantResponse = hkrFreeVariantResponse;
  }
}
