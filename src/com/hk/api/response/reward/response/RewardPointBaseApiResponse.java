package com.hk.api.response.reward.response;


import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

public class RewardPointBaseApiResponse extends AbstractApiBaseResponse{

  @JsonProperty(DtoJsonConstants.TOT_REDEEM_POINTS)
  private Double totRedeemPoints;

  public Double getTotRedeemPoints() {
    return totRedeemPoints;
  }

  public void setTotRedeemPoints(Double totRedeemPoints) {
    this.totRedeemPoints = totRedeemPoints;
  }
}
