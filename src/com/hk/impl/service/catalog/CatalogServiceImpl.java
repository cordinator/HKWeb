package com.hk.impl.service.catalog;

import com.hk.api.response.catalog.CatalogResultsApiWrapper;
import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.RequestConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.catalog.CatalogService;
import com.hk.web.PaginationConstants;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.security.InvalidParameterException;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 8, 2013
 * Time: 12:27:52 PM
 */
@Service
public class CatalogServiceImpl implements CatalogService {

    @Override
    public CatalogResults getCatalogResults(String navKey, int pageNo, int perPage) {
        if (navKey == null) {
            throw new InvalidParameterException("STORE_MENU_ID_CANNOT_BE_BLANK");
        }
        if (pageNo == 0) {
            pageNo = PaginationConstants.DEFAULT_PAGE;
        }
        if (perPage == 0) {
            perPage = PaginationConstants.DEFAULT_PER_PAGE_CATALOG;
        }
        URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CATALOG_RESULTS + navKey)
        /*.queryParameter(RequestConstants.NAV_ID, storeMenuNodeId.toString())*/
                .queryParameter(RequestConstants.PAGE_NO, Integer.valueOf(pageNo).toString())
                .queryParameter(RequestConstants.PER_PAGE, Integer.valueOf(perPage).toString());

        CatalogResultsApiWrapper resultsWrapper = (CatalogResultsApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), CatalogResultsApiWrapper.class);
        if (resultsWrapper != null) {
            return resultsWrapper.getResults();
        }

        return null;
    }

    @Override
    public CatalogResults getCatalogResultsForCategory(String categoryPrefix, Double minPrice, Double maxPrice, String brandStr, String filters, int pageNo, int perPage, String textQuery, String sortBy, String sortType, boolean excludeOOS) {
    /* if (StringUtils.isBlank(categoryPrefix)) {
      throw new InvalidParameterException("CAT_PREFIX_CANNOT_BE_BLANK");
    }*/

        if (pageNo == 0) {
            pageNo = PaginationConstants.DEFAULT_PAGE;
        }
        if (perPage == 0) {
            perPage = PaginationConstants.DEFAULT_PER_PAGE_CATALOG;
        }
        URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CATALOG_RESULTS)
                .queryParameter(RequestConstants.CAT_PREFIX, categoryPrefix)
                .queryParameter(RequestConstants.PAGE_NO, Integer.valueOf(pageNo).toString())
                .queryParameter(RequestConstants.PER_PAGE, Integer.valueOf(perPage).toString())
                .queryParameter(RequestConstants.SORT_TYPE, sortType)
                .queryParameter(RequestConstants.SORT_BY, sortBy)
                .queryParameter(RequestConstants.EXCLUDE_OOS, String.valueOf(excludeOOS));


        if (minPrice != null) {
            builder.queryParameter(RequestConstants.MIN_PRICE, minPrice.toString());
        }
        if (maxPrice != null) {
            builder.queryParameter(RequestConstants.MAX_PRICE, maxPrice.toString());
        }
        if (StringUtils.isNotBlank(brandStr)) {
            builder.queryParameter(RequestConstants.BRANDS, brandStr);
        }
        if (StringUtils.isNotBlank(filters)) {
            builder.queryParameter(RequestConstants.FILTER_PARAM, filters);
        }
        if (StringUtils.isNotBlank(textQuery)) {
            builder.queryParameter(RequestConstants.TEXT_QUERY, textQuery);
        }

        CatalogResultsApiWrapper resultsWrapper = (CatalogResultsApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), CatalogResultsApiWrapper.class);
        if (resultsWrapper != null) {
            return resultsWrapper.getResults();
        }

        return null;
    }

  /*@Override
  public CatalogApiResponse getCatalogResponse(Long pageId, Long menuLandingPageId, String catPrefix) {
    if (null == menuLandingPageId) {
      throw new InvalidParameterException("MENU_LANDAING_PAGE_ID_CANNOT_BE_BLANK");
    }

    if (null == pageId) {
      throw new InvalidParameterException("PAGE_ID_CANNOT_BE_BLANK");
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CATALOG_PAGE + pageId);

    builder.queryParameter(RequestConstants.MENU_LANDING_PAGE_ID, menuLandingPageId.toString());

    if (StringUtils.isNotBlank(catPrefix)) {
      builder.queryParameter(RequestConstants.CAT_PREFIX, catPrefix);
    }

    CatalogResponseApiWrapper catalogResponseWrapper = (CatalogResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), CatalogResponseApiWrapper.class);
    if (catalogResponseWrapper != null) {
      return catalogResponseWrapper.getResults();
    }

    return null;

  }*/


  /*public CatalogResults getCatalogResults(Long storeMenuNodeId, String categoryPrefix, Double minPrice, Double maxPrice, String brandStr, String filterStr, int pageNo, int perPage) {
    URIBuilder builder;
    if (storeMenuNodeId == null) {

      builder = new URIBuilder().fromURI(ServiceEndPoints.CATALOG_RESULTS)
          .queryParameter(RequestConstants.CAT_PREFIX, categoryPrefix)
          .queryParameter(RequestConstants.PAGE_NO, Integer.valueOf(pageNo).toString())
          .queryParameter(RequestConstants.PER_PAGE, Integer.valueOf(perPage).toString());
      //.queryParameter(RequestConstants.SOURCE, UISourceConstants.MENU_LANDING);

      if (minPrice != null) {
        builder.queryParameter(RequestConstants.MIN_PRICE, minPrice.toString());
      }
      if (maxPrice != null) {
        builder.queryParameter(RequestConstants.MAX_PRICE, maxPrice.toString());
      }
      if (StringUtils.isNotBlank(brandStr)) {
        builder.queryParameter(RequestConstants.BRANDS, brandStr);
      }
      if (StringUtils.isNotBlank(filterStr)) {
        builder.queryParameter(RequestConstants.FILTER_PARAM, filterStr);
      }
    } else {
      builder = new URIBuilder().fromURI(ServiceEndPoints.CATALOG_RESULTS)
          .queryParameter(RequestConstants.NAV_ID, storeMenuNodeId.toString())
          .queryParameter(RequestConstants.PAGE_NO, Integer.valueOf(pageNo).toString())
          .queryParameter(RequestConstants.PER_PAGE, Integer.valueOf(perPage).toString());
      ;
      //.queryParameter(RequestConstants.SOURCE, UISourceConstants.MENU_ITEM);
    }


    CatalogResultsApiWrapper resultsWrapper = (CatalogResultsApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), CatalogResultsApiWrapper.class);
    if (resultsWrapper != null) {
      return resultsWrapper.getResults();
    }

    return null;
  }*/

  /*public CatalogApiResponse getCatalogResponse(Long pageId, String catPrefix) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CATALOG_PAGE + pageId);
    if (StringUtils.isNotBlank(catPrefix)) {
      builder.queryParameter(RequestConstants.CAT_PREFIX, catPrefix);
    }


    CatalogResponseApiWrapper catalogResponseWrapper = (CatalogResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), CatalogResponseApiWrapper.class);
    if (catalogResponseWrapper != null) {
      return catalogResponseWrapper.getResults();
    }

    return null;
  }*/
}
