package com.hk.pact.service.category;

import com.hk.api.response.category.Category;
import com.hk.api.response.category.CategoryGroup;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 8:25:39 PM
 */
public interface CategoryService {

  public List<Category> getPrimaryCategoriesForStore();

  public List<CategoryGroup> getSpecGroupsForCategory(String categoryPrefix);

  //public CategoryPageResponseApiWrapper getCategoryPageResponseWrapper(Long menuNodeId);
}
