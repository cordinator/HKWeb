package com.hk.api.response.reward.response;


import com.hk.api.response.reward.RewardPointDTO;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

public class RewardPointApiResponse extends RewardPointBaseApiResponse {

  @JsonProperty(DtoJsonConstants.REWARD_POINTS_HISTORY)
  private List<RewardPointDTO> rewardPoints = new ArrayList<RewardPointDTO>();

  public List<RewardPointDTO> getRewardPoints() {
    return rewardPoints;
  }

  public void setRewardPoints(List<RewardPointDTO> rewardPoints) {
    this.rewardPoints = rewardPoints;
  }
}
