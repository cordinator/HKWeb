package com.hk.pact.service.variant;

import com.hk.api.response.variant.boughtTogether.BoughtTogetherVariantsResponseApiWrapper;
import com.hk.api.response.variant.response.MultipleVariantApiResponse;
import com.hk.api.response.variant.response.StoreVariantBasicApiResponse;
import com.hk.api.response.variant.response.StoreVariantDetailApiResponse;
import com.hk.api.response.variant.wrapper.VariantDetailResponseApiWrapper;

/**
 * @author Rimal
 */
public interface StoreVariantService {

  public StoreVariantDetailApiResponse getStoreVariantById(Long storeVariantId);

  public StoreVariantDetailApiResponse getDefaultStoreVariantForStoreProduct(Long storeProductId);

  public StoreVariantBasicApiResponse getStoreVariantBasicDetails(Long storeVariantId);

  public StoreVariantBasicApiResponse getStoreVariantBasicDetails(String oldVariantId);

  public MultipleVariantApiResponse getStoreVariants(String storeVariantIds);

  public BoughtTogetherVariantsResponseApiWrapper getBoughtTogetherVariants(Long storeVariantId, Long numberOfResults);
}
