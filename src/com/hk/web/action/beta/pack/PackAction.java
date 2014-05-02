package com.hk.web.action.beta.pack;

import com.hk.api.response.brand.Brand;
import com.hk.api.response.brand.response.BrandListApiResponse;
import com.hk.api.response.category.Category;
import com.hk.api.response.pack.Pack;
import com.hk.api.response.pack.PackListApiResponse;
import com.hk.pact.service.category.CategoryService;
import com.hk.pact.service.pack.PackService;
import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
@Component
public class PackAction extends BaseAction {

  private List<Category> primaryCategories = new ArrayList<Category>(0);
  private List<Brand> brands = new ArrayList<Brand>(0);
  private List<Pack> packList = new ArrayList<Pack>(0);

  private String catPrefixes;
  private String brandStr;

  @Autowired
  private PackService packService;
  @Autowired
  private CategoryService categoryService;


  @DefaultHandler
  public Resolution pre() {
    primaryCategories = getCategoryService().getPrimaryCategoriesForStore();

    BrandListApiResponse brandListApiResponse = getPackService().getApplicableBrandsForPacks();
    if (brandListApiResponse != null) {
      brands = brandListApiResponse.getBrandList();
    }

    PackListApiResponse packListApiResponse = getPackService().getPacks(catPrefixes, brandStr);
    if (packListApiResponse != null) {
      packList = packListApiResponse.getPacks();
    }
    return new ForwardResolution("/pages/pack/pack.jsp");
  }


  public List<Category> getPrimaryCategories() {
    return primaryCategories;
  }

  public List<Brand> getBrands() {
    return brands;
  }

  public List<Pack> getPackList() {
    return packList;
  }

  public String getCatPrefixes() {
    return catPrefixes;
  }

  public void setCatPrefixes(String catPrefixes) {
    this.catPrefixes = catPrefixes;
  }

  public String getBrandStr() {
    return brandStr;
  }

  public void setBrandStr(String brandStr) {
    this.brandStr = brandStr;
  }


  public PackService getPackService() {
    return packService;
  }

  public CategoryService getCategoryService() {
    return categoryService;
  }
}