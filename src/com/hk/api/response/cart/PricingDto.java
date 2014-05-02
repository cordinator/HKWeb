package com.hk.api.response.cart;

import com.hk.api.response.cart.offer.OfferDTO;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.common.json.JSONObject;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 10, 2013
 * Time: 2:47:08 PM
 */
public abstract class PricingDto extends JSONObject {


  @JsonProperty(DtoJsonConstants.CART_VARIANTS)
  protected List<ShoppingCartVariant> shoppingCartVariants = new ArrayList<ShoppingCartVariant>();


  @JsonProperty(DtoJsonConstants.CART_PACKS)
  protected List<ShoppingCartPack> shoppingCartPacks = new ArrayList<ShoppingCartPack>();

  @JsonProperty(DtoJsonConstants.CART_OFFERS)
  protected List<OfferDTO> applicablePromptOffers = new ArrayList<OfferDTO>();

  @JsonProperty(DtoJsonConstants.TOTAL_MRP)
  protected double totalMrp;
  @JsonProperty(DtoJsonConstants.TOTAL_OFFER_PRICE)
  protected double totalOfferPrice;
  @JsonProperty(DtoJsonConstants.TOTAL_SHIPPING_CHARGES)
  protected double shippingCharges;
  @JsonProperty(DtoJsonConstants.TOTAL_PAYABLE)
  protected double totalPayable;
  @JsonProperty(DtoJsonConstants.PROMO_DIS)
  protected double promoDiscount;
  @JsonProperty(DtoJsonConstants.STORE_DIS)
  protected double storeDiscount;

  @JsonProperty(DtoJsonConstants.APPLIED_OFFER_ID)
  protected Long appliedOfferId;


  public List<ShoppingCartVariant> getShoppingCartVariants() {
    return shoppingCartVariants;
  }

  public void setShoppingCartVariants(List<ShoppingCartVariant> shoppingCartVariants) {
    this.shoppingCartVariants = shoppingCartVariants;
  }

  public double getTotalMrp() {
    return totalMrp;
  }

  public void setTotalMrp(double totalMrp) {
    this.totalMrp = totalMrp;
  }

  public double getTotalOfferPrice() {
    return totalOfferPrice;
  }

  public void setTotalOfferPrice(double totalOfferPrice) {
    this.totalOfferPrice = totalOfferPrice;
  }

  public double getShippingCharges() {
    return shippingCharges;
  }

  public void setShippingCharges(double shippingCharges) {
    this.shippingCharges = shippingCharges;
  }

  public double getTotalPayable() {
    return totalPayable;
  }

  public void setTotalPayable(double totalPayable) {
    this.totalPayable = totalPayable;
  }

  public List<ShoppingCartPack> getShoppingCartPacks() {
    return shoppingCartPacks;
  }

  public void setShoppingCartPacks(List<ShoppingCartPack> shoppingCartPacks) {
    this.shoppingCartPacks = shoppingCartPacks;
  }

  public List<OfferDTO> getApplicablePromptOffers() {
    return applicablePromptOffers;
  }

  public void setApplicablePromptOffers(List<OfferDTO> applicablePromptOffers) {
    this.applicablePromptOffers = applicablePromptOffers;
  }

  public double getPromoDiscount() {
    return promoDiscount;
  }

  public void setPromoDiscount(double promoDiscount) {
    this.promoDiscount = promoDiscount;
  }

  public double getStoreDiscount() {
    return storeDiscount;
  }

  public void setStoreDiscount(double storeDiscount) {
    this.storeDiscount = storeDiscount;
  }

  public Long getAppliedOfferId() {
    return appliedOfferId;
  }

  public void setAppliedOfferId(Long appliedOfferId) {
    this.appliedOfferId = appliedOfferId;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keyList = new ArrayList<String>(0);

    keyList.add(DtoJsonConstants.CART_VARIANTS);
    keyList.add(DtoJsonConstants.CART_PACKS);
    keyList.add(DtoJsonConstants.CART_OFFERS);
    keyList.add(DtoJsonConstants.TOTAL_MRP);
    keyList.add(DtoJsonConstants.TOTAL_OFFER_PRICE);
    keyList.add(DtoJsonConstants.TOTAL_SHIPPING_CHARGES);
    keyList.add(DtoJsonConstants.TOTAL_PAYABLE);
    keyList.add(DtoJsonConstants.STORE_DIS);
    keyList.add(DtoJsonConstants.PROMO_DIS);
    keyList.add(DtoJsonConstants.APPLIED_OFFER_ID);
    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> valueList = new ArrayList<Object>(0);

    valueList.add(this.shoppingCartVariants);
    valueList.add(this.shoppingCartPacks);
    valueList.add(this.applicablePromptOffers);
    valueList.add(this.totalMrp);
    valueList.add(this.totalOfferPrice);
    valueList.add(this.shippingCharges);
    valueList.add(this.totalPayable);
    valueList.add(this.storeDiscount);
    valueList.add(this.promoDiscount);
    valueList.add(this.appliedOfferId);
    return valueList;
  }
}
