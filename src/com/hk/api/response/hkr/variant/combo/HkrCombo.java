package com.hk.api.response.hkr.variant.combo;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.common.json.JSONObject;
import com.hk.constants.rest.HKWebJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class HkrCombo extends JSONObject {

  @JsonProperty(DtoJsonConstants.ID)
  private String id;
  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.URL)
  private String url;
  @JsonProperty(DtoJsonConstants.IMG_S_LINK)
  private String sImageLink;
  @JsonProperty(DtoJsonConstants.IMG_M_LINK)
  private String mImageLink;

  @JsonProperty(DtoJsonConstants.MRP)
  private Double mrp;
  @JsonProperty(DtoJsonConstants.OFFER_PRICE)
  private Double offerPrice;
  @JsonProperty(DtoJsonConstants.DISCOUNT)
  private Double discount;


  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public String getSImageLink() {
    return sImageLink;
  }

  public void setSImageLink(String sImageLink) {
    this.sImageLink = sImageLink;
  }

  public String getMImageLink() {
    return mImageLink;
  }

  public void setMImageLink(String mImageLink) {
    this.mImageLink = mImageLink;
  }

  public Double getMrp() {
    return mrp;
  }

  public void setMrp(Double mrp) {
    this.mrp = mrp;
  }

  public Double getOfferPrice() {
    return offerPrice;
  }

  public void setOfferPrice(Double offerPrice) {
    this.offerPrice = offerPrice;
  }

  public Double getDiscount() {
    return discount;
  }

  public void setDiscount(Double discount) {
    this.discount = discount;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keyList = new ArrayList<String>();

    keyList.add(HKWebJsonConstants.ID);
    keyList.add(HKWebJsonConstants.NAME);
    keyList.add(HKWebJsonConstants.URL);
    keyList.add(HKWebJsonConstants.IMG_S_LINK);
    keyList.add(HKWebJsonConstants.IMG_M_LINK);
    keyList.add(HKWebJsonConstants.MRP);
    keyList.add(HKWebJsonConstants.OFFER_PRICE);
    keyList.add(HKWebJsonConstants.DISCOUNT);
    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> valueList = new ArrayList<Object>();

    valueList.add(this.id);
    valueList.add(this.name);
    valueList.add(this.url);
    valueList.add(this.sImageLink);
    valueList.add(this.mImageLink);
    valueList.add(this.mrp);
    valueList.add(this.offerPrice);
    valueList.add(this.discount);
    return valueList;
  }
}
