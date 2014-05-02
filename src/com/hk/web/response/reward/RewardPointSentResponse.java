package com.hk.web.response.reward;


import com.hk.web.response.reward.RewardPointSentWrapperResponse;
import com.hk.api.response.reward.RewardPointDTO;
import com.hk.common.constants.DtoJsonConstants;

import java.util.List;
import java.util.ArrayList;

public class RewardPointSentResponse  extends RewardPointSentWrapperResponse{

  private List<RewardPointDTO> rewardPoints = new ArrayList<RewardPointDTO>();

  public List<RewardPointDTO> getRewardPoints() {
    return rewardPoints;
  }

  public void setRewardPoints(List<RewardPointDTO> rewardPoints) {
    this.rewardPoints = rewardPoints;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys =  super.getKeys();
    keys.add(DtoJsonConstants.REWARD_POINTS);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.rewardPoints);
    return values;
  }
}
