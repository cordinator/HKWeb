package com.hk.web.action.beta.brand;

import com.hk.api.response.brand.response.BrandListByPrefixApiResponse;
import com.hk.api.response.category.Category;
import com.hk.pact.service.brand.BrandService;
import com.hk.pact.service.category.CategoryService;
import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.ArrayList;

/**
 * @author Rimal
 */
@Component
public class BrandListingAction extends BaseAction {

  private Long primaryCatId;
  private BrandListByPrefixApiResponse brandListByPrefixApiResponse;
  private List<Category> primaryCategories = new ArrayList<Category>(0);

  @Autowired
  private BrandService brandService;
  @Autowired
  private CategoryService categoryService;


  public Resolution pre() {
    primaryCategories = getCategoryService().getPrimaryCategoriesForStore();

    if(primaryCatId == null){
      primaryCatId = primaryCategories.get(0).getId();
    }
    brandListByPrefixApiResponse = getBrandService().getBrandsInPrimaryCategory(primaryCatId);
    return new ForwardResolution("/pages/brand/brandListing.jsp");
  }


  public Long getPrimaryCatId() {
    return primaryCatId;
  }

  public void setPrimaryCatId(Long primaryCatId) {
    this.primaryCatId = primaryCatId;
  }

  public BrandListByPrefixApiResponse getBrandListByPrefixApiResponse() {
    return brandListByPrefixApiResponse;
  }

  public void setBrandListByPrefixApiResponse(BrandListByPrefixApiResponse brandListByPrefixApiResponse) {
    this.brandListByPrefixApiResponse = brandListByPrefixApiResponse;
  }

  public List<Category> getPrimaryCategories() {
    return primaryCategories;
  }

  public void setPrimaryCategories(List<Category> primaryCategories) {
    this.primaryCategories = primaryCategories;
  }

  public BrandService getBrandService() {
    return brandService;
  }

  public CategoryService getCategoryService() {
    return categoryService;
  }
}