package com.hk.pact.service.catalog;

import com.hk.api.response.catalog.results.CatalogResults;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 8, 2013
 * Time: 12:26:16 PM
 */
public interface CatalogService {

  public CatalogResults getCatalogResults(String navKey, int pageNo, int perPage);

  public CatalogResults getCatalogResultsForCategory(String categoryPrefix, Double minPrice, Double maxPrice, String brands, String filters, int pageNo, int perPage, String textQuery,String sortBy, String sortType, boolean excludeOOS);

  //public CatalogApiResponse getCatalogResponse(Long pageId,Long menuLandingPageId, String catPrefix);


  /* @Deprecated
public CatalogResults getCatalogResults(Long storeMenuNodeId, String categoryPrefix, Double minPrice, Double maxPrice, String brands, String filters,  int pageNo, int perPage);

@Deprecated
public CatalogApiResponse getCatalogResponse(Long pageId, String catPrefix);*/
}
