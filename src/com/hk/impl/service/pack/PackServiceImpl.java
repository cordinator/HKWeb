package com.hk.impl.service.pack;

import com.hk.api.response.brand.response.BrandListApiResponse;
import com.hk.api.response.brand.wrapper.BrandListResponseApiWrapper;
import com.hk.api.response.pack.PackListApiResponse;
import com.hk.api.response.pack.PackListResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.RequestConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.pack.PackService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

/**
 * @author Rimal
 */
@Service
public class PackServiceImpl implements PackService {

  private static final String BRANDS = "brands";
  private static final String RESULTS = "results";

  public PackListApiResponse getPacks(String catPrefixes, String brandStr) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.PACK + RESULTS);

    if (StringUtils.isNotBlank(catPrefixes)) {
      builder.queryParameter(RequestConstants.CAT_PREFIX, catPrefixes);
    }

    if (StringUtils.isNotBlank(brandStr)) {
      builder.queryParameter(RequestConstants.BRANDS, brandStr);
    }

    PackListResponseApiWrapper packListResponseApiWrapper = (PackListResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), PackListResponseApiWrapper.class);

    if (packListResponseApiWrapper != null) {
      return packListResponseApiWrapper.getPackListApiResponse();
    }
    return null;
  }

  @Override
  public PackListApiResponse getPacksRelatedToStoreProduct(Long storeProductId) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.PACK + storeProductId.toString() +
        URIBuilder.URL_TOKEN_SEP + "results");

    PackListResponseApiWrapper packListResponseApiWrapper = (PackListResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), PackListResponseApiWrapper.class);

    if (packListResponseApiWrapper != null) {
      return packListResponseApiWrapper.getPackListApiResponse();
    }
    return null;
  }

  @Override
  public BrandListApiResponse getApplicableBrandsForPacks() {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.PACK + BRANDS);

    BrandListResponseApiWrapper brandListResponseApiWrapper = (BrandListResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), BrandListResponseApiWrapper.class);

    if (brandListResponseApiWrapper != null) {
      return brandListResponseApiWrapper.getBrandListApiResponse();
    }
    return null;
  }
}