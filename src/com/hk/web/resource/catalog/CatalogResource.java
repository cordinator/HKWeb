package com.hk.web.resource.catalog;

import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.constants.rest.HKWebRequestConstants;
import com.hk.pact.service.catalog.CatalogService;
import com.hk.web.PaginationConstants;
import com.hk.web.SortingConstants;
import com.hk.web.response.catalog.CatalogResponse;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.*;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 26, 2013
 * Time: 12:51:52 PM
 */
@Component
@Path("/catalog/")
public class CatalogResource {

  @Autowired
  private CatalogService catalogService;


  @GET
  @Path("/results/{navId}")
  @Produces("application/json")
  public CatalogResponse serveCatalogForMenuItem(@PathParam(HKWebRequestConstants.NAV_ID) String navKey,
                                                 @QueryParam(HKWebRequestConstants.PAGE_NO) @DefaultValue(PaginationConstants.DEFAULT_PAGE_STR) int pageNo,
                                                 @QueryParam(HKWebRequestConstants.PER_PAGE) @DefaultValue(PaginationConstants.DEFAULT_PER_PAGE_CATALOG_STR) int perPage) {


    CatalogResponse catalogResponse = new CatalogResponse();
    CatalogResults catalogResults = null;
    try {
      catalogResults = getCatalogService().getCatalogResults(navKey, pageNo, perPage);
    } catch (Exception e) {
      catalogResponse.setException(true).addMessage(HKWebMessageConstants.NO_CATALOG_RESULTS);
      return catalogResponse;
    }

    if (catalogResults == null) {
      catalogResponse.setException(true).addMessage(HKWebMessageConstants.NO_CATALOG_RESULTS);
    } else {
      catalogResponse.setCatalogResults(catalogResults);
    }

    //return new JSONResponseBuilder().addField("catalog", catalogResults).buildAsString();

    return catalogResponse;
  }

  @GET
  @Path("/results/")
  @Produces("application/json")
  public CatalogResponse serveCatalog(@QueryParam(HKWebRequestConstants.CAT_PREFIX) String catPrefix,
                                      @QueryParam(HKWebRequestConstants.MIN_PRICE) Double minPrice,
                                      @QueryParam(HKWebRequestConstants.MAX_PRICE) Double maxPrice,
                                      @QueryParam(HKWebRequestConstants.TEXT_QUERY) String textQuery,
                                      @QueryParam(HKWebRequestConstants.BRANDS) String brandStr,
                                      @QueryParam(HKWebRequestConstants.FILTER_PARAM) String filterStr,
                                      @QueryParam(HKWebRequestConstants.PAGE_NO) @DefaultValue(PaginationConstants.DEFAULT_PAGE_STR) int pageNo,
                                      @QueryParam(HKWebRequestConstants.PER_PAGE) @DefaultValue(PaginationConstants.DEFAULT_PER_PAGE_CATALOG_STR) int perPage,
                                      @QueryParam(HKWebRequestConstants.SORT_BY) @DefaultValue(SortingConstants.DEFAULT_SORT_BY) String sortBy,
                                      @QueryParam(HKWebRequestConstants.SORT_TYPE) @DefaultValue(SortingConstants.DEFAULT_SORT_TYPE) String sortType) {

    CatalogResponse catalogResponse = new CatalogResponse();
    CatalogResults catalogResults = null;
    try {
      catalogResults = getCatalogService().getCatalogResultsForCategory(catPrefix, minPrice, maxPrice, brandStr, filterStr,
          pageNo, perPage, textQuery, sortBy, sortType, false);
    } catch (Exception e) {
      catalogResponse.setException(true).addMessage(HKWebMessageConstants.NO_CATALOG_RESULTS);
      return catalogResponse;
    }

    if (catalogResults == null) {
      catalogResponse.setException(true).addMessage(HKWebMessageConstants.NO_CATALOG_RESULTS);
    } else {
      catalogResponse.setCatalogResults(catalogResults);
    }
    //return new JSONResponseBuilder().addField("catalog", catalogResults).buildAsString();

    return catalogResponse;

  }



  public CatalogService getCatalogService() {
    return catalogService;
  }
}
