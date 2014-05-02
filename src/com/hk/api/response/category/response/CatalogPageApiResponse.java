package com.hk.api.response.category.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.ui.CatalogPage;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 21, 2013
 * Time: 2:33:17 PM
 */
public class CatalogPageApiResponse  extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.PAGE)
  private CatalogPage catalogPage;


  public CatalogPage getCatalogPage() {
    return catalogPage;
  }

  public void setCatalogPage(CatalogPage catalogPage) {
    this.catalogPage = catalogPage;
  }
}