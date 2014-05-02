package com.hk.web.response.variant.review;

import com.hk.api.response.variant.review.VariantRating;
import com.hk.api.response.variant.review.VariantReview;
import com.hk.constants.rest.HKWebJsonConstants;
import com.hk.web.response.GenericResponse;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Sachit
 * Date: 2/6/14
 * Time: 12:43 PM
 */
public class AbstractVariantReviewResponse extends GenericResponse{

  private List<VariantReview> variantReviews = new ArrayList<VariantReview>(0);
  protected long totalResults;
  protected int appliedSortTypeId;
  protected Map<Long, String> availableSortTypes = new HashMap<Long, String>(0);
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

  public VariantRating getVariantRating() {
    return variantRating;
  }

  public void setVariantRating(VariantRating variantRating) {
    this.variantRating = variantRating;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keyList = super.getKeys();
    keyList.add(HKWebJsonConstants.VARIANT_REVIEWS);
    keyList.add(HKWebJsonConstants.TOTAL_REVIEWS_RESULTS);
    keyList.add(HKWebJsonConstants.APPLIED_SORT_ID);
    keyList.add(HKWebJsonConstants.AVAILABLE_SORT_TYPES);
    keyList.add(HKWebJsonConstants.VARIANT_RATING);
    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> valueList = super.getValues();
    valueList.add(this.variantReviews);
    valueList.add(this.totalResults);
    valueList.add(this.appliedSortTypeId);
    valueList.add(this.availableSortTypes);
    valueList.add(this.variantRating);
    return valueList;
  }
}

