package com.hk.web.resource.search;

import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.constants.rest.HKWebRequestConstants;
import com.hk.pact.service.search.SearchService;
import com.hk.web.PaginationConstants;
import com.hk.web.SortingConstants;
import com.hk.web.response.catalog.CatalogResponse;
import org.jboss.resteasy.annotations.cache.NoCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.*;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Oct 1, 2013
 * Time: 7:01:01 PM
 */
@Component
@Path("/search/")
public class SearchResource {

  @Autowired
  private SearchService searchService;

  @GET
  @Path("/results/")
  @Produces("application/json")
  /*@Cache(noStore = true,mustRevalidate=true, proxyRevalidate = true)*/
  @NoCache
  public CatalogResponse search(@QueryParam(HKWebRequestConstants.TEXT_QUERY) String textQuery,
                                @QueryParam(HKWebRequestConstants.MIN_PRICE) Double minPrice,
                                @QueryParam(HKWebRequestConstants.MAX_PRICE) Double maxPrice,
                                @QueryParam(HKWebRequestConstants.PAGE_NO) @DefaultValue(PaginationConstants.DEFAULT_PAGE_STR) int pageNo,
                                @QueryParam(HKWebRequestConstants.PER_PAGE) @DefaultValue(PaginationConstants.DEFAULT_PER_PAGE_CATALOG_STR) int perPage,
                                @QueryParam(HKWebRequestConstants.SORT_BY) @DefaultValue(SortingConstants.DEFAULT_SORT_BY) String sortBy,
                                @QueryParam(HKWebRequestConstants.SORT_TYPE) @DefaultValue(SortingConstants.DEFAULT_SORT_TYPE) String sortType) {

    CatalogResponse catalogResponse = new CatalogResponse();
    CatalogResults catalogResults = null;
    try {
      catalogResults = getSearchService().getSearchResults(textQuery, "", false, minPrice, maxPrice, pageNo, perPage, sortBy, sortType);
    } catch (Exception e) {
      catalogResponse.setException(true).addMessage(HKWebMessageConstants.QUERY_CANNOT_BE_BLANK);
      return catalogResponse;
    }
    if (catalogResults == null) {
      catalogResponse.setException(true).addMessage(HKWebMessageConstants.NO_CATALOG_RESULTS);
    } else {
      catalogResponse.setCatalogResults(catalogResults);
    }

    return catalogResponse;

  }

  public SearchService getSearchService() {
    return searchService;
  }
}
