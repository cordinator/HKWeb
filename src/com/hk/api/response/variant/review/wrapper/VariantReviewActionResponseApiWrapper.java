package com.hk.api.response.variant.review.wrapper;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.variant.review.response.VariantReviewActionApiResponse;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class VariantReviewActionResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private VariantReviewActionApiResponse variantReviewActionResponse;


  public VariantReviewActionApiResponse getSvReviewActionResponse() {
    return variantReviewActionResponse;
  }

  public void setSvReviewActionResponse(VariantReviewActionApiResponse variantReviewActionResponse) {
    this.variantReviewActionResponse = variantReviewActionResponse;
  }
}
