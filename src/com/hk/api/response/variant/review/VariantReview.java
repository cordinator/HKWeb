package com.hk.api.response.variant.review;

import com.hk.common.json.JSONObject;
import com.hk.constants.rest.HKWebJsonConstants;
import com.hk.web.manager.LinkManager;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.hk.common.constants.DtoJsonConstants;

/**
 * @author Rimal
 */
public class VariantReview extends JSONObject{

  @JsonProperty(DtoJsonConstants.ID)
  private Long id;
  @JsonProperty(DtoJsonConstants.STORE_VARIANT_ID)
  private Long storeVariantId;

  @JsonProperty(DtoJsonConstants.URL_FRAGMENT)
  private String storeVariantUrlFragment;

  @JsonProperty(DtoJsonConstants.NAV_KEY)
  private String storeVariantNavKey;

  @JsonProperty(DtoJsonConstants.STORE_VARIANT_NAME)
  private String storeVariantName;

  @JsonProperty(DtoJsonConstants.USER)
  private String userName;

  @JsonProperty(DtoJsonConstants.POSITIVE_VOTES)
  private int positiveVotes;
  @JsonProperty(DtoJsonConstants.TOTAL_VOTES)
  private int totalVotes;

  @JsonProperty(DtoJsonConstants.TITLE)
  private String title;
  @JsonProperty(DtoJsonConstants.REVIEW)
  private String review;

  @JsonProperty(DtoJsonConstants.STAR_RATING)
  private Double starRating;
  @JsonProperty(DtoJsonConstants.REVIEW_DATE)
  private Date reviewDate;


  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Long getStoreVariantId() {
    return storeVariantId;
  }

  public void setStoreVariantId(Long storeVariantId) {
    this.storeVariantId = storeVariantId;
  }

  public String getStoreVariantUrlFragment() {
    return storeVariantUrlFragment;
  }

  public String getUrl(){
    return LinkManager.getVariantLandingPageUrl(storeVariantNavKey, storeVariantUrlFragment);
  }
  public void setStoreVariantUrlFragment(String storeVariantUrlFragment) {
    this.storeVariantUrlFragment = storeVariantUrlFragment;
  }

  public String getStoreVariantNavKey() {
    return storeVariantNavKey;
  }

  public void setStoreVariantNavKey(String storeVariantNavKey) {
    this.storeVariantNavKey = storeVariantNavKey;
  }

  public String getStoreVariantName() {
    return storeVariantName;
  }

  public void setStoreVariantName(String storeVariantName) {
    this.storeVariantName = storeVariantName;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public int getPositiveVotes() {
    return positiveVotes;
  }

  public void setPositiveVotes(int positiveVotes) {
    this.positiveVotes = positiveVotes;
  }

  public int getTotalVotes() {
    return totalVotes;
  }

  public void setTotalVotes(int totalVotes) {
    this.totalVotes = totalVotes;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getReview() {
    return review;
  }

  public void setReview(String review) {
    this.review = review;
  }

  public Double getStarRating() {
    return starRating;
  }

  public void setStarRating(Double starRating) {
    this.starRating = starRating;
  }

  public Date getReviewDate() {
    return reviewDate;
  }

  public void setReviewDate(Date reviewDate) {
    this.reviewDate = reviewDate;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keyList = new ArrayList<String>(0);
    keyList.add(HKWebJsonConstants.ID);
    keyList.add(HKWebJsonConstants.STORE_VARIANT_ID);
    keyList.add(HKWebJsonConstants.URL_FRAGMENT);
    keyList.add(HKWebJsonConstants.NAV_KEY);
    keyList.add(HKWebJsonConstants.SV_NAME);
    keyList.add(HKWebJsonConstants.USER);
    keyList.add(HKWebJsonConstants.POSITIVE_VOTES);
    keyList.add(HKWebJsonConstants.TOTAL_VOTES);
    keyList.add(HKWebJsonConstants.TITLE);
    keyList.add(HKWebJsonConstants.REVIEW);
    keyList.add(HKWebJsonConstants.STAR_RATING);
    keyList.add(HKWebJsonConstants.REVIEW_DATE);
    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> valueList = new ArrayList<Object>(0);
    valueList.add(this.id);
    valueList.add(this.storeVariantId);
    valueList.add(this.storeVariantUrlFragment);
    valueList.add(this.storeVariantNavKey);
    valueList.add(this.storeVariantName);
    valueList.add(this.userName);
    valueList.add(this.positiveVotes);
    valueList.add(this.totalVotes);
    valueList.add(this.title);
    valueList.add(this.review);
    valueList.add(this.starRating);
    valueList.add(this.reviewDate);
    return valueList;
  }
}
