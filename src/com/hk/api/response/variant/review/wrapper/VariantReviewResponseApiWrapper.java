package com.hk.api.response.variant.review.wrapper;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.variant.review.response.VariantReviewApiResponse;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class VariantReviewResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private VariantReviewApiResponse variantReviewResponse;


  public VariantReviewApiResponse getVariantReviewResponse() {
    return variantReviewResponse;
  }

  public void setVariantReviewResponse(VariantReviewApiResponse variantReviewResponse) {
    this.variantReviewResponse = variantReviewResponse;
  }
}
