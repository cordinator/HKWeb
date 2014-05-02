package com.hk.api.response.category.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.ui.CategoryPage;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 21, 2013
 * Time: 2:33:32 PM
 */
public class CategoryPageApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.PAGE)
  private CategoryPage categoryPage;


  public CategoryPage getCategoryPage() {
    return categoryPage;
  }

  public void setCategoryPage(CategoryPage categoryPage) {
    this.categoryPage = categoryPage;
  }
}
