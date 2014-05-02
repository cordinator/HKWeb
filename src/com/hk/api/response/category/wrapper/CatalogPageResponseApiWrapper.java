package com.hk.api.response.category.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.category.response.CatalogPageApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 21, 2013
 * Time: 1:58:46 PM
 */
public class CatalogPageResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private CatalogPageApiResponse catalogPageApiResponse;


  public CatalogPageApiResponse getCatalogPageApiResponse() {
    return catalogPageApiResponse;
  }

  public void setCatalogPageApiResponse(CatalogPageApiResponse catalogPageApiResponse) {
    this.catalogPageApiResponse = catalogPageApiResponse;
  }
}
