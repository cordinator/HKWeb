package com.hk.impl.service.category;

import com.hk.api.response.category.Category;
import com.hk.api.response.category.CategoryGroup;
import com.hk.api.response.category.wrapper.CategoryGroupResponseApiWrapper;
import com.hk.api.response.category.wrapper.PrimaryCategoryResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.category.CategoryService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 8:26:17 PM
 */
@Service
public class CategoryServiceImpl implements CategoryService {

  public static final String PRIMARY_CATEGORIES = "/primary/";
  public static final String SPEC_GROUPS = "/groups/";

  @Override
  public List<Category> getPrimaryCategoriesForStore() {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CATEGORY + PRIMARY_CATEGORIES + StoreConstants.DEFAULT_STORE_ID.toString());

    PrimaryCategoryResponseApiWrapper primaryCategoryResponseWrapper = (PrimaryCategoryResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), PrimaryCategoryResponseApiWrapper.class);
    if (primaryCategoryResponseWrapper != null && primaryCategoryResponseWrapper.getPrimaryCategoryApiResponse() != null) {
      return primaryCategoryResponseWrapper.getPrimaryCategoryApiResponse().getPrimaryCategoryList();
    }

    return null;
  }

  public List<CategoryGroup> getSpecGroupsForCategory(String categoryPrefix) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CATEGORY + URIBuilder.URL_TOKEN_SEP + categoryPrefix +
        SPEC_GROUPS + StoreConstants.DEFAULT_STORE_ID.toString());

    CategoryGroupResponseApiWrapper categoryGroupResponseApiWrapper = (CategoryGroupResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), CategoryGroupResponseApiWrapper.class);
    if (categoryGroupResponseApiWrapper != null && categoryGroupResponseApiWrapper.getCategoryGroupApiResponse() != null) {
      return categoryGroupResponseApiWrapper.getCategoryGroupApiResponse().getCategoryGroupList();
    }

    return null;
  }

  /*@Override
  public CategoryPageResponseApiWrapper getCategoryPageResponseWrapper(Long menuNodeId) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CATEGORY_PAGE + menuNodeId);

    return (CategoryPageResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), CategoryPageResponseApiWrapper.class);

  }*/
}
