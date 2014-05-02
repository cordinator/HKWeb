package com.hk.web.action.beta.search;

import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.util.analytics.HKAnalyticsUtils;
import com.hk.web.action.beta.catalog.CatalogBaseAction;
import com.hk.web.action.beta.home.HomeAction;
import net.sourceforge.stripes.action.*;
import org.apache.commons.lang.StringUtils;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 2, 2013
 * Time: 2:36:06 PM
 */
public class SearchAction extends CatalogBaseAction {

  private boolean searchQueryValid = true;


  private void validateTextQuery() {
    if (StringUtils.isNotBlank(txtQ)) {
      if (txtQ.contains("<script") || txtQ.contains("<img") || txtQ.contains("http://")) {
        searchQueryValid = false;
      }
    }
  }

  @DefaultHandler
  public Resolution search() {

    validateTextQuery();
    if(StringUtils.isBlank(txtQ)){
      return new RedirectResolution(HomeAction.class);      
    }

      //CatalogResponse catalogResponse = new CatalogResponse();
      CatalogResults catalogResults = null;
      try {
        catalogResults = getSearchService().getSearchResults(txtQ, brands, excludeOOS, minPrice, maxPrice, pageNo, perPage, sortBy, sortType);
      } catch (Exception e) {
        //catalogResponse.setException(true).addMessage(HKWebMessageConstants.QUERY_CANNOT_BE_BLANK);
        return new ErrorResolution(404);
      }
      if (catalogResults != null) {
        setParamsForView(catalogResults);
        HKAnalyticsUtils.appendItrackerForSearch(catalogResults);
      }


    return new ForwardResolution("/pages/search/search.jsp");

  }


  /*public Resolution search() {
    return new ForwardResolution("/pages/search/search.jsp");
  }*/

  public String getTxtQ() {
    return txtQ;
  }

  public void setTxtQ(String txtQ) {
    this.txtQ = txtQ;
  }

  public boolean getSearchQueryValid() {
    return searchQueryValid;
  }

  public boolean isSearchQueryValid() {
    return searchQueryValid;
  }

  public void setSearchQueryValid(boolean searchQueryValid) {
    this.searchQueryValid = searchQueryValid;
  }
}
