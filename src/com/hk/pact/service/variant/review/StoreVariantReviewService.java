package com.hk.pact.service.variant.review;

import com.hk.api.request.review.CreateReviewRequest;
import com.hk.api.request.review.RateVariantRequest;
import com.hk.api.request.review.VoteForReviewRequest;
import com.hk.api.response.variant.review.wrapper.VariantReviewActionResponseApiWrapper;
import com.hk.api.response.variant.review.wrapper.VariantReviewAllResponseApiWrapper;
import com.hk.api.response.variant.review.wrapper.VariantReviewResponseApiWrapper;

/**
 * @author Rimal
 */
public interface StoreVariantReviewService {

  public VariantReviewResponseApiWrapper getReviewsForStoreVariant(Long storeVariantId, Long reviewSortType, Long noOfResults);

  public VariantReviewAllResponseApiWrapper getAllReviewsForStoreVariant(Long storeVariantId, Long reviewSortType, int pageNo, int perPage);

  public VariantReviewActionResponseApiWrapper createReviewForStoreVariant(CreateReviewRequest createReviewRequest);

  public VariantReviewActionResponseApiWrapper rateStoreVariant(RateVariantRequest rateVariantRequest);

  public VariantReviewActionResponseApiWrapper voteForStoreVariantReview(VoteForReviewRequest voteForReviewRequest);


}
