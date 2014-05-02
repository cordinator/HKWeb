package com.hk.api.response.category.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.category.Category;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 21, 2013
 * Time: 2:33:48 PM
 */
public class PrimaryCategoryApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.PRIMARY_CAT_LIST)
  private List<Category> primaryCategoryList;


  public List<Category> getPrimaryCategoryList() {
    return primaryCategoryList;
  }

  public void setPrimaryCategoryList(List<Category> primaryCategoryList) {
    this.primaryCategoryList = primaryCategoryList;
  }
}
