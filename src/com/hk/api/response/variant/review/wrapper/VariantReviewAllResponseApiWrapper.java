package com.hk.api.response.variant.review.wrapper;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.ui.base.VariantReviewPage;
import com.hk.api.response.variant.review.response.VariantReviewAllApiResponse;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class VariantReviewAllResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private VariantReviewAllApiResponse variantReviewAllResponse;

  private VariantReviewPage page;

  public VariantReviewAllApiResponse getVariantReviewAllResponse() {
    return variantReviewAllResponse;
  }

  public void setVariantReviewAllResponse(VariantReviewAllApiResponse variantReviewAllResponse) {
    this.variantReviewAllResponse = variantReviewAllResponse;
  }

  public VariantReviewPage getPage() {
    return page;
  }

  public void setPage(VariantReviewPage page) {
    this.page = page;
  }
}
