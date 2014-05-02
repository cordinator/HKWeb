package com.hk.pact.service.pack;

import com.hk.api.response.pack.PackListApiResponse;
import com.hk.api.response.brand.response.BrandListApiResponse;

/**
 * @author Rimal
 */
public interface PackService {

  public PackListApiResponse getPacks(String catPrefixes, String brandStr);

  public PackListApiResponse getPacksRelatedToStoreProduct(Long storeProductId);

  public BrandListApiResponse getApplicableBrandsForPacks();
}