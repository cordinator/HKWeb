package com.hk.web.response.reward;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.response.GenericResponse;

import java.util.List;


public class RewardPointSentWrapperResponse extends GenericResponse {

  private Double totRedeemPoints;

  public Double getTotRedeemPoints() {
    return totRedeemPoints;
  }

  public void setTotRedeemPoints(Double totRedeemPoints) {
    this.totRedeemPoints = totRedeemPoints;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(DtoJsonConstants.TOT_REDEEM_POINTS);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.totRedeemPoints);
    return values;
  }
}
