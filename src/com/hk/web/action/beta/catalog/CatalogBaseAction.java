package com.hk.web.action.beta.catalog;

import com.hk.api.response.catalog.browse.CategoryBrowseNode;
import com.hk.api.response.catalog.filter.*;
import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.api.response.catalog.results.CatalogStoreVariant;
import com.hk.api.response.ui.CatalogPage;
import com.hk.common.constants.RequestConstants;
import com.hk.pact.service.catalog.CatalogService;
import com.hk.pact.service.search.SearchService;
import com.hk.pact.service.ui.PageService;
import com.hk.util.HKCollectionUtils;
import com.hk.web.PaginationConstants;
import com.hk.web.SortingConstants;
import com.hk.web.action.beta.BasePaginatedAction;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Sunit
 */
public abstract class CatalogBaseAction extends BasePaginatedAction {

  protected String rootSlug, firstLvlSlug, secondLvlSlug, thirdLvlSlug, finalSlug;

  protected String navKey;

  protected Set<CategoryBrowseNode> categoryBrowseNodeList;

  protected List<BrowseCategoryListing> browseCategoryListings = new ArrayList<BrowseCategoryListing>();
  protected CatalogPage catalogPage;

  protected int pageNo = PaginationConstants.DEFAULT_PAGE, perPage = PaginationConstants.DEFAULT_PER_PAGE_CATALOG;
  protected Double minPrice, maxPrice;

  protected List<BrandListingItem> brandListingItems = new ArrayList<BrandListingItem>(0);
  protected List<CatalogStoreVariant> variants = new ArrayList<CatalogStoreVariant>(0);
  protected List<CategoryFilter> categoryFilters = new ArrayList<CategoryFilter>(0);
  protected PriceRange priceRange;


//  protected Set<Long> selectedBrands = new HashSet<Long>(0);

  protected String catPrefix = "";
  protected String brands = "";
  protected String fl = "";

  protected boolean excludeOOS = false;

  protected Long currBrandId;
  protected String currFilterKey, currFilterVal;

  /*protected String clickCatPrefixFl;*/

  protected int totalResults, totalPages;

  protected String txtQ;

  protected String sortBy = SortingConstants.DEFAULT_SORT_BY;

  protected String sortType = SortingConstants.DEFAULT_SORT_TYPE;
  @Autowired
  protected PageService pageService;
  @Autowired
  protected CatalogService catalogService;
  @Autowired
  private SearchService searchService;

  public void setParamsForView(CatalogResults catalogResults) {
    if (catalogResults != null) {
      setPageNo(catalogResults.getPageNo());
      setPerPage(catalogResults.getPerPage() != 0 ? catalogResults.getPerPage() : PaginationConstants.DEFAULT_PER_PAGE_CATALOG);
      this.totalResults = catalogResults.getTotalVariants();

      if (catalogResults.getTotalVariants() % getPerPage() == 0) {
        this.totalPages = (catalogResults.getTotalVariants() / getPerPage());
      } else {
        this.totalPages = (catalogResults.getTotalVariants() / getPerPage()) + 1;
      }

      variants = catalogResults.getVariants();
      //catalogPage = new Page(variants, getPerPage(), getPageNo(), catalogResults.getTotalVariants());
      priceRange = catalogResults.getPriceRange();
      categoryFilters = catalogResults.getFilters();
      brandListingItems = catalogResults.getBrands();
      browseCategoryListings = catalogResults.getBrowseCategoryListing();

      if (catalogResults.getCatPrefixes() != null && catalogResults.getCatPrefixes().size() > 0) {
        StringBuilder catPrefixFlBuilder = new StringBuilder();
        for (String catPrefixTemp : catalogResults.getCatPrefixes()) {
          catPrefixFlBuilder.append(catPrefixTemp).append("~");
        }

        catPrefix = catPrefixFlBuilder.toString();
      }

      Set<Long> selectedBrands = new HashSet<Long>();
      for (BrandListingItem brandListingItem : brandListingItems) {
        if (brandListingItem.isSelected()) {
          selectedBrands.add(brandListingItem.getBrandId());
        }
      }
      if(StringUtils.isEmpty(catPrefix)){
      } else {
        brands = HKCollectionUtils.getListAsString(new ArrayList<Long>(selectedBrands), RequestConstants.BRAND_SEP);
      }

      fl = "";
      for (CategoryFilter categoryFilter : categoryFilters) {
        List<CategoryFilterValue> categoryFilterValues = categoryFilter.getFilterValues();
        List<String> selectedValues = new ArrayList<String>();

        for (CategoryFilterValue categoryFilterValue : categoryFilterValues) {
          if (categoryFilterValue.isSelected()) {
            selectedValues.add(categoryFilterValue.getFilterValue());
          }

        }
        if (selectedValues.size() > 0) {
          fl = fl.concat(categoryFilter.getName()).concat(RequestConstants.FILTER_KEY_AND_VAL_SEP)
              .concat(HKCollectionUtils.getListAsString(selectedValues));
          fl = fl.concat(RequestConstants.FILTER_SEP);
        }
      }


      if (priceRange != null) {
        if (minPrice == null) {
          minPrice = priceRange.getMinPrice();
        }
        if (maxPrice == null) {
          maxPrice = priceRange.getMaxPrice();
        }
      }


      StringBuilder finalSlugBuilder = new StringBuilder("");

      if (StringUtils.isNotBlank(rootSlug)) {
        finalSlugBuilder = finalSlugBuilder.append("/").append(rootSlug);
      }

      if (StringUtils.isNotBlank(firstLvlSlug)) {
        finalSlugBuilder = finalSlugBuilder.append("/").append(firstLvlSlug);
      }

      if (StringUtils.isNotBlank(secondLvlSlug)) {
        finalSlugBuilder = finalSlugBuilder.append("/").append(secondLvlSlug);
      }

      if (StringUtils.isNotBlank(thirdLvlSlug)) {
        finalSlugBuilder = finalSlugBuilder.append("/").append(thirdLvlSlug);
      }

      this.finalSlug = finalSlugBuilder.toString();
    }
  }



  public String getStringFromSelectedFilters(Map<String, Set<String>> selectedFilters) {
    String filterStr = "";
    for (Map.Entry<String, Set<String>> selectedFilterEntry : selectedFilters.entrySet()) {
      filterStr = filterStr.concat(selectedFilterEntry.getKey()).concat(RequestConstants.FILTER_KEY_AND_VAL_SEP)
          .concat(HKCollectionUtils.getCollectionAsString(selectedFilterEntry.getValue()));
      filterStr = filterStr.concat(RequestConstants.FILTER_SEP);
    }
    return filterStr;
  }

  public Map<String, Set<String>> getFiltersFromUri(String filterStr) {
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

  public String getFl() {
    return fl;
  }

  public void setFl(String fl) {
    this.fl = fl;
  }

  /*public Set<Long> getSelectedBrands() {
    return selectedBrands;
  }

  public void setSelectedBrands(Set<Long> selectedBrands) {
    this.selectedBrands = selectedBrands;
  }*/

  public String getBrands() {
    return brands;
  }

  public void setBrands(String brands) {
    this.brands = brands;
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


  @Override
  public int getPageCount() {
    return this.totalPages;
  }

  @Override
  public int getResultCount() {
    return this.totalResults;
  }


  public PageService getPageService() {
    return pageService;
  }

  public CatalogService getCatalogService() {
    return catalogService;
  }

  public SearchService getSearchService() {
    return searchService;
  }

  public String getNavKey() {
    return navKey;
  }

  public void setNavKey(String navKey) {
    this.navKey = navKey;
  }

  public String getTxtQ() {
    return txtQ;
  }

  public void setTxtQ(String txtQ) {
    this.txtQ = txtQ;
  }

  public String getFinalSlug() {
    return finalSlug;
  }


  public String getRootSlug() {
    return rootSlug;
  }

  public void setRootSlug(String rootSlug) {
    this.rootSlug = rootSlug;
  }

  public String getFirstLvlSlug() {
    return firstLvlSlug;
  }

  public void setFirstLvlSlug(String firstLvlSlug) {
    this.firstLvlSlug = firstLvlSlug;
  }

  public String getSecondLvlSlug() {
    return secondLvlSlug;
  }

  public void setSecondLvlSlug(String secondLvlSlug) {
    this.secondLvlSlug = secondLvlSlug;
  }

  public String getThirdLvlSlug() {
    return thirdLvlSlug;
  }

  public void setThirdLvlSlug(String thirdLvlSlug) {
    this.thirdLvlSlug = thirdLvlSlug;
  }

  public String getSortBy() {
    return sortBy;
  }

  public void setSortBy(String sortBy) {
    this.sortBy = sortBy;
  }

  public String getSortType() {
    return sortType;
  }

  public void setSortType(String sortType) {
    this.sortType = sortType;
  }

  public String getCatPrefix() {
    return catPrefix;
  }

  public void setCatPrefix(String catPrefix) {
    this.catPrefix = catPrefix;
  }

  public List<BrowseCategoryListing> getBrowseCategoryListings() {
    return browseCategoryListings;
  }

  public void setBrowseCategoryListings(List<BrowseCategoryListing> browseCategoryListings) {
    this.browseCategoryListings = browseCategoryListings;
  }

    public boolean isExcludeOOS() {
        return excludeOOS;
    }

    public boolean getExcludeOOS() {
        return excludeOOS;
    }

    public void setExcludeOOS(boolean excludeOOS) {
        this.excludeOOS = excludeOOS;
    }

    @Override
  public Set<String> getParamSet() {
    HashSet<String> params = new HashSet<String>();
    params.add("navKey");
    params.add("excludeOOS");
//    params.add("selectedBrands");
    params.add("brands");
    params.add("fl");
    params.add("fl");
    params.add("txtQ");
    params.add("finalSlug");
    params.add("catPrefix");

    return params;
  }
}
