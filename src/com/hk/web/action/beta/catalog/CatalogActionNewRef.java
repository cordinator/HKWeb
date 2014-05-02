package com.hk.web.action.beta.catalog;

import com.hk.api.response.catalog.browse.CategoryBrowseNode;
import com.hk.api.response.catalog.filter.BrandListingItem;
import com.hk.api.response.catalog.filter.CategoryFilter;
import com.hk.api.response.catalog.filter.CategoryFilterValue;
import com.hk.api.response.catalog.filter.PriceRange;
import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.api.response.catalog.results.CatalogStoreVariant;
import com.hk.api.response.category.wrapper.CatalogPageResponseApiWrapper;
import com.hk.api.response.ui.CatalogPage;
import com.hk.common.constants.RequestConstants;
import com.hk.pact.service.catalog.CatalogService;
import com.hk.pact.service.ui.PageService;
import com.hk.util.HKCollectionUtils;
import com.hk.web.PaginationConstants;
import com.hk.web.action.beta.category.CategoryAction;
import net.sourceforge.stripes.action.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Oct 28, 2013
 * Time: 1:27:57 PM
 */
public class CatalogActionNewRef {


  private String navKey;


  // will be used on click of a browse node
  /*private String clickCatPrefix;*/
  /*private Long pageTypeId;
  private String pageTypeValue;
*/

  private Set<CategoryBrowseNode> categoryBrowseNodeList;
  private CatalogPage catalogPage;


  /*private boolean fromMenu;*/


  private int pageNo = PaginationConstants.DEFAULT_PAGE, perPage = PaginationConstants.DEFAULT_PER_PAGE_CATALOG;
  private Double minPrice, maxPrice;

  private List<BrandListingItem> brandListingItems = new ArrayList<BrandListingItem>(0);
  private List<CatalogStoreVariant> variants = new ArrayList<CatalogStoreVariant>(0);
  private List<CategoryFilter> categoryFilters = new ArrayList<CategoryFilter>(0);
  private PriceRange priceRange;


  private Set<Long> selectedBrands = new HashSet<Long>(0);
  private String attrFilterStr = "";

  private Long currBrandId;
  private String currFilterKey, currFilterVal;

  private int totalResults, totalPages;

  @Autowired
  private PageService pageService;


  @Autowired
  private CatalogService catalogService;


  @DefaultHandler
  public Resolution renderCatalog() {

    if (StringUtils.isBlank(navKey)) {
      //return new ForwardResolution("/pages/404.jsp");
      return new ErrorResolution(404);
    }
    /*if (StringUtils.isBlank(navKey) && StringUtils.isBlank(clickCatPrefix)) {
      return null; //TODO: 404
    }*/

    if (navKey.contains(PageService.CATEGORY_LP_IDENTIFIER)) {
      return new ForwardResolution(CategoryAction.class).addParameter("navKey", navKey);
    }


    boolean isMenuLanding = navKey.contains(PageService.CATALOG_LP_IDENTIFIER);

    CatalogPageResponseApiWrapper catalogPageResponseApiWrapper = null;
    CatalogResults catalogResults = null;

    /*if (StringUtils.isNotBlank(navKey)) {*/
    if (isMenuLanding) {
      //catalogPageResponseApiWrapper = getPageService().getCatalogResponseWrapper(PageTypeEnum.MENU_LANDING.getId(), menuNodeId.toString());
      catalogPageResponseApiWrapper = getPageService().getCatalogResponseWrapper(navKey);
      //catalogResults = getCatalogService().getCatalogResults(navKey, pageNo, perPage);
    } else {


      catalogPageResponseApiWrapper = getPageService().getCatalogResponseWrapperForCategory(navKey);
      String brandFilterStr = "";
      for (Long brandId : selectedBrands) {
        brandFilterStr += brandId.toString().concat(RequestConstants.BRAND_SEP);
      }

      String clickCatPrefix = navKey.replaceAll(PageService.SUB_CATEGORY_LP_IDENTIFIER, "");
      //catalogResults = getCatalogService().getCatalogResultsForCategory(clickCatPrefix, minPrice, maxPrice, brandFilterStr, attrFilterStr, pageNo, perPage);
    }

    if (catalogPageResponseApiWrapper != null && catalogPageResponseApiWrapper.getCatalogPageApiResponse() != null) {
      this.catalogPage = catalogPageResponseApiWrapper.getCatalogPageApiResponse().getCatalogPage();
      if (this.catalogPage != null) {
        if (this.catalogPage.getCategoryBrowseNodeList() != null) {
          this.categoryBrowseNodeList = this.catalogPage.getCategoryBrowseNodeList();
        }
      }
    } else {
      //return new ForwardResolution("/pages/404.jsp");
      return new ErrorResolution(404);
    }


    if (catalogResults != null) {
      setParamsForView(catalogResults);
    }


    /*if (this.catalogPage != null) {
      //tODO: hack here for stag
      Map<String, PageBanner> apiSlots = catalogPage.getSlotToBanner();
      if (apiSlots.size() > 0) {
        Map<String, PageBanner> finalSlots = new LinkedHashMap<String, PageBanner>();

        finalSlots.put("one", apiSlots.get("one"));
        finalSlots.put("two", apiSlots.get("two"));
        finalSlots.put("three", apiSlots.get("three"));

        *//*for (Map.Entry<String, PageBanner> finalSlotEntry : finalSlots.entrySet()) {
          PageBanner pageBanner = finalSlotEntry.getValue();

          if (pageBanner != null) {
            for (PageBannerImage pageBannerImage : pageBanner.getBannerImages()) {
              String mLink = pageBannerImage.getMlink();
              if (!(mLink.contains("38532") || mLink.contains("38527"))) {
                mLink = mLink.replace("prod", "stag");
                pageBannerImage.setMlink(mLink);

                String lLink = pageBannerImage.getLlink();
                lLink = lLink.replace("prod", "stag");
                pageBannerImage.setLlink(lLink);
              }


            }
          }
        }*//*
        catalogPage.setSlotToBanner(finalSlots);
      }
    }
    //TODO: en hack remove*/

    return new ForwardResolution("/pages/catalog/catalog1.jsp");
  }

  private void setParamsForView(CatalogResults catalogResults) {
    if (catalogResults != null) {
      setPageNo(catalogResults.getPageNo());
      setPerPage(catalogResults.getPerPage());


      /*//TODO: remove this hack

      if (StringUtils.isBlank(clickCatPrefix)) {
        clickCatPrefix = catalogResults.getCatPrefixes().get(0);
      }*/

      this.totalResults = catalogResults.getTotalVariants();
      if (catalogResults.getTotalVariants() % catalogResults.getPerPage() == 0) {
        this.totalPages = (catalogResults.getTotalVariants() / catalogResults.getPerPage());
      } else {
        this.totalPages = (catalogResults.getTotalVariants() / catalogResults.getPerPage()) + 1;
      }

      variants = catalogResults.getVariants();
      //catalogPage = new Page(variants, getPerPage(), getPageNo(), catalogResults.getTotalVariants());


      priceRange = catalogResults.getPriceRange();
      categoryFilters = catalogResults.getFilters();
      brandListingItems = catalogResults.getBrands();


      for (BrandListingItem brandListingItem : brandListingItems) {
        if (brandListingItem.isSelected()) {
          selectedBrands.add(brandListingItem.getBrandId());
        }
      }

      attrFilterStr = "";
      for (CategoryFilter categoryFilter : categoryFilters) {
        List<CategoryFilterValue> categoryFilterValues = categoryFilter.getFilterValues();
        List<String> selectedValues = new ArrayList<String>();

        for (CategoryFilterValue categoryFilterValue : categoryFilterValues) {
          if (categoryFilterValue.isSelected()) {
            selectedValues.add(categoryFilterValue.getFilterValue());
          }

        }
        if (selectedValues.size() > 0) {
          attrFilterStr = attrFilterStr.concat(categoryFilter.getName()).concat(RequestConstants.FILTER_KEY_AND_VAL_SEP)
              .concat(HKCollectionUtils.getListAsString(selectedValues));
          attrFilterStr = attrFilterStr.concat(RequestConstants.FILTER_SEP);
        }
      }


      if (minPrice == null) {
        minPrice = priceRange.getMinPrice();
      }
      if (maxPrice == null) {
        maxPrice = priceRange.getMaxPrice();
      }

    }
  }


  public Resolution clickCategoryNode() {

    /*if (PageTypeEnum.SUB_CAT.getId().equals(pageTypeId)) {

      Long subCatId = Long.parseLong(pageTypeValue);
      return LinkManager.getRedirectResolutionForSubCatPage(subCatId, clickCatPrefix);
      *//*return new RedirectResolution(CatalogActionNew.class)
          .addParameter("clickCatPrefix", clickCatPrefix)
          .addParameter("pageTypeValue", pageTypeValue)
          .addParameter("pageTypeId", PageTypeEnum.SUB_CAT.getId());*//*

    } else if (pageTypeId.equals(PageTypeEnum.CATEGORY.getId())) {

      Long categoryId = Long.parseLong(this.pageTypeValue);
      return LinkManager.getRedirectResolutionForCategoryPage(categoryId);

      //return new ForwardResolution(CategoryAction.class).addParameter("pageTypeValue", this.pageTypeValue);
    }*/

    //return new ForwardResolution("/pages/404.jsp");
    return new ErrorResolution(404);

  }


  public Resolution filterByBrand() {
    if (currBrandId != null) {
      if (selectedBrands.contains(currBrandId)) {
        selectedBrands.remove(currBrandId);
      } else {
        selectedBrands.add(currBrandId);
      }
    }

    return new RedirectResolution(CatalogActionNew.class).addParameter("navKey", navKey)
        /*.addParameter("clickCatPrefix", clickCatPrefix)*/
        .addParameter("selectedBrands", selectedBrands)
        .addParameter("attrFilterStr", attrFilterStr);

  }


  public Resolution filterByAttr() {

    if (StringUtils.isNotBlank(currFilterKey) && StringUtils.isNotBlank(currFilterVal)) {
      Map<String, Set<String>> selectedFilters = getFiltersFromUri(attrFilterStr);
      if (selectedFilters == null) {
        selectedFilters = new HashMap<String, Set<String>>();
      }
      Set<String> selectedValues;
      if (selectedFilters.get(currFilterKey) != null) {
        selectedValues = selectedFilters.get(currFilterKey);
      } else {
        selectedValues = new HashSet<String>();
        selectedFilters.put(currFilterKey, selectedValues);
      }

      if (selectedValues.contains(currFilterVal)) {
        selectedValues.remove(currFilterVal);
      } else {
        selectedValues.add(currFilterVal);
      }
      this.attrFilterStr = getStringFromSelectedFilters(selectedFilters);
    }

    return new RedirectResolution(CatalogActionNew.class)
        .addParameter("navKey", navKey)
            /*.addParameter("clickCatPrefix", clickCatPrefix)*/
        .addParameter("selectedBrands", selectedBrands)
        .addParameter("attrFilterStr", attrFilterStr);

  }

  private String getStringFromSelectedFilters(Map<String, Set<String>> selectedFilters) {
    String filterStr = "";
    for (Map.Entry<String, Set<String>> selectedFilterEntry : selectedFilters.entrySet()) {
      filterStr = filterStr.concat(selectedFilterEntry.getKey()).concat(RequestConstants.FILTER_KEY_AND_VAL_SEP)
          .concat(HKCollectionUtils.getCollectionAsString(selectedFilterEntry.getValue()));
      filterStr = filterStr.concat(RequestConstants.FILTER_SEP);
    }
    return filterStr;
  }

  private Map<String, Set<String>> getFiltersFromUri(String filterStr) {
    Map<String, Set<String>> filters;

    if (StringUtils.isNotBlank(filterStr)) {
      filters = new HashMap<String, Set<String>>();
    } else {
      return null;
    }

    try {
      String[] paramsArr = filterStr.split(";");

      for (String param : paramsArr) {
        String[] splitParams = param.split(":");

        if (splitParams.length == 2) {
          String key = splitParams[0];
          String value = splitParams[1];
          String[] values = value.split(",");

          Set<String> valuesList = new HashSet<String>();
          valuesList.addAll(Arrays.asList(values));

          filters.put(key, valuesList);
        }

      }
    } catch (Exception e) {
      //logger.error("Error parsing filter params" + e.getMessage());
      e.printStackTrace(); //TODO: logger
    }

    return filters;
  }


/*  public Long getMenuNodeId() {
    return menuNodeId;
  }

  public void setMenuNodeId(Long menuNodeId) {
    this.menuNodeId = menuNodeId;
  }*/


  public Set<CategoryBrowseNode> getCategoryBrowseNodeList() {
    return categoryBrowseNodeList;
  }

  public void setCategoryBrowseNodeList(Set<CategoryBrowseNode> categoryBrowseNodeList) {
    this.categoryBrowseNodeList = categoryBrowseNodeList;
  }

  public CatalogPage getCatalogPage() {
    return catalogPage;
  }

  public void setCatalogPage(CatalogPage catalogPage) {
    this.catalogPage = catalogPage;
  }

  /*public String getClickCatPrefix() {
    return clickCatPrefix;
  }

  public void setClickCatPrefix(String clickCatPrefix) {
    this.clickCatPrefix = clickCatPrefix;
  }*/


  public int getPageNo() {
    return pageNo;
  }

  public void setPageNo(int pageNo) {
    this.pageNo = pageNo;
  }

  public int getPerPage() {
    return perPage;
  }

  public void setPerPage(int perPage) {
    this.perPage = perPage;
  }

  public Double getMinPrice() {
    return minPrice;
  }

  public void setMinPrice(Double minPrice) {
    this.minPrice = minPrice;
  }

  public Double getMaxPrice() {
    return maxPrice;
  }

  public void setMaxPrice(Double maxPrice) {
    this.maxPrice = maxPrice;
  }

  public List<BrandListingItem> getBrandListingItems() {
    return brandListingItems;
  }

  public void setBrandListingItems(List<BrandListingItem> brandListingItems) {
    this.brandListingItems = brandListingItems;
  }

  public List<CatalogStoreVariant> getVariants() {
    return variants;
  }

  public void setVariants(List<CatalogStoreVariant> variants) {
    this.variants = variants;
  }

  public List<CategoryFilter> getCategoryFilters() {
    return categoryFilters;
  }

  public void setCategoryFilters(List<CategoryFilter> categoryFilters) {
    this.categoryFilters = categoryFilters;
  }

  public PriceRange getPriceRange() {
    return priceRange;
  }

  public void setPriceRange(PriceRange priceRange) {
    this.priceRange = priceRange;
  }

  public String getAttrFilterStr() {
    return attrFilterStr;
  }

  public void setAttrFilterStr(String attrFilterStr) {
    this.attrFilterStr = attrFilterStr;
  }

  public Set<Long> getSelectedBrands() {
    return selectedBrands;
  }

  public void setSelectedBrands(Set<Long> selectedBrands) {
    this.selectedBrands = selectedBrands;
  }

  public Long getCurrBrandId() {
    return currBrandId;
  }

  public void setCurrBrandId(Long currBrandId) {
    this.currBrandId = currBrandId;
  }

  public String getCurrFilterKey() {
    return currFilterKey;
  }

  public void setCurrFilterKey(String currFilterKey) {
    this.currFilterKey = currFilterKey;
  }

  public String getCurrFilterVal() {
    return currFilterVal;
  }

  public void setCurrFilterVal(String currFilterVal) {
    this.currFilterVal = currFilterVal;
  }


  public int getPageCount() {
    return this.totalPages;
  }


  public int getResultCount() {
    return this.totalResults;
  }


  public PageService getPageService() {
    return pageService;
  }

  public CatalogService getCatalogService() {
    return catalogService;
  }

  public String getNavKey() {
    return navKey;
  }

  public void setNavKey(String navKey) {
    this.navKey = navKey;
  }


  public Set<String> getParamSet() {
    HashSet<String> params = new HashSet<String>();
    params.add("navKey");
    /*params.add("clickCatPrefix");*/
    params.add("selectedBrands");
    params.add("attrFilterStr");
    return params;
  }


}
