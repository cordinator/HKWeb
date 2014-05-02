package com.hk.api.response.variant.review;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.common.json.JSONObject;
import com.hk.constants.rest.HKWebJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Rimal
 */
public class VariantRating extends JSONObject {

  @JsonProperty(DtoJsonConstants.STORE_VARIANT_ID)
  private Long storeVariantId;
  @JsonProperty(DtoJsonConstants.STORE_VARIANT_NAME)
  private String storeVariantName;

  @JsonProperty(DtoJsonConstants.OVERALL_STAR_RATING)
  private Double overallRating;
  @JsonProperty(DtoJsonConstants.TOTAL_RATINGS)
  private Long totalNumberOfRating;
  @JsonProperty(DtoJsonConstants.RATING_PER_DOMAIN)
  private Map<Long, Long> ratingPerDomain = new HashMap<Long, Long>(0);


  public Long getStoreVariantId() {
    return storeVariantId;
  }

  public void setStoreVariantId(Long storeVariantId) {
    this.storeVariantId = storeVariantId;
  }

  public String getStoreVariantName() {
    return storeVariantName;
  }

  public void setStoreVariantName(String storeVariantName) {
    this.storeVariantName = storeVariantName;
  }

  public Double getOverallRating() {
    return overallRating;
  }

  public void setOverallRating(Double overallRating) {
    this.overallRating = overallRating;
  }

  public Long getTotalNumberOfRating() {
    return totalNumberOfRating;
  }

  public void setTotalNumberOfRating(Long totalNumberOfRating) {
    this.totalNumberOfRating = totalNumberOfRating;
  }

  public Map<Long, Long> getRatingPerDomain() {
    return ratingPerDomain;
  }

  public void setRatingPerDomain(Map<Long, Long> ratingPerDomain) {
    this.ratingPerDomain = ratingPerDomain;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keyList = new ArrayList<String>(0);
    keyList.add(HKWebJsonConstants.STORE_VARIANT_ID);
    keyList.add(HKWebJsonConstants.SV_NAME);
    keyList.add(HKWebJsonConstants.OVERALL_STAR_RATING);
    keyList.add(HKWebJsonConstants.TOTAL_RATINGS);
    keyList.add(HKWebJsonConstants.RATING_PER_DOMAIN);
    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> valueList = new ArrayList<Object>(0);
    valueList.add(this.storeVariantId);
    valueList.add(this.storeVariantName);
    valueList.add(this.overallRating);
    valueList.add(this.totalNumberOfRating);
    valueList.add(this.ratingPerDomain);
    return valueList;
  }
}
