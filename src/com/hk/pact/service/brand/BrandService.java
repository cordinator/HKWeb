package com.hk.pact.service.brand;

import com.hk.api.response.brand.response.BrandListByPrefixApiResponse;

/**
 * @author Rimal
 */
public interface BrandService {

  public BrandListByPrefixApiResponse getBrandsInPrimaryCategory(Long primaryCatId);
}
