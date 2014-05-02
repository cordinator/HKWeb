package com.hk.web.action.beta.catalog;

import com.hk.api.response.catalog.browse.*;
import com.hk.api.response.catalog.filter.CategoryFilter;
import com.hk.api.response.catalog.filter.PriceRange;
import com.hk.api.response.catalog.filter.BrandListingItem;
import com.hk.api.response.catalog.results.CatalogStoreVariant;
import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.api.response.catalog.CatalogResultsApiWrapper;
import com.hk.pact.service.catalog.CatalogService;
import com.hk.web.Page;
import com.hk.web.action.beta.BasePaginatedAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.*;

/**
 * @author Rimal
 */
public class CatalogAction extends BasePaginatedAction {

  private Long storeId = 1L;
  private Long menuNodeId;

  private Double minPrice;
  private Double maxPrice;

  //  private String catPrefix;
  private String brandStr;
  private String filterStr;

  private String selectedCatName;
  private String selectedCatPrefix;
  private PriceRange priceRange;
  private List<CatalogStoreVariant> variants = new ArrayList<CatalogStoreVariant>(0);
  private List<CategoryFilter> categoryFilters = new ArrayList<CategoryFilter>(0);
  private List<BrandListingItem> brandListingItems = new ArrayList<BrandListingItem>(0);
  private List<CategoryBrowseNode> categoryBrowseNodes = new ArrayList<CategoryBrowseNode>(0);
  private CatalogResultsApiWrapper catalogResultsWrapper;

  private String selectedBrands;
  private Map<String, String> selectedFilters = new HashMap<String, String>(0);

  private Page catalogPage;

  @Autowired
  private CatalogService catalogService;

  @DefaultHandler
  public Resolution pre() {
    return new ForwardResolution("/pages/catalog/catalog.jsp");
  }

  public Resolution filterResults() {
   // catalogResultsWrapper = getCatalogService().getCatalogResponse(selectedCatPrefix, minPrice, maxPrice, brandStr, filterStr, storeId, getPageNo());
    //setParamsForView(catalogResultsWrapper.getResults().getCatalog());
    return new ForwardResolution("/pages/catalog/catalog.jsp");
  }

  public Resolution serveCatalogFromMenu() {
    //catalogResultsWrapper = getCatalogService().getCatalogResponse(menuNodeId, getPageNo());
    //setParamsForView(catalogResultsWrapper.getResults().getCatalog());
    return new ForwardResolution("/pages/catalog/catalog.jsp");
  }

  private void setParamsForView(CatalogResults catalogResults) {
    if (catalogResults != null) {
      setPageNo(catalogResults.getPageNo());
      setPerPage(catalogResults.getPerPage());

      variants = catalogResults.getVariants();
      catalogPage = new Page(variants, getPerPage(), getPageNo(), catalogResults.getTotalVariants());

      /*selectedCatName = catalogResults.getSelectedCatName();
      selectedCatPrefix = catalogResults.getSelectedCatPrefix();*/
      priceRange = catalogResults.getPriceRange();
      categoryFilters = catalogResults.getFilters();
      brandListingItems = catalogResults.getBrands();
      //categoryBrowseNodes = catalogResults.getCategoryBrowseNodes();

      if (minPrice == null) {
        minPrice = priceRange.getMinPrice();
      }
      if (maxPrice == null) {
        maxPrice = priceRange.getMaxPrice();
      }

     /* selectedBrands = HKCollectionUtils.getListAsString(catalogResults.getSelectedBrands());
      for (Map.Entry<String, List<String>> filterEntry : catalogResults.getSelectedFilters().entrySet()) {
        selectedFilters.put(filterEntry.getKey(), HKCollectionUtils.getListAsString(filterEntry.getValue()));
      }*/
    }
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

  /*public String getCatPrefix() {
    return catPrefix;
  }

  public void setCatPrefix(String catPrefix) {
    this.catPrefix = catPrefix;
  }*/

  public String getBrandStr() {
    return brandStr;
  }

  public void setBrandStr(String brandStr) {
    this.brandStr = brandStr;
  }

  public String getFilterStr() {
    return filterStr;
  }

  public void setFilterStr(String filterStr) {
    this.filterStr = filterStr;
  }

  public String getSelectedCatName() {
    return selectedCatName;
  }

  public void setSelectedCatName(String selectedCatName) {
    this.selectedCatName = selectedCatName;
  }

  public String getSelectedCatPrefix() {
    return selectedCatPrefix;
  }

  public void setSelectedCatPrefix(String selectedCatPrefix) {
    this.selectedCatPrefix = selectedCatPrefix;
  }

  public PriceRange getPriceRange() {
    return priceRange;
  }

  public void setPriceRange(PriceRange priceRange) {
    this.priceRange = priceRange;
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

  public List<BrandListingItem> getBrandListingItems() {
    return brandListingItems;
  }

  public void setBrandListingItems(List<BrandListingItem> brandListingItems) {
    this.brandListingItems = brandListingItems;
  }

  public CatalogResultsApiWrapper getCatalogServeResponse() {
    return catalogResultsWrapper;
  }

  public void setCatalogServeResponse(CatalogResultsApiWrapper catalogResultsWrapper) {
    this.catalogResultsWrapper = catalogResultsWrapper;
  }

  public String getSelectedBrands() {
    return selectedBrands;
  }

  public void setSelectedBrands(String selectedBrands) {
    this.selectedBrands = selectedBrands;
  }

  public Map<String, String> getSelectedFilters() {
    return selectedFilters;
  }

  public void setSelectedFilters(Map<String, String> selectedFilters) {
    this.selectedFilters = selectedFilters;
  }

  public List<CategoryBrowseNode> getCategoryBrowseNodes() {
    return categoryBrowseNodes;
  }

  public void setCategoryBrowseNodes(List<CategoryBrowseNode> categoryBrowseNodes) {
    this.categoryBrowseNodes = categoryBrowseNodes;
  }

  public Long getMenuNodeId() {
    return menuNodeId;
  }

  public void setMenuNodeId(Long menuNodeId) {
    this.menuNodeId = menuNodeId;
  }


  public CatalogService getCatalogService() {
    return catalogService;
  }

  @Override
  public int getPageCount() {
    return catalogPage != null ? catalogPage.getTotalPages() : 0;
  }

  @Override
  public int getResultCount() {
    return catalogPage != null ? catalogPage.getTotalResults() : 0;
  }

  @Override
  public Set<String> getParamSet() {
    HashSet<String> params = new HashSet<String>();
    params.add("selectedCatPrefix");
    params.add("minPrice");
    params.add("maxPrice");
    params.add("brandStr");
    params.add("filterStr");
    params.add("menuNodeId");
    return params;
  }
}
