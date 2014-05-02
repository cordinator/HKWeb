package com.hk.api.response.category.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.category.response.CategoryLinksApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;


public class CategoryLinksResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private CategoryLinksApiResponse categoryLinksApiResponse;

  public CategoryLinksApiResponse getCategoryLinksApiResponse() {
    return categoryLinksApiResponse;
  }

  public void setCategoryLinksApiResponse(CategoryLinksApiResponse categoryLinksApiResponse) {
    this.categoryLinksApiResponse = categoryLinksApiResponse;
  }
}
