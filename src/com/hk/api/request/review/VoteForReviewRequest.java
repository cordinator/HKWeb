package com.hk.api.request.review;

import com.hk.api.request.AbstractUserRequest;
import com.shiro.PrincipalImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.shiro.SecurityUtils;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Rimal
 */
public class VoteForReviewRequest extends AbstractUserRequest {

  private static Logger logger = LoggerFactory.getLogger(VoteForReviewRequest.class);

  private Long reviewId;
  private int voteType;

  private String userName;

  public VoteForReviewRequest() {
  }

  public boolean validate() {
    boolean valid = super.validate();

    if (reviewId == null) {
      logger.error("Error validating " + this.getClass().getSimpleName() + " reviewId cannot be null");
      valid = false;
    }

    if (voteType < 1 || voteType > 3) {
      logger.error("Error validating " + this.getClass().getSimpleName() + " invalid valid for vote type");
      valid = false;
    }

    return valid;
  }

  public Long getReviewId() {
    return reviewId;
  }

  public void setReviewId(Long reviewId) {
    this.reviewId = reviewId;
  }

  public int isVoteType() {
    return voteType;
  }

  public void setVoteType(int voteType) {
    this.voteType = voteType;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }


  public Map<String, String> getParams() {
    Map<String, String> params = new HashMap<String, String>();

    params.put("reviewId", reviewId.toString());
    params.put("voteType", Long.valueOf(voteType).toString());
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
