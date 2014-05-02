package com.hk.api.response.variant.review.response;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.variant.review.VariantReview;
import com.hk.api.response.variant.review.VariantRating;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Rimal
 */
public abstract class AbstractVariantReviewApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.STORE_VARIANT_REVIEWS)
  protected List<VariantReview> variantReviews = new ArrayList<VariantReview>(0);

  @JsonProperty(DtoJsonConstants.TOTAL_REVIEWS)
  protected long totalResults;

  @JsonProperty(DtoJsonConstants.APPLIED_SORT_TYPE)
  protected int appliedSortTypeId;

  @JsonProperty(DtoJsonConstants.AVAILABLE_SORT_TYPES)
  protected Map<Long, String> availableSortTypes = new HashMap<Long, String>(0);

  @JsonProperty(DtoJsonConstants.STORE_VARIANT_RATING)
  protected VariantRating variantRating;


  public List<VariantReview> getVariantReviews() {
    return variantReviews;
  }

  public void setVariantReviews(List<VariantReview> variantReviews) {
    this.variantReviews = variantReviews;
  }

  public long getTotalResults() {
    return totalResults;
  }

  public void setTotalResults(long totalResults) {
    this.totalResults = totalResults;
  }

  public VariantRating getVariantRating() {
    return variantRating;
  }

  public void setVariantRating(VariantRating variantRating) {
    this.variantRating = variantRating;
  }

  public int getAppliedSortTypeId() {
    return appliedSortTypeId;
  }

  public void setAppliedSortTypeId(int appliedSortTypeId) {
    this.appliedSortTypeId = appliedSortTypeId;
  }

  public Map<Long, String> getAvailableSortTypes() {
    return availableSortTypes;
  }

  public void setAvailableSortTypes(Map<Long, String> availableSortTypes) {
    this.availableSortTypes = availableSortTypes;
  }

  public VariantRating getVariantRatingResponse() {
    return variantRating;
  }

  public void setVariantRatingResponse(VariantRating variantRating) {
    this.variantRating = variantRating;
  }
}
