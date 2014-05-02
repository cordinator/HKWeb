package com.hk.api.response.variant.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.variant.image.VariantImage;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.constants.variant.RenderingRulesDTO;
import com.hk.web.manager.LinkManager;
import com.hk.util.HKNumberUtils;
import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;

/**
 * @author Rimal
 */
public abstract class AbstractStoreVariantApiResponse extends AbstractApiBaseResponse {


  //basic
  private Long id;
  @JsonProperty(DtoJsonConstants.STORE_PRODUCT_ID)
  protected Long storeProductId;
  @JsonProperty(DtoJsonConstants.CAT_PREFIX)
  protected String catPrefix;
  protected String categoryName;
  protected String brandName;

  @JsonProperty(DtoJsonConstants.NAME)
  protected String name;
  @JsonProperty(DtoJsonConstants.OFFER_PRICE)
  protected int offerPrice;

  @JsonProperty(DtoJsonConstants.MRP)
  protected Double mrp;
  @JsonProperty(DtoJsonConstants.DISCOUNT)
  protected Double discount;

  @JsonProperty(DtoJsonConstants.RANK)
  protected double rank;
  @JsonProperty(DtoJsonConstants.RATING)
  protected double rating;


  @JsonProperty(DtoJsonConstants.PRIMARY_IMAGE)
  protected VariantImage primaryImage;

  @JsonProperty(DtoJsonConstants.NAV_KEY)
  protected String navKey;
  @JsonProperty(DtoJsonConstants.URL_FRAGMENT)
  protected String urlFragment;

  @JsonProperty(DtoJsonConstants.SIBBLING_VARIANT_COUNT)
  protected int siblingVariants;

  @JsonProperty(DtoJsonConstants.OLD_VARIANT_ID)
  protected String oldVariantId;

  @JsonProperty(DtoJsonConstants.RENDERING_RULE_TYPE)
  protected long rrType;

  protected String url;

  //Reviews
  @JsonProperty(DtoJsonConstants.NO_OF_REVIEWS)
  private Long numberOfReviews;


  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getOfferPrice() {
    return Math.round(offerPrice);
//    return offerPrice;
  }

  public void setOfferPrice(int offerPrice) {
    this.offerPrice = offerPrice;
  }

  /*public long getMrp() {
    return Math.round(mrp);
  }*/

  public Double getMrp() {
    return HKNumberUtils.formatNumberUptoTwoDecimals(this.mrp);
//    return mrp;
  }

  public void setMrp(Double mrp) {
    this.mrp = mrp;
  }

  public int getDiscount() {
    double discount = 0;
    if (mrp != 0) {
      discount = (mrp - offerPrice) / mrp * 100;
    }
    return (int) Math.round(discount);
//    return discount;
  }

  public void setDiscount(Double discount) {
    this.discount = discount;
  }

  public VariantImage getPrimaryImage() {
    return primaryImage;
  }

  public void setPrimaryImage(VariantImage primaryImage) {
    this.primaryImage = primaryImage;
  }

  public Long getStoreProductId() {
    return storeProductId;
  }

  public void setStoreProductId(Long storeProductId) {
    this.storeProductId = storeProductId;
  }

  public String getCatPrefix() {
    return catPrefix;
  }

  public void setCatPrefix(String catPrefix) {
    this.catPrefix = catPrefix;
  }

  public String getCategoryName() {
    return categoryName;
  }

  public void setCategoryName(String categoryName) {
    this.categoryName = categoryName;
  }

  public String getBrandName() {
    return brandName;
  }

  public void setBrandName(String brandName) {
    this.brandName = brandName;
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

  public String getUrl() {
    if (StringUtils.isBlank(this.url)) {
      this.url = LinkManager.getVariantUrl(this);
    }
    return this.url;
  }

  public void setUrl(String url) {
    this.url = url;
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

  public int getSiblingVariants() {
    return siblingVariants;
  }

  public void setSiblingVariants(int siblingVariants) {
    this.siblingVariants = siblingVariants;
  }

  public String getOldVariantId() {
    return oldVariantId;
  }

  public void setOldVariantId(String oldVariantId) {
    this.oldVariantId = oldVariantId;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keyList = super.getKeys();
    keyList.add(DtoJsonConstants.ID);
    keyList.add(DtoJsonConstants.NAME);
    keyList.add(DtoJsonConstants.OFFER_PRICE);
    keyList.add(DtoJsonConstants.CAT_PREFIX);
    keyList.add(DtoJsonConstants.MRP);
    keyList.add(DtoJsonConstants.DISCOUNT);
    keyList.add(DtoJsonConstants.RANK);
    keyList.add(DtoJsonConstants.RATING);


    keyList.add(DtoJsonConstants.PRIMARY_IMAGE);
    keyList.add(DtoJsonConstants.URL);
    keyList.add(DtoJsonConstants.OLD_VARIANT_ID);
    keyList.add(DtoJsonConstants.SIBBLING_VARIANT_COUNT);
    keyList.add(DtoJsonConstants.NO_OF_REVIEWS);
    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    /*double discount = 0;
    if (mrp != 0) {
      discount = (mrp - offerPrice) / mrp * 100;
    }*/

    List<Object> valueList = super.getValues();
    valueList.add(this.id);
    valueList.add(this.name);
    valueList.add(this.getOfferPrice());
    valueList.add(this.catPrefix);
    valueList.add(this.getMrp());
    valueList.add(this.getDiscount());
    valueList.add(this.rank);
    valueList.add(this.rating);

    valueList.add(this.primaryImage);
    valueList.add(getUrl());

    valueList.add(this.oldVariantId);
    valueList.add(this.siblingVariants);
    valueList.add(this.numberOfReviews);

    return valueList;
  }

  public long getRrType() {
    return rrType;
  }

  public void setRrType(long rrType) {
    this.rrType = rrType;
  }

  public boolean getSpeakToNutriExpert() {
    RenderingRulesDTO rrDto = new RenderingRulesDTO(this.rrType);
    return rrDto.isSpeakToNutriExpert();
  }

  public boolean getSpeakToFitnessExpert() {
    RenderingRulesDTO rrDto = new RenderingRulesDTO(this.rrType);
    return rrDto.isSpeakToFitnessExpert();
  }

  public boolean getContactLensLayout() {
    RenderingRulesDTO rrDto = new RenderingRulesDTO(this.rrType);
    return rrDto.isContactLensLayout();
  }

  public Long getNumberOfReviews() {
    return numberOfReviews;
  }

  public void setNumberOfReviews(Long numberOfReviews) {
    this.numberOfReviews = numberOfReviews;
  }
}
