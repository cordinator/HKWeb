package com.hk.web.response.catalog;

import com.hk.web.response.GenericResponse;
import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.constants.rest.HKWebJsonConstants;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 18, 2013
 * Time: 6:32:12 PM
 */
public class CatalogResponse extends GenericResponse {

  private CatalogResults catalogResults;


  public CatalogResults getCatalogResults() {
    return catalogResults;
  }

  public void setCatalogResults(CatalogResults catalogResults) {
    this.catalogResults = catalogResults;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(HKWebJsonConstants.CATALOG);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.catalogResults);
    return values;
  }
}
