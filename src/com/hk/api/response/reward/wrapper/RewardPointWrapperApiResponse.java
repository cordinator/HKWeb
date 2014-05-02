package com.hk.api.response.reward.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.reward.response.RewardPointApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;


public class RewardPointWrapperApiResponse extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private RewardPointApiResponse rewardPointApiResponse;

  public RewardPointApiResponse getRewardPointApiResponse() {
    return rewardPointApiResponse;
  }

  public void setRewardPointApiResponse(RewardPointApiResponse rewardPointApiResponse) {
    this.rewardPointApiResponse = rewardPointApiResponse;
  }
}
