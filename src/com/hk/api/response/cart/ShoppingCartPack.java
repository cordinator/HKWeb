package com.hk.api.response.cart;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 16, 2013
 * Time: 6:55:10 PM
 */
public class ShoppingCartPack {

  @JsonProperty(DtoJsonConstants.QUANTITY)
  private int packQty;

  @JsonProperty(DtoJsonConstants.ID)
  private Long packId;

  @JsonProperty(DtoJsonConstants.PACK_KEY)
  private String packKey;

  @JsonProperty(DtoJsonConstants.VARIANTS)
  private List<ShoppingCartVariant> packVariants = new ArrayList<ShoppingCartVariant>();

  @JsonProperty(DtoJsonConstants.TOTAL_OFFER_PRICE)
  protected int packTotalOfferPrice;
  @JsonProperty(DtoJsonConstants.TOTAL_MRP)
  protected double packTotalMrp;


  public int getPackQty() {
    return packQty;
  }

  public void setPackQty(int packQty) {
    this.packQty = packQty;
  }

  public List<ShoppingCartVariant> getPackVariants() {
    return packVariants;
  }

  public void setPackVariants(List<ShoppingCartVariant> packVariants) {
    this.packVariants = packVariants;
  }

  public int getPackTotalOfferPrice() {
    return packTotalOfferPrice;
  }

  public void setPackTotalOfferPrice(int packTotalOfferPrice) {
    this.packTotalOfferPrice = packTotalOfferPrice;
  }

  public double getPackTotalMrp() {
    return packTotalMrp;
  }

  public void setPackTotalMrp(double packTotalMrp) {
    this.packTotalMrp = packTotalMrp;
  }

  public Long getPackId() {
    return packId;
  }

  public void setPackId(Long packId) {
    this.packId = packId;
  }

  public String getPackKey() {
    return packKey;
  }

  public void setPackKey(String packKey) {
    this.packKey = packKey;
  }
}
