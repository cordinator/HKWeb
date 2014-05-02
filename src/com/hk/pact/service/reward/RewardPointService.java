package com.hk.pact.service.reward;


import com.hk.api.response.reward.response.RewardPointApiResponse;
import com.hk.api.response.reward.response.RewardPointBaseApiResponse;


public interface RewardPointService {

 public RewardPointBaseApiResponse getRewardPoints();

 public RewardPointApiResponse getRewardPointTxnHistory(int pageNo, int perPage);

}
