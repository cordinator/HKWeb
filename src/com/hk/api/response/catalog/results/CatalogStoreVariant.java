package com.hk.api.response.catalog.results;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.manager.LinkManager;
import com.hk.api.response.ui.base.tags.StoreVariantTag;
import com.hk.api.response.ui.base.tags.CategoryTag;
import com.hk.api.response.ui.base.tags.BrandTag;
import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 8, 2013
 * Time: 1:10:49 PM
 */
public class CatalogStoreVariant {

  private Long id;
  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.OFFER_PRICE)
  private Double offerPrice;
  private Double mrp;
  @JsonProperty(DtoJsonConstants.DISCOUNT)
  private Double discount;
  @JsonProperty(DtoJsonConstants.SIBBLING_VARIANT_COUNT)
  private int siblingVariants;

  //brand
  @JsonProperty(DtoJsonConstants.BRAND_NAME)
  private String brandName;
  @JsonProperty(DtoJsonConstants.BRAND_INT_NAME)
  private String brandInternalName;

  //category
  private String categoryName;
  @JsonProperty(DtoJsonConstants.CAT_PREFIX)
  private String catPrefix;

  @JsonProperty(DtoJsonConstants.RANK)
  private double rank;
  @JsonProperty(DtoJsonConstants.RATING)
  private double rating;
  @JsonProperty(DtoJsonConstants.OOS)
  private boolean oos;
  @JsonProperty(DtoJsonConstants.ORDER_ENABLED)
  private boolean orderEnabled;


  //image
  @JsonProperty(DtoJsonConstants.M_IMG)
  private CatalogStoreVariantImage medImg;

  @JsonProperty(DtoJsonConstants.NAV_KEY)
  protected String navKey;
  @JsonProperty(DtoJsonConstants.URL_FRAGMENT)
  protected String urlFragment;

  @JsonProperty(DtoJsonConstants.FREEBIE_NAME)
  protected String freebieName;

  @JsonProperty(DtoJsonConstants.VARIANT_TAGS)
  private StoreVariantTag storeVariantTag;
  @JsonProperty(DtoJsonConstants.CATEGORY_TAGS)
  private CategoryTag categoryTag;
  @JsonProperty(DtoJsonConstants.BRAND_TAGS)
  private BrandTag brandTag;

  //Reviews
  @JsonProperty(DtoJsonConstants.NO_OF_REVIEWS)
  private Long numberOfReviews;

  protected String url;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getBrandName() {
    return brandName;
  }

  public void setBrandName(String brandName) {
    this.brandName = brandName;
  }

  public String getBrandInternalName() {
    return brandInternalName;
  }

  public void setBrandInternalName(String brandInternalName) {
    this.brandInternalName = brandInternalName;
  }

  public String getCategoryName() {
    return categoryName;
  }

  public void setCategoryName(String categoryName) {
    this.categoryName = categoryName;
  }

  public String getCatPrefix() {
    return catPrefix;
  }

  public void setCatPrefix(String catPrefix) {
    this.catPrefix = catPrefix;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Double getOfferPrice() {
    return offerPrice;
  }

  public void setOfferPrice(Double offerPrice) {
    this.offerPrice = offerPrice;
  }

  public Double getMrp() {
    return mrp;
  }

  public void setMrp(Double mrp) {
    this.mrp = mrp;
  }

  public Double getDiscount() {
    return discount;
  }

  public void setDiscount(Double discount) {
    this.discount = discount;
  }


  public int getSiblingVariants() {
    return siblingVariants;
  }

  public void setSiblingVariants(int siblingVariants) {
    this.siblingVariants = siblingVariants;
  }

  public double getRank() {
    return rank;
  }

  public void setRank(double rank) {
    this.rank = rank;
  }

  public double getRating() {
    return rating;
  }

  public void setRating(double rating) {
    this.rating = rating;
  }

  public CatalogStoreVariantImage getMedImg() {
    return medImg;
  }

  public void setMedImg(CatalogStoreVariantImage medImg) {
    this.medImg = medImg;
  }


  public String getNavKey() {
    return navKey;
  }

  public void setNavKey(String navKey) {
    this.navKey = navKey;
  }

  public String getUrlFragment() {
    return urlFragment;
  }

  public void setUrlFragment(String urlFragment) {
    this.urlFragment = urlFragment;
  }

  public String getUrl() {
    if (StringUtils.isBlank(this.url)) {
      this.url = LinkManager.getVariantUrl(this);
    }
    return this.url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public String getCanonicalUrl() {
    return LinkManager.getVariantLandingPageUrl(null, this.getUrlFragment());
  }

  public boolean isOos() {
    return oos;
  }

  public void setOos(boolean oos) {
    this.oos = oos;
  }

  public String getFreebieName() {
    return freebieName;
  }

  public void setFreebieName(String freebieName) {
    this.freebieName = freebieName;
  }

  public boolean isOrderEnabled() {
    return orderEnabled;
  }

  public void setOrderEnabled(boolean orderEnabled) {
    this.orderEnabled = orderEnabled;
  }

  public StoreVariantTag getStoreVariantTag() {
    return storeVariantTag;
  }

  public void setStoreVariantTag(StoreVariantTag storeVariantTag) {
    this.storeVariantTag = storeVariantTag;
  }

  public CategoryTag getCategoryTag() {
    return categoryTag;
  }

  public void setCategoryTag(CategoryTag categoryTag) {
    this.categoryTag = categoryTag;
  }

  public BrandTag getBrandTag() {
    return brandTag;
  }

  public void setBrandTag(BrandTag brandTag) {
    this.brandTag = brandTag;
  }

  public Long getNumberOfReviews() {
    return numberOfReviews;
  }

  public void setNumberOfReviews(Long numberOfReviews) {
    this.numberOfReviews = numberOfReviews;
  }
}
