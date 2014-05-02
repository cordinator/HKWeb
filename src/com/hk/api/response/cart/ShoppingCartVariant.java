package com.hk.api.response.cart;

import com.hk.api.response.catalog.results.CatalogStoreVariantImage;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 4, 2013
 * Time: 4:25:23 PM
 */
public class ShoppingCartVariant {


  @JsonProperty(DtoJsonConstants.STORE_VARIANT_ID)
  private Long storeVariantId;
  @JsonProperty(DtoJsonConstants.STORE_VARIANT_NAME)
  private String name;

  @JsonProperty(DtoJsonConstants.QUANTITY)
  private int qty;
  @JsonProperty(DtoJsonConstants.TOTAL_OFFER_PRICE)
  private int variantTotalOfferPrice;
  @JsonProperty(DtoJsonConstants.TOTAL_MRP)
  private double variantTotalMrp;
  @JsonProperty(DtoJsonConstants.MIN_DISPATCH_DAYS)
  private Long minDispatchDays;
  @JsonProperty(DtoJsonConstants.MAX_DISPATCH_DAYS)
  private Long maxDispatchDays;

  @JsonProperty(DtoJsonConstants.PRIMARY_IMAGE)
  private CatalogStoreVariantImage catalogStoreVariantImageVO;

  @JsonProperty(DtoJsonConstants.NAV_KEY)
  private String navKey;
  @JsonProperty(DtoJsonConstants.URL_FRAGMENT)
  private String urlFragment;


  public Long getStoreVariantId() {
    return storeVariantId;
  }

  public void setStoreVariantId(Long storeVariantId) {
    this.storeVariantId = storeVariantId;
  }


  public int getQty() {
    return qty;
  }

  public void setQty(int qty) {
    this.qty = qty;
  }

  public int getVariantTotalOfferPrice() {
    return variantTotalOfferPrice;
  }

  public void setVariantTotalOfferPrice(int variantTotalOfferPrice) {
    this.variantTotalOfferPrice = variantTotalOfferPrice;
  }

  public double getVariantTotalMrp() {
    return variantTotalMrp;
  }

  public void setVariantTotalMrp(double variantTotalMrp) {
    this.variantTotalMrp = variantTotalMrp;
  }

  public Long getMinDispatchDays() {
    return minDispatchDays;
  }

  public void setMinDispatchDays(Long minDispatchDays) {
    this.minDispatchDays = minDispatchDays;
  }

  public Long getMaxDispatchDays() {
    return maxDispatchDays;
  }

  public void setMaxDispatchDays(Long maxDispatchDays) {
    this.maxDispatchDays = maxDispatchDays;
  }

  public CatalogStoreVariantImage getCatalogStoreVariantImageVO() {
    return catalogStoreVariantImageVO;
  }

  public void setCatalogStoreVariantImageVO(CatalogStoreVariantImage catalogStoreVariantImageVO) {
    this.catalogStoreVariantImageVO = catalogStoreVariantImageVO;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
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
}
