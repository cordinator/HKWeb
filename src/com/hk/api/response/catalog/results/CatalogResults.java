package com.hk.api.response.catalog.results;

import com.hk.api.response.catalog.filter.*;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.common.json.JSONObject;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 8, 2013
 * Time: 12:58:32 PM
 */
public class CatalogResults extends JSONObject {


  /*@JsonProperty(DtoJsonConstants.SELECTED_CATEGORY_NAME)
  private String selectedCatName;
  @JsonProperty(DtoJsonConstants.SELECTED_CATEGORY_PREFIX)
  private String selectedCatPrefix;*/

  @JsonProperty(DtoJsonConstants.PRICE_RANGE)
  private PriceRange priceRange;

  @JsonProperty(DtoJsonConstants.TOT_VARIANTS)
  private int totalVariants;

  private List<BrandListingItem> brands = new ArrayList<BrandListingItem>(0);
  @JsonProperty(DtoJsonConstants.CAT_LISTING)
  private List<BrowseCategoryListing> browseCategoryListing = new ArrayList<BrowseCategoryListing>();
  private List<CategoryFilter> filters = new ArrayList<CategoryFilter>(0);
  private List<CatalogStoreVariant> variants = new ArrayList<CatalogStoreVariant>(0);

  @JsonProperty(DtoJsonConstants.CAT_PREFIXES)
  private List<String> catPrefixes;

  /*@JsonProperty(DtoJsonConstants.SEL_BRANDS)
  private List<Long> selectedBrands = new ArrayList<Long>(0);
  @JsonProperty(DtoJsonConstants.SEL_FILTERS)
  private Map<String, List<String>> selectedFilters = new HashMap<String, List<String>>(0);
*/

  @JsonProperty(DtoJsonConstants.PAGE_NO)
  private int pageNo;
  @JsonProperty(DtoJsonConstants.PER_PAGE)
  private int perPage;

  @JsonProperty(DtoJsonConstants.TEXT_QUERY)
  private String textQuery;

  @JsonProperty(DtoJsonConstants.EXCLUDE_OOS)
  private boolean excludeOOS;


  /* public String getSelectedCatName() {
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
  }*/

  public List<CatalogStoreVariant> getVariants() {
    return variants;
  }

  public void setVariants(List<CatalogStoreVariant> variants) {
    this.variants = variants;
  }

  public List<CategoryFilter> getFilters() {
    return filters;
  }

  public void setFilters(List<CategoryFilter> filters) {
    this.filters = filters;
  }

  public PriceRange getPriceRange() {
    return priceRange;
  }

  public void setPriceRange(PriceRange priceRange) {
    this.priceRange = priceRange;
  }

  public int getTotalVariants() {
    return totalVariants;
  }

  public void setTotalVariants(int totalVariants) {
    this.totalVariants = totalVariants;
  }

  public List<BrandListingItem> getBrands() {
    return brands;
  }

  public void setBrands(List<BrandListingItem> brands) {
    this.brands = brands;
  }

  /*public List<Long> getSelectedBrands() {
    return selectedBrands;
  }

  public void setSelectedBrands(List<Long> selectedBrands) {
    this.selectedBrands = selectedBrands;
  }

  public Map<String, List<String>> getSelectedFilters() {
    return selectedFilters;
  }

  public void setSelectedFilters(Map<String, List<String>> selectedFilters) {
    this.selectedFilters = selectedFilters;
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

  public List<String> getCatPrefixes() {
    return catPrefixes;
  }

  public void setCatPrefixes(List<String> catPrefixes) {
    this.catPrefixes = catPrefixes;
  }

  public List<BrowseCategoryListing> getBrowseCategoryListing() {
    return browseCategoryListing;
  }

  public void setBrowseCategoryListing(List<BrowseCategoryListing> browseCategoryListing) {
    this.browseCategoryListing = browseCategoryListing;
  }

    public String getTextQuery() {
    return textQuery;
  }

  public void setTextQuery(String textQuery) {
    this.textQuery = textQuery;
  }

  public boolean isExcludeOOS() {
      return excludeOOS;
  }

  public void setExcludeOOS(boolean excludeOOS) {
      this.excludeOOS = excludeOOS;
  }

    @Override
  protected List<String> getKeys() {

    List<String> keyList = new ArrayList<String>();

    keyList.add("priceRange");
    keyList.add("totalVariants");
    keyList.add("brands");
    keyList.add("browseCategoryListing");
    keyList.add("filters");
    keyList.add("variants");
    keyList.add("catPrefixes");
    keyList.add("pageNo");
    keyList.add("perPage");
    keyList.add("txtQ");
    keyList.add("excludeOOS");

    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = new ArrayList<Object>();
    values.add(this.priceRange);
    values.add(this.totalVariants);
    values.add(this.brands);
    values.add(this.browseCategoryListing);
    values.add(this.filters);
    values.add(this.variants);
    values.add(this.catPrefixes);
    values.add(this.pageNo);
    values.add(this.perPage);
    values.add(this.textQuery);
    values.add(this.excludeOOS);

    return values;
  }
}
