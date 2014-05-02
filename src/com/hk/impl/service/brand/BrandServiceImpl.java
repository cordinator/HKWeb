package com.hk.impl.service.brand;

import com.hk.api.response.brand.response.BrandListByPrefixApiResponse;
import com.hk.api.response.brand.wrapper.BrandListByPrefixResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.brand.BrandService;
import org.springframework.stereotype.Service;

/**
 * @author Rimal
 */
@Service
public class BrandServiceImpl implements BrandService {

  private static final String PRIMARY_CATEGORY_SEARCH = "primarycat/";

  public BrandListByPrefixApiResponse getBrandsInPrimaryCategory(Long primaryCatId) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.BRAND + PRIMARY_CATEGORY_SEARCH + primaryCatId);

    BrandListByPrefixResponseApiWrapper brandListByPrefixResponseApiWrapper = (BrandListByPrefixResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), BrandListByPrefixResponseApiWrapper.class);

    if (brandListByPrefixResponseApiWrapper != null) {
      return brandListByPrefixResponseApiWrapper.getBrandListByPrefixApiResponse();
    }
    return null;
  }
}
