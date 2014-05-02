package com.hk.impl.service.search;

import com.hk.api.response.catalog.CatalogResultsApiWrapper;
import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.RequestConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.search.SearchService;
import com.hk.web.PaginationConstants;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import java.security.InvalidParameterException;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Oct 1, 2013
 * Time: 7:09:21 PM
 */
@Service
public class SearchServiceImpl implements SearchService {

  @Override
  public CatalogResults getSearchResults(String query, String brands, boolean excludeOOS, Double minPrice, Double maxPrice, int pageNo, int perPage, String sortBy, String sortType) {
    if (StringUtils.isBlank(query)) {
      throw new InvalidParameterException("QUERY_CANNOT_BE_BLANK");
    }
    if (pageNo == 0) {
      pageNo = PaginationConstants.DEFAULT_PAGE;
    }
    if (perPage == 0) {
      perPage = PaginationConstants.DEFAULT_PER_PAGE_CATALOG;
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.SEARCH_RESULTS)
        .queryParameter(RequestConstants.TEXT_QUERY, query)
        .queryParameter(RequestConstants.PAGE_NO, Integer.valueOf(pageNo).toString())
        .queryParameter(RequestConstants.PER_PAGE, Integer.valueOf(perPage).toString())
        .queryParameter(RequestConstants.SORT_TYPE, sortType)
        .queryParameter(RequestConstants.SORT_BY, sortBy)
        .queryParameter(RequestConstants.EXCLUDE_OOS, String.valueOf(excludeOOS));

    if (StringUtils.isNotBlank(brands)) {
        builder.queryParameter(RequestConstants.BRANDS, brands);
    }

    if (minPrice != null) {
      builder.queryParameter(RequestConstants.MIN_PRICE, minPrice.toString());
    }
    if (maxPrice != null) {
      builder.queryParameter(RequestConstants.MAX_PRICE, maxPrice.toString());
    }

    CatalogResultsApiWrapper resultsWrapper = (CatalogResultsApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), CatalogResultsApiWrapper.class);
    if (resultsWrapper != null) {
      return resultsWrapper.getResults();
    }

    return null;
  }
}
