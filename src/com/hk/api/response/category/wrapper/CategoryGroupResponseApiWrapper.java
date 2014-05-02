package com.hk.api.response.category.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.category.response.CategoryGroupApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class CategoryGroupResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private CategoryGroupApiResponse categoryGroupApiResponse;


  public CategoryGroupApiResponse getCategoryGroupApiResponse() {
    return categoryGroupApiResponse;
  }

  public void setCategoryGroupApiResponse(CategoryGroupApiResponse categoryGroupApiResponse) {
    this.categoryGroupApiResponse = categoryGroupApiResponse;
  }
}
