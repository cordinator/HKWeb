package com.hk.pact.service.ui;


import com.hk.api.response.brand.wrapper.BrandPageResponseApiWrapper;
import com.hk.api.response.category.wrapper.CatalogPageResponseApiWrapper;
import com.hk.api.response.category.wrapper.CategoryPageResponseApiWrapper;
import com.hk.api.response.home.wrapper.HomePageResponseApiWrapper;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 13, 2013
 * Time: 4:54:13 PM
 */
public interface PageService {

  public static final String HOME_LP_IDENTIFIER = "HM";

  public static final String CATALOG_LP_IDENTIFIER = "CL-";
  public static final String CATEGORY_LP_IDENTIFIER = "CP-";
  public static final String SUB_CATEGORY_LP_IDENTIFIER = "SCT-";
  public static final String BRAND_LP_IDENTIFIER = "BR-";
  public static final String VARIANT_LP_IDENTIFIER = "VRNT-";

  public CategoryPageResponseApiWrapper getCategoryPageResponseWrapper(String navKey);

  public CatalogPageResponseApiWrapper getCatalogResponseWrapper(String navKey);

  public CatalogPageResponseApiWrapper getCatalogResponseWrapperForCategory(String navKey);

  public BrandPageResponseApiWrapper getBrandResponseWrapperForCategory(String navKey);


  public HomePageResponseApiWrapper getHomePageResponseApiWrapper();

}
