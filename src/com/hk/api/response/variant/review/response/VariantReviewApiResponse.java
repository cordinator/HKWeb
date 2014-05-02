package com.hk.api.response.variant.review.response;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class VariantReviewApiResponse extends AbstractVariantReviewApiResponse {

  @JsonProperty(DtoJsonConstants.TOTAL_REVIEWS_SENT)
  private int numberOfCurrentResults;


  public int getNumberOfCurrentResults() {
    return numberOfCurrentResults;
  }

  public void setNumberOfCurrentResults(int numberOfCurrentResults) {
    this.numberOfCurrentResults = numberOfCurrentResults;
  }
}
