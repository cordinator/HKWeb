package com.hk.web.action.beta.catalog;

import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.util.analytics.HKAnalyticsUtils;
import net.sourceforge.stripes.action.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

/**
 * Created by IntelliJ IDEA.
 * User: Sunit
 */
@Component
@UrlBinding("/catalog/result/rq")
public class CatalogAjaxAction extends CatalogBaseAction {



  @DefaultHandler
  public Resolution renderCatalog() {

    CatalogResults catalogResults = null;
    try {
      catalogResults = getCatalogService().getCatalogResultsForCategory(catPrefix, minPrice, maxPrice, brands, fl,
          pageNo, perPage, txtQ, sortBy, sortType, excludeOOS);
    } catch (Exception e) {

    }

    if (catalogResults == null) {

    }  else {
      setParamsForView(catalogResults);
      if(StringUtils.isEmpty(catPrefix)){
        return new ForwardResolution("/pages/brand/brandTemplate.jsp");
      } else {
        return new ForwardResolution("/pages/catalog/catalogTemplate.jsp");
      }
    }
    return new ForwardResolution("/pages/404.jsp");
  }

  public Resolution searchCatalog() {

    CatalogResults catalogResults = null;
    try {
      catalogResults = getSearchService().getSearchResults(txtQ, brands, excludeOOS, minPrice, maxPrice, pageNo, perPage, sortBy, sortType);
    } catch (Exception e) {
      //catalogResponse.setException(true).addMessage(HKWebMessageConstants.QUERY_CANNOT_BE_BLANK);
      return new ErrorResolution(404);
    }
    if (catalogResults == null) {

    }  else {
      setParamsForView(catalogResults);
      HKAnalyticsUtils.appendItrackerForSearch(catalogResults);
      return new ForwardResolution("/pages/search/searchTemplate.jsp");
    }
    return new ForwardResolution("/pages/404.jsp");
  }

  public Resolution pagination() {

    CatalogResults catalogResults = null;
    try {
      catalogResults = getCatalogService().getCatalogResultsForCategory(catPrefix, minPrice, maxPrice, brands, fl,
          pageNo, perPage, txtQ, sortBy, sortType, excludeOOS);
    } catch (Exception e) {

    }

    if (catalogResults == null) {

    }  else {
      setParamsForView(catalogResults);
      return new ForwardResolution("/pages/catalog/catalogPageTemplate.jsp");
    }
    return new ForwardResolution("/pages/404.jsp");
  }

  public Resolution searchPagination() {

    CatalogResults catalogResults = null;
    try {
      catalogResults = getSearchService().getSearchResults(txtQ, brands, excludeOOS, minPrice, maxPrice, pageNo, perPage, sortBy, sortType);
    } catch (Exception e) {
      //catalogResponse.setException(true).addMessage(HKWebMessageConstants.QUERY_CANNOT_BE_BLANK);
      return new ErrorResolution(404);
    }

    if (catalogResults == null) {

    }  else {
      setParamsForView(catalogResults);
      HKAnalyticsUtils.appendItrackerForSearch(catalogResults);
      return new ForwardResolution("/pages/catalog/catalogPageTemplate.jsp");
    }
    return new ForwardResolution("/pages/404.jsp");
  }
}
