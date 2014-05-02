package com.hk.web.resource.variant;

import com.hk.api.response.hkr.deliveryDate.HkrDeliveryDateResponse;
import com.hk.api.response.hkr.variant.combo.HkrComboResponse;
import com.hk.api.response.hkr.variant.freebie.HkrFreeVariantResponse;
import com.hk.api.response.variant.boughtTogether.BoughtTogetherVariantData;
import com.hk.api.response.variant.boughtTogether.BoughtTogetherVariantsApiResponse;
import com.hk.api.response.variant.boughtTogether.BoughtTogetherVariantsResponseApiWrapper;
import com.hk.api.response.variant.response.StoreVariantApiResponse;
import com.hk.api.response.variant.review.response.VariantReviewApiResponse;
import com.hk.api.response.variant.review.wrapper.VariantReviewResponseApiWrapper;
import com.hk.common.constants.RequestConstants;
import com.hk.constants.rest.HKWebRequestConstants;
import com.hk.pact.service.hkr.variant.HkrStoreVariantService;
import com.hk.pact.service.variant.StoreVariantService;
import com.hk.pact.service.variant.review.StoreVariantReviewService;
import com.hk.util.analytics.HKAnalyticsUtils;
import com.hk.web.response.hkr.combo.HkWebComboResponse;
import com.hk.web.response.hkr.freebie.HkWebFreebieResponse;
import com.hk.web.response.variant.boughtTogether.BoughtTogetherVariantsResponse;
import com.hk.web.response.variant.review.VariantReviewResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.QueryParam;
import java.util.Date;

/**
 * @author Rimal
 */
@Component
@Path("/variant/browse")
public class VariantBrowseResource {
  @Autowired
  private StoreVariantReviewService storeVariantReviewService;
  @Autowired
  private StoreVariantService storeVariantService;
  @Autowired
  private HkrStoreVariantService hkrStoreVariantService;


  @GET
  @Path("/{svId}/boughtTogether")
  public BoughtTogetherVariantsResponse getBoughtTogetherVariants(@PathParam(HKWebRequestConstants.STORE_VARIANT_ID) Long storeVariantId,
                                                                  @QueryParam(RequestConstants.NO_OF_RESULTS) Long noOfResults) {
    BoughtTogetherVariantsResponse boughtTogetherVariantsResponse = new BoughtTogetherVariantsResponse();
    BoughtTogetherVariantsResponseApiWrapper responseApiWrapper = getStoreVariantService().getBoughtTogetherVariants(storeVariantId, noOfResults);


    if (responseApiWrapper != null) {
      BoughtTogetherVariantsApiResponse boughtTogetherVariantsApiResponse = responseApiWrapper.getBoughtTogetherVariantsApiResponse();

      for (BoughtTogetherVariantData boughtTogetherVariantData : boughtTogetherVariantsApiResponse.getBoughtTogetherVariantDataList()) {
        HKAnalyticsUtils.appendItrackerParam(boughtTogetherVariantData);
      }

      boughtTogetherVariantsResponse.setBoughtTogetherVariantDataList(boughtTogetherVariantsApiResponse.getBoughtTogetherVariantDataList());
      boughtTogetherVariantsResponse.setNumberOfCurrentResults(boughtTogetherVariantsApiResponse.getNumberOfCurrentResults());
    }
    return boughtTogetherVariantsResponse;
  }

  @GET
  @Path("/{oldVariantId}/freeVariant")
  public HkWebFreebieResponse getFreeVariant(@PathParam(HKWebRequestConstants.OLD_VARIANT_ID) String oldVariantId) {
    HkWebFreebieResponse hkWebFreebieResponse = new HkWebFreebieResponse();

    HkrFreeVariantResponse freeVariantForStoreVariant = getHkrStoreVariantService().getFreeVariantForStoreVariant(oldVariantId);
    hkWebFreebieResponse.setVariantId(oldVariantId);

    if (freeVariantForStoreVariant != null) {
      hkWebFreebieResponse.setFreebieOldProductId(freeVariantForStoreVariant.getFreebieOldProductId());
      hkWebFreebieResponse.setFreebieName(freeVariantForStoreVariant.getFreebieName());
    }

    return hkWebFreebieResponse;
  }

  @GET
  @Path("/{oldVariantId}/combos")
  public HkWebComboResponse getCombos(@PathParam(HKWebRequestConstants.OLD_VARIANT_ID) String oldVariantId,
                                      @QueryParam(RequestConstants.NO_OF_RESULTS) Long noOfResults) {
    HkWebComboResponse hkWebComboResponse = new HkWebComboResponse();

    HkrComboResponse hkrComboResponse = getHkrStoreVariantService().getCombosForStoreVariant(oldVariantId, noOfResults);

    if (hkrComboResponse != null) {
      hkWebComboResponse.setComboList(hkrComboResponse.getComboList());
    }

    return hkWebComboResponse;
  }


  @GET
  @Path("/{svId}/reviews")

  public VariantReviewResponse getReviewsForStoreVariant(@PathParam(HKWebRequestConstants.STORE_VARIANT_ID) Long variantId) {
    VariantReviewResponse variantReviewResponse = new VariantReviewResponse();
    VariantReviewResponseApiWrapper variantReviewResponseApiWrapper = getStoreVariantReviewService().getReviewsForStoreVariant(variantId, null, null);
    if (variantReviewResponseApiWrapper != null) {
      VariantReviewApiResponse variantReviewApiResponse = variantReviewResponseApiWrapper.getVariantReviewResponse();
      if (variantReviewApiResponse != null) {
        variantReviewResponse.setVariantReviews(variantReviewApiResponse.getVariantReviews());
        variantReviewResponse.setVariantRating(variantReviewApiResponse.getVariantRating());
        variantReviewResponse.setTotalResults(variantReviewApiResponse.getTotalResults());
        variantReviewResponse.setAvailableSortTypes(variantReviewApiResponse.getAvailableSortTypes());
        variantReviewResponse.setAppliedSortTypeId(variantReviewApiResponse.getAppliedSortTypeId());
        variantReviewResponse.setNumberOfCurrentResults(variantReviewApiResponse.getNumberOfCurrentResults());
      }
      return variantReviewResponse;
    }
    return null;
  }

  @GET
  @Path("/{pincode}/{oldVariantId}/estimatedDeliveryDate")
  public HkrDeliveryDateResponse getEstimatedDeliveryDate(@PathParam(HKWebRequestConstants.PINCODE) String pincode,
                                       @PathParam(HKWebRequestConstants.OLD_VARIANT_ID) String oldVariantId) {

      return getHkrStoreVariantService().getEstimatedDeliveryDate(pincode,oldVariantId);
  }

  public StoreVariantReviewService getStoreVariantReviewService() {
    return storeVariantReviewService;
  }

  public StoreVariantService getStoreVariantService() {
    return storeVariantService;
  }

  public HkrStoreVariantService getHkrStoreVariantService() {
    return hkrStoreVariantService;
  }
}