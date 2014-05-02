package com.hk.api.response.pack;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class Pack {

  @JsonProperty(DtoJsonConstants.ID)
  private Long id;
  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.OFFER_PRICE)
  private int offerPrice;
  @JsonProperty(DtoJsonConstants.MRP)
  private double mrp;
  @JsonProperty(DtoJsonConstants.DISCOUNT)
  private int discount;

  @JsonProperty(DtoJsonConstants.PACK_STORE_PRODUCTS)
  private List<PackStoreProduct> packStoreProducts = new ArrayList<PackStoreProduct>(0);


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
    return offerPrice;
  }

  public void setOfferPrice(int offerPrice) {
    this.offerPrice = offerPrice;
  }

  public double getMrp() {
    return mrp;
  }

  public void setMrp(double mrp) {
    this.mrp = mrp;
  }

  public int getDiscount() {
    return discount;
  }

  public void setDiscount(int discount) {
    this.discount = discount;
  }

  public List<PackStoreProduct> getPackStoreProducts() {
    return packStoreProducts;
  }

  public void setPackStoreProducts(List<PackStoreProduct> packStoreProducts) {
    this.packStoreProducts = packStoreProducts;
  }
}
