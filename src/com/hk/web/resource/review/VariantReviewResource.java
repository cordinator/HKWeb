package com.hk.web.resource.review;

import com.hk.api.request.review.CreateReviewRequest;
import com.hk.api.request.review.RateVariantRequest;
import com.hk.api.request.review.VoteForReviewRequest;
import com.hk.api.response.variant.review.response.VariantReviewActionApiResponse;
import com.hk.api.response.variant.review.wrapper.VariantReviewActionResponseApiWrapper;
import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.constants.rest.HKWebRequestConstants;
import com.hk.exception.InvalidInputException;
import com.hk.pact.service.user.UserService;
import com.hk.pact.service.variant.review.StoreVariantReviewService;
import com.hk.web.response.GenericResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.*;

/**
 * @author Rimal
 */
@Component
@Path("/variant/review/")
public class VariantReviewResource {

  @Autowired
  private StoreVariantReviewService storeVariantReviewService;
  @Autowired
  private UserService userService;


  @POST
  @Path("/add")
  public GenericResponse addReviewForVariant(CreateReviewRequest createReviewRequest) {

    GenericResponse genericResponse = new GenericResponse();

    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId != null) {
      createReviewRequest.setUserId(loggedInUserId);
    } else {
      genericResponse.setException(true).addMessage(HKWebMessageConstants.NO_LOGGED_IN_USER);
      return genericResponse;
    }

    boolean isException = false;
    try {
      VariantReviewActionResponseApiWrapper variantReviewActionResponseWrapper = getStoreVariantReviewService().createReviewForStoreVariant(createReviewRequest);

      if (variantReviewActionResponseWrapper != null) {

        VariantReviewActionApiResponse variantReviewActionResponse = variantReviewActionResponseWrapper.getSvReviewActionResponse();
        if (variantReviewActionResponse != null) {
          genericResponse.getMessages().addAll(variantReviewActionResponse.getMessages());
          isException = variantReviewActionResponse.isException();
        }
      }

    } catch (InvalidInputException e) {
      isException = true;
      genericResponse.addMessage(HKWebMessageConstants.INVALID_CREATE_REVIEW_REQ);
    }
    genericResponse.setException(isException);

    return genericResponse;
  }

  @POST
  @Path("/rate")
  public GenericResponse addRatingForVariant(RateVariantRequest rateVariantRequest) {
    GenericResponse genericResponse = new GenericResponse();

    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId != null) {
      rateVariantRequest.setUserId(loggedInUserId);
    } else {
      genericResponse.setException(true).addMessage(HKWebMessageConstants.NO_LOGGED_IN_USER);
      return genericResponse;
    }

    boolean isException = false;

    try {
      VariantReviewActionResponseApiWrapper variantReviewActionResponseWrapper = getStoreVariantReviewService().rateStoreVariant(rateVariantRequest);
      if (variantReviewActionResponseWrapper != null) {
        VariantReviewActionApiResponse variantReviewActionResponse = variantReviewActionResponseWrapper.getSvReviewActionResponse();
        if (variantReviewActionResponse != null) {
          genericResponse.getMessages().addAll(variantReviewActionResponse.getMessages());
          isException = variantReviewActionResponse.isException();
        }
      }
    } catch (InvalidInputException e) {
      isException = true;
      genericResponse.addMessage(HKWebMessageConstants.INVALID_RATE_VARIANT_REQ);

    }

    genericResponse.setException(isException);

    return genericResponse;
  }

  @GET
  @Path("/{reviewId}/vote")
  public GenericResponse voteForVariantReview(@PathParam(HKWebRequestConstants.REVIEW_ID) Long reviewId,
                                              @QueryParam(HKWebRequestConstants.VOTE_TYPE) int voteType) {
    GenericResponse genericResponse = new GenericResponse();
    Long userId = getUserService().getLoggedInUserId();

    if (userId == null) {
      genericResponse.setException(true).addMessage(HKWebMessageConstants.NO_LOGGED_IN_USER);
      return genericResponse;
    }


    VoteForReviewRequest voteForReviewRequest = new VoteForReviewRequest();
    voteForReviewRequest.setReviewId(reviewId);
    voteForReviewRequest.setVoteType(voteType);
    voteForReviewRequest.setUserId(userId);

    boolean isException = false;

    try {
      VariantReviewActionResponseApiWrapper variantReviewActionResponseWrapper = getStoreVariantReviewService().voteForStoreVariantReview(voteForReviewRequest);

      if (variantReviewActionResponseWrapper != null) {
        VariantReviewActionApiResponse variantReviewActionResponse = variantReviewActionResponseWrapper.getSvReviewActionResponse();

        if (variantReviewActionResponse != null) {
          genericResponse.getMessages().addAll(variantReviewActionResponse.getMessages());
          isException = variantReviewActionResponse.isException();
        }

      }
    } catch (InvalidInputException e) {
      isException = true;
      genericResponse.addMessage(HKWebMessageConstants.INVALID_VOTE_FOR_REVIEW_REQ);
    }

    genericResponse.setException(isException);

    return genericResponse;
  }


  public StoreVariantReviewService getStoreVariantReviewService() {
    return storeVariantReviewService;
  }

  public UserService getUserService() {
    return userService;
  }
}
