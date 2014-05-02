package com.hk.impl.service.variant;

import com.hk.api.response.variant.boughtTogether.BoughtTogetherVariantsResponseApiWrapper;
import com.hk.api.response.variant.response.MultipleVariantApiResponse;
import com.hk.api.response.variant.response.StoreVariantBasicApiResponse;
import com.hk.api.response.variant.response.StoreVariantDetailApiResponse;
import com.hk.api.response.variant.wrapper.MultipleVariantResponseApiWrapper;
import com.hk.api.response.variant.wrapper.VariantBasicResponseApiWrapper;
import com.hk.api.response.variant.wrapper.VariantDetailResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.RequestConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.variant.StoreVariantService;
import org.springframework.stereotype.Service;

/**
 * @author Rimal
 */
@Service
public class StoreVariantServiceImpl implements StoreVariantService {

  private static final String MULTIPLE_STORE_VARIANT_SUFFIX = "mul/";
  private static final String BASIC_STORE_VARIANT_SUFFIX = "basic/";
  private static final String OLD_VARIANT_SUFFIX = "oldVariant/";
  private static final String BOUGHT_TOGETHER_VARIANTS_SUFFIX = "/boughtTogether/";
  private static final String VARIANT_FROM_PRODUCT = "product/";

  @Override
  public StoreVariantDetailApiResponse getStoreVariantById(Long storeVariantId) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.STORE_VARIANT + storeVariantId.toString());
    VariantDetailResponseApiWrapper variantDetailResponseApiWrapper = (VariantDetailResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), VariantDetailResponseApiWrapper.class);
    if (variantDetailResponseApiWrapper != null) {
      return variantDetailResponseApiWrapper.getVariantDetail();
    }

    return null;
  }

  public StoreVariantDetailApiResponse getDefaultStoreVariantForStoreProduct(Long storeProductId) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.STORE_VARIANT + VARIANT_FROM_PRODUCT + storeProductId.toString());
    VariantDetailResponseApiWrapper variantDetailResponseApiWrapper = (VariantDetailResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), VariantDetailResponseApiWrapper.class);
    if (variantDetailResponseApiWrapper != null) {
      return variantDetailResponseApiWrapper.getVariantDetail();
    }

    return null;
  }

  @Override
  public StoreVariantBasicApiResponse getStoreVariantBasicDetails(Long storeVariantId) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.STORE_VARIANT + BASIC_STORE_VARIANT_SUFFIX + storeVariantId.toString());
    VariantBasicResponseApiWrapper variantBasicResponseWrapper = (VariantBasicResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), VariantBasicResponseApiWrapper.class);
    if (variantBasicResponseWrapper != null) {
      return variantBasicResponseWrapper.getStoreVariantBasic();
    }

    return null;
  }

  public StoreVariantBasicApiResponse getStoreVariantBasicDetails(String oldVariantId) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.STORE_VARIANT + OLD_VARIANT_SUFFIX + oldVariantId);
    VariantBasicResponseApiWrapper variantBasicResponseApiWrapper = (VariantBasicResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(),
        VariantBasicResponseApiWrapper.class);
    if (variantBasicResponseApiWrapper != null) {
      return variantBasicResponseApiWrapper.getStoreVariantBasic();
    }

    return null;
  }

  @Override
  public MultipleVariantApiResponse getStoreVariants(String storeVariantIds) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.STORE_VARIANT + MULTIPLE_STORE_VARIANT_SUFFIX)
        .queryParameter(RequestConstants.STORE_VARIANT_IDS, storeVariantIds);

    MultipleVariantResponseApiWrapper multipleVariantResponseApiWrapper = (MultipleVariantResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), MultipleVariantResponseApiWrapper.class);
    if (multipleVariantResponseApiWrapper != null) {
      return multipleVariantResponseApiWrapper.getMultipleVariantApiResponse();
    }

    return null;
  }

  public BoughtTogetherVariantsResponseApiWrapper getBoughtTogetherVariants(Long storeVariantId, Long numberOfResults) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.STORE_VARIANT_BROWSE + storeVariantId.toString() + BOUGHT_TOGETHER_VARIANTS_SUFFIX);

    if (numberOfResults != null) {
      builder.queryParameter(RequestConstants.NO_OF_RESULTS, numberOfResults.toString());
    }

    return (BoughtTogetherVariantsResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), BoughtTogetherVariantsResponseApiWrapper.class);
  }
}