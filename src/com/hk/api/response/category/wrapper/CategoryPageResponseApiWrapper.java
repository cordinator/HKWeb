package com.hk.api.response.category.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.category.response.CategoryPageApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 7:02:21 PM
 */
public class CategoryPageResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private CategoryPageApiResponse categoryPageApiResponse;


  public CategoryPageApiResponse getCategoryPageApiResponse() {
    return categoryPageApiResponse;
  }

  public void setCategoryPageApiResponse(CategoryPageApiResponse categoryPageApiResponse) {
    this.categoryPageApiResponse = categoryPageApiResponse;
  }
}
