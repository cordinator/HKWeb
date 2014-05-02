package com.hk.api.response.autocompleter.response;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 17, 2013
 * Time: 9:05:41 PM
 */
public class AutoCompleterVariantResponseItem extends AutoCompleterResponseItem {

  @JsonProperty(DtoJsonConstants.ID)
  private Long id;

  @JsonProperty(DtoJsonConstants.OFFER_PRICE)
  private Double offerPrice;
  @JsonProperty(DtoJsonConstants.NO_OF_VARIANTS)
  private int numberOfVariants;
  @JsonProperty(DtoJsonConstants.RATING)
  private double rating;
  @JsonProperty(DtoJsonConstants.RANK)
  private double rank;

  @JsonProperty(DtoJsonConstants.IMG_S_LINK)
  private String slink;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Double getOfferPrice() {
    return offerPrice;
  }

  public void setOfferPrice(Double offerPrice) {
    this.offerPrice = offerPrice;
  }

  public int getNumberOfVariants() {
    return numberOfVariants;
  }

  public void setNumberOfVariants(int numberOfVariants) {
    this.numberOfVariants = numberOfVariants;
  }

  public double getRating() {
    return rating;
  }

  public void setRating(double rating) {
    this.rating = rating;
  }

  public double getRank() {
    return rank;
  }

  public void setRank(double rank) {
    this.rank = rank;
  }

  public String getSlink() {
    return slink;
  }

  public void setSlink(String slink) {
    this.slink = slink;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(DtoJsonConstants.ID);
    keys.add(DtoJsonConstants.OFFER_PRICE);
    keys.add(DtoJsonConstants.NO_OF_VARIANTS);
    keys.add(DtoJsonConstants.RATING);
    keys.add(DtoJsonConstants.IMG_S_LINK);

    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.id);
    values.add(this.offerPrice);
    values.add(this.numberOfVariants);
    values.add(this.rating);
    values.add(this.slink);

    return values;
  }
}
