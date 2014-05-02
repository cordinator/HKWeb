package com.hk.api.response.category.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.category.CategoryGroup;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class CategoryGroupApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.CAT_PREFIX)
  private String categoryPrefix;
  @JsonProperty(DtoJsonConstants.GROUPS)
  private List<CategoryGroup> categoryGroupList = new ArrayList<CategoryGroup>(0);


  public String getCategoryPrefix() {
    return categoryPrefix;
  }

  public void setCategoryPrefix(String categoryPrefix) {
    this.categoryPrefix = categoryPrefix;
  }

  public List<CategoryGroup> getCategoryGroupList() {
    return categoryGroupList;
  }

  public void setCategoryGroupList(List<CategoryGroup> categoryGroupList) {
    this.categoryGroupList = categoryGroupList;
  }
}