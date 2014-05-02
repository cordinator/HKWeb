package com.hk.api.response.reward.wrapper;


import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.reward.response.RewardPointBaseApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

public class RewardPointBaseWrapperApiResponse extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private RewardPointBaseApiResponse rewardPointBaseApiResponse;

  public RewardPointBaseApiResponse getRewardPointBaseApiResponse() {
    return rewardPointBaseApiResponse;
  }

  public void setRewardPointBaseApiResponse(RewardPointBaseApiResponse rewardPointBaseApiResponse) {
    this.rewardPointBaseApiResponse = rewardPointBaseApiResponse;
  }
}
