package com.hk.api.request.review;

import com.hk.api.request.AbstractUserRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Rimal
 */
public class RateVariantRequest extends AbstractUserRequest {

  private static Logger logger = LoggerFactory.getLogger(RateVariantRequest.class);

  private Long storeVariantId;
  private Double starRating;

  public RateVariantRequest() {
  }

  public boolean validate() {
    boolean valid = super.validate();

    if (storeVariantId == null) {
      logger.error("Error validating " + this.getClass().getSimpleName() + " storeVariantId cannot be null");
      valid = false;
    }

    if (starRating == null) {
      logger.error("Error validating " + this.getClass().getSimpleName() + " starRating cannot be blank");
      valid = false;
    }

    if (starRating > 5 || starRating < 1) {
      logger.error("Error validating " + this.getClass().getSimpleName() + " invalid value for starRating");
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

  public Double getStarRating() {
    return starRating;
  }

  public void setStarRating(Double starRating) {
    this.starRating = starRating;
  }

  public Map<String, String> getParams() {
    Map<String, String> params = new HashMap<String, String>();
    params.put("storeVariantId", storeVariantId.toString());
    params.put("starRating", starRating.toString());
    params.put("storeId", storeId.toString());
    params.put("userId", userId.toString());

    return params;
  }
}
