package com.hk.pact.service.search;

import com.hk.api.response.catalog.results.CatalogResults;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Oct 1, 2013
 * Time: 7:05:59 PM
 */
public interface SearchService {

  public CatalogResults getSearchResults(String query, String brands, boolean excludeOOS, Double minPrice, Double maxPrice, int pageNo, int perPage, String sortBy, String sortType);
}
