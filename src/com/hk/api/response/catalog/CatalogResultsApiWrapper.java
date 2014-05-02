package com.hk.api.response.catalog;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 5, 2013
 * Time: 7:23:33 PM
 */
public class CatalogResultsApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private CatalogResults results;

  public CatalogResults getResults() {
    return results;             
  }

  public void setResults(CatalogResults results) {
    this.results = results;
  }
}
