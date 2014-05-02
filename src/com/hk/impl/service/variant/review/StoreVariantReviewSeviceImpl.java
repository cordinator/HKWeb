package com.hk.impl.service.variant.review;

import com.hk.api.request.review.CreateReviewRequest;
import com.hk.api.request.review.RateVariantRequest;
import com.hk.api.request.review.VoteForReviewRequest;
import com.hk.api.response.variant.review.wrapper.VariantReviewActionResponseApiWrapper;
import com.hk.api.response.variant.review.wrapper.VariantReviewAllResponseApiWrapper;
import com.hk.api.response.variant.review.wrapper.VariantReviewResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.RequestConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.exception.InvalidInputException;
import com.hk.pact.service.variant.review.StoreVariantReviewService;
import org.springframework.stereotype.Service;

/**
 * @author Rimal
 */
@Service
public class StoreVariantReviewSeviceImpl implements StoreVariantReviewService {

  private static final String CREATE_REVIEW_SERVICE_END_POINT = ServiceEndPoints.REVIEW_SERVICE_END_POINT + "create/";
  private static final String RATE_VARIANT_SERVICE_END_POINT = ServiceEndPoints.REVIEW_SERVICE_END_POINT + "rate/";
  private static final String VOTE_FOR_REVIEW_SERVICE_END_POINT = ServiceEndPoints.REVIEW_SERVICE_END_POINT + "vote/";


  public VariantReviewResponseApiWrapper getReviewsForStoreVariant(Long storeVariantId, Long reviewSortType, Long noOfResults) {
    if (null != storeVariantId) {
      URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.REVIEW_SERVICE_END_POINT + storeVariantId + "/results/");
//        .queryParameter(RequestConstants.STORE_VARIANT_ID, storeVariantId.toString());

      if (reviewSortType != null) {
        builder.queryParameter(RequestConstants.SORT_TYPE, reviewSortType.toString());
      }

      if (noOfResults != null) {
        builder.queryParameter(RequestConstants.NO_OF_RESULTS, noOfResults.toString());
      }

      return (VariantReviewResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), VariantReviewResponseApiWrapper.class);
    }

    return null;
  }


  public VariantReviewAllResponseApiWrapper getAllReviewsForStoreVariant(Long storeVariantId, Long reviewSortType, int pageNo, int perPage) {
    if (null != storeVariantId) {
      URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.REVIEW_SERVICE_END_POINT + storeVariantId + "/results/all")
//        .queryParameter(RequestConstants.STORE_VARIANT_ID, storeVariantId.toString())
          .queryParameter(RequestConstants.PAGE_NO, Long.valueOf(pageNo).toString())
          .queryParameter(RequestConstants.PER_PAGE, Long.valueOf(perPage).toString());

      if (reviewSortType != null) {
        builder.queryParameter(RequestConstants.SORT_TYPE, reviewSortType.toString());
      }

      return (VariantReviewAllResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), VariantReviewAllResponseApiWrapper.class);
    }

    return null;
  }

  public VariantReviewActionResponseApiWrapper createReviewForStoreVariant(CreateReviewRequest createReviewRequest) {
    if (!createReviewRequest.validate()) {
      throw new InvalidInputException("CREATE_REVIEW_REQ_IS_INVALID");
    }

    URIBuilder builder = new URIBuilder().fromURI(CREATE_REVIEW_SERVICE_END_POINT);
    return (VariantReviewActionResponseApiWrapper) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), createReviewRequest.getParams(), VariantReviewActionResponseApiWrapper.class);
  }

  public VariantReviewActionResponseApiWrapper rateStoreVariant(RateVariantRequest rateVariantRequest) {
    if (!rateVariantRequest.validate()) {
      throw new InvalidInputException("RATE_VARIANT_REQ_IS_INVALID");
    }

    URIBuilder builder = new URIBuilder().fromURI(RATE_VARIANT_SERVICE_END_POINT);
    return (VariantReviewActionResponseApiWrapper) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), rateVariantRequest.getParams(), VariantReviewActionResponseApiWrapper.class);
  }


  public VariantReviewActionResponseApiWrapper voteForStoreVariantReview(VoteForReviewRequest voteForReviewRequest) {
    if (!voteForReviewRequest.validate()) {
      throw new InvalidInputException("VOTE_FOR_REVIEW_REQ_IS_INVALID");
    }
    URIBuilder builder = new URIBuilder().fromURI(VOTE_FOR_REVIEW_SERVICE_END_POINT);
    return (VariantReviewActionResponseApiWrapper) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), voteForReviewRequest.getParams(), VariantReviewActionResponseApiWrapper.class);

  }

/*
  public VariantReviewActionApiResponse spamStoreVariantReview(SpamReviewRequest spamReviewRequest) {
    if (!spamReviewRequest.validate()) {
      throw new InvalidInputException("SPAM_REVIEW_REQ_IS_INVALID");
    }

    URIBuilder builder = new URIBuilder().fromURI(SPAM_REVIEW_SERVICE_END_POINT);

    Map<String, String> params = spamReviewRequest.getParams();

    try {
      String a = HkHttpClient.executePost(builder.getWebServiceUrl(), params);
    } catch (UnsupportedEncodingException uee) {
      logger.error("Error encountered while marking review#" + spamReviewRequest.getReviewId() + " as spam: " + uee);
    }
    return null;
    >>>>>>>master
  }
*/
}