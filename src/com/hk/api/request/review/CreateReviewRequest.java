package com.hk.api.request.review;

import com.hk.api.request.AbstractUserRequest;
import com.shiro.PrincipalImpl;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Rimal
 */
public class CreateReviewRequest extends AbstractUserRequest {

  private static Logger logger = LoggerFactory.getLogger(CreateReviewRequest.class);

  private Long storeVariantId;

  private String title;
  private String review;

  private Double starRating;

  private String userName;


  public CreateReviewRequest() {
  }

  public boolean validate() {
    boolean valid = super.validate();

    if (StringUtils.isBlank(title)) {
      logger.error("Error validating " + this.getClass().getSimpleName() + " title cannot be blank");
      valid = false;
    }

    if (StringUtils.isBlank(review)) {
      logger.error("Error validating " + this.getClass().getSimpleName() + " review cannot be blank");
      valid = false;
    }
    return valid;
  }


  public Long getStoreVariantId() {
    return storeVariantId;
  }

  public void setStoreVariantId(Long storeVariantId) {
    this.storeVariantId = storeVariantId;
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

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }


  public Map<String, String> getParams() {
    Map<String, String> params = new HashMap<String, String>();
    params.put("storeVariantId", storeVariantId.toString());
    params.put("title", title);
    params.put("review", review);
    params.put("starRating", starRating.toString());
    params.put("storeId", storeId.toString());
    params.put("userId", userId.toString());
    if (SecurityUtils.getSubject() != null) {
      PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
      String userName = principal.getName();
      params.put("userName", userName);
    }


    return params;
  }
}
