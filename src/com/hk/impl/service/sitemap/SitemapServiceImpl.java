package com.hk.impl.service.sitemap;

import com.hk.api.response.brand.Brand;
import com.hk.api.response.brand.BrandListByPrefix;
import com.hk.api.response.brand.response.BrandListByPrefixApiResponse;
import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.api.response.catalog.results.CatalogStoreVariant;
import com.hk.api.response.category.Category;
import com.hk.api.response.category.wrapper.CategoryLinksResponseApiWrapper;
import com.hk.api.response.menu.MenuNode;
import com.hk.api.response.ui.base.url.UrlIdentifiers;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.brand.BrandService;
import com.hk.pact.service.catalog.CatalogService;
import com.hk.pact.service.category.CategoryService;
import com.hk.pact.service.menu.MenuService;
import com.hk.pact.service.sitemap.SitemapService;
import com.hk.web.manager.LinkManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class SitemapServiceImpl implements SitemapService {

  private List<String> menuLinks;
  private static final String ALL = "/all/";

  @Autowired
  private MenuService menuService;
  @Autowired
  private CategoryService categoryService;
  @Autowired
  private CatalogService catalogService;
  @Autowired
  private BrandService brandService;

  @Override
  public Set<String> getVariantAndBrandUrls() {
    Set<String> variantAndBrandLinks = new HashSet<String>(13000);
    List<Category> primaryCategories = getCategoryService().getPrimaryCategoriesForStore();
    /*
    Now we will get the products from these categories one by one
     */
    for(Category category : primaryCategories){
      if(category!=null){
        variantAndBrandLinks.addAll(getVariantLinksFromAPI(category.getPrefix()));
        variantAndBrandLinks.addAll(getBrandLinksFromAPI(category.getId()));
      }
    }
    return variantAndBrandLinks;
  }

  private Set<String> getBrandLinksFromAPI(Long catId){
    BrandListByPrefixApiResponse brandListByPrefixApiResponse = getBrandService().getBrandsInPrimaryCategory(catId);
    Set<String> brandLinks = new HashSet<String>();
    if(brandListByPrefixApiResponse!=null && brandListByPrefixApiResponse.getBrandListByPrefixList()!=null){
      for(BrandListByPrefix brandListByPrefix : brandListByPrefixApiResponse.getBrandListByPrefixList()){
        if(brandListByPrefix!=null && brandListByPrefix.getBrandDTOList()!=null){
          for(Brand brand : brandListByPrefix.getBrandDTOList()){
            if(brand!=null)
            brandLinks.add(brand.getUrl());
          }
        }
      }
    }
    return brandLinks;
  }

  private Set<String> getVariantLinksFromAPI(String catPrefix){
    CatalogResults catalogResults = getCatalogService().getCatalogResultsForCategory(catPrefix, null, null, null, null, 1, 10000, null, null, null, false);
    Set<String> variantLinks = new HashSet<String>();
    if(catalogResults!=null && catalogResults.getVariants()!=null){
      for(CatalogStoreVariant catalogStoreVariant : catalogResults.getVariants()){
        if(catalogStoreVariant!=null)
        variantLinks.add(catalogStoreVariant.getCanonicalUrl());
      }
    }
    return variantLinks;
  }

  @Override
  public List<String> getCategoryUrls() {
    List<String> categoryLinks = new ArrayList<String>(600);
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CATEGORY + URIBuilder.URL_TOKEN_SEP + StoreConstants.DEFAULT_STORE_ID.toString() + ALL);
    CategoryLinksResponseApiWrapper categoryLinksResponseApiWrapper = (CategoryLinksResponseApiWrapper)HkHttpClient.executeGet(builder.getWebServiceUrl(), CategoryLinksResponseApiWrapper.class);
    if(categoryLinksResponseApiWrapper!=null && categoryLinksResponseApiWrapper.getCategoryLinksApiResponse()!=null){
       for(UrlIdentifiers urlIdentifiers : categoryLinksResponseApiWrapper.getCategoryLinksApiResponse().getCategoryLinks()){
         if(urlIdentifiers!=null){
           categoryLinks.add(LinkManager.getGenericLandingPageUrl(urlIdentifiers.getUrlFragment(),urlIdentifiers.getNavKey()));
         }
       }
    }
    return categoryLinks;
  }

  @Override
  public List<String> getMenuNodeUrls() {
    List<MenuNode>  menuNodes = getMenuService().getMenu();
    menuLinks = new ArrayList<String>();
    for(MenuNode menuNode : menuNodes){
      if(menuNode.getChildNodes()!=null && menuNode.getChildNodes().size()>0){
        addAllChildNodesToList(menuNode);
      }
    }
    return menuLinks;
  }

  private void addAllChildNodesToList(MenuNode menuNode){
    if(menuNode.getChildNodes()!=null && menuNode.getChildNodes().size()>0){
      for(MenuNode menuNode1 : menuNode.getChildNodes()){
        addAllChildNodesToList(menuNode1);
      }
    }
    menuLinks.add(menuNode.getUrl());
  }

  public MenuService getMenuService() {
    return menuService;
  }

  public CategoryService getCategoryService() {
    return categoryService;
  }

  public CatalogService getCatalogService() {
    return catalogService;
  }

  public BrandService getBrandService() {
    return brandService;
  }
}
