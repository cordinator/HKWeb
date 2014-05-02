package com.hk.impl.service.ui;


import com.hk.api.response.category.wrapper.CatalogPageResponseApiWrapper;
import com.hk.api.response.category.wrapper.CategoryPageResponseApiWrapper;
import com.hk.api.response.home.wrapper.HomePageResponseApiWrapper;
import com.hk.api.response.brand.wrapper.BrandPageResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.ui.PageService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.security.InvalidParameterException;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 13, 2013
 * Time: 5:29:32 PM
 */
@Service
public class PageServiceImpl implements PageService {


  @Override
  public CategoryPageResponseApiWrapper getCategoryPageResponseWrapper(String navKey) {
    if (StringUtils.isBlank(navKey)) {
      throw new InvalidParameterException("NAV_KEY_CANNOT_BE_BLANK");
    }
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.PAGE_DATA.concat(StoreConstants.DEFAULT_STORE_ID_STR).concat(URIBuilder.URL_TOKEN_SEP).concat(navKey));

    return (CategoryPageResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), CategoryPageResponseApiWrapper.class);


  }

  @Override
  public BrandPageResponseApiWrapper getBrandResponseWrapperForCategory(String navKey) {
     if (StringUtils.isBlank(navKey)) {
      throw new InvalidParameterException("NAV_KEY_CANNOT_BE_BLANK");
    }
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.PAGE_DATA.concat(StoreConstants.DEFAULT_STORE_ID_STR).concat(URIBuilder.URL_TOKEN_SEP).concat(navKey));

    return (BrandPageResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), BrandPageResponseApiWrapper.class);
  }

  @Override
  public CatalogPageResponseApiWrapper getCatalogResponseWrapper(String navKey) {

    if (StringUtils.isBlank(navKey)) {
      throw new InvalidParameterException("NAV_KEY_CANNOT_BE_BLANK");
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.PAGE_DATA.concat(StoreConstants.DEFAULT_STORE_ID_STR).concat(URIBuilder.URL_TOKEN_SEP).concat(navKey));
    return (CatalogPageResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), CatalogPageResponseApiWrapper.class);

  }

  @Override
  public CatalogPageResponseApiWrapper getCatalogResponseWrapperForCategory(String navKey) {
    if (StringUtils.isBlank(navKey)) {
      throw new InvalidParameterException("NAV_KEY_CANNOT_BE_BLANK");
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.PAGE_DATA.concat(StoreConstants.DEFAULT_STORE_ID_STR).concat(URIBuilder.URL_TOKEN_SEP).concat(navKey));
    return (CatalogPageResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), CatalogPageResponseApiWrapper.class);
  }

  @Override
  public HomePageResponseApiWrapper getHomePageResponseApiWrapper() {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.PAGE_DATA.concat(StoreConstants.DEFAULT_STORE_ID_STR).concat(URIBuilder.URL_TOKEN_SEP).concat(HOME_LP_IDENTIFIER));

    return (HomePageResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), HomePageResponseApiWrapper.class);
  }
}
