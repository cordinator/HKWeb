package com.hk.api.response.variant.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.variant.response.StoreVariantDetailApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class VariantDetailResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private StoreVariantDetailApiResponse variantDetail;


  public StoreVariantDetailApiResponse getVariantDetail() {
    return variantDetail;
  }

  public void setVariantDetail(StoreVariantDetailApiResponse variantDetail) {
    this.variantDetail = variantDetail;
  }


}
