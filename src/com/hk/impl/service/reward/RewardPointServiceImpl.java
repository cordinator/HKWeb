package com.hk.impl.service.reward;

import com.hk.api.response.reward.response.RewardPointApiResponse;
import com.hk.api.response.reward.response.RewardPointBaseApiResponse;
import com.hk.api.response.reward.wrapper.RewardPointBaseWrapperApiResponse;
import com.hk.api.response.reward.wrapper.RewardPointWrapperApiResponse;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.RequestConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.reward.RewardPointService;
import com.hk.pact.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.awt.dnd.InvalidDnDOperationException;

@Service
public class RewardPointServiceImpl implements RewardPointService {

  private static final String REWARD_POINTS = "points";
  private static final String RESULTS = "results";

  @Autowired
  private UserService userService;


  @Override
  public RewardPointBaseApiResponse getRewardPoints() {
    Long userId = getUserService().getLoggedInUserId();
    if(userId == null){
      throw new InvalidDnDOperationException("NO_LOGGED_IN_USER");
    }
    Long storeId = StoreConstants.DEFAULT_STORE_ID;
    URIBuilder uriBuilder = new URIBuilder().fromURI(ServiceEndPoints.REWARD + storeId.toString() +
        URIBuilder.URL_TOKEN_SEP + userId.toString() + URIBuilder.URL_TOKEN_SEP + REWARD_POINTS);
    RewardPointBaseWrapperApiResponse rewardPointBaseWrapperApiResponse =  (RewardPointBaseWrapperApiResponse)HkHttpClient.executeGet(uriBuilder.getWebServiceUrl(), RewardPointBaseWrapperApiResponse.class);
    if(rewardPointBaseWrapperApiResponse!=null){
      return rewardPointBaseWrapperApiResponse.getRewardPointBaseApiResponse();
    }
    return null;
  }

  @Override
  public RewardPointApiResponse getRewardPointTxnHistory(int pageNo, int perPage) {
    Long userId = getUserService().getLoggedInUserId();
    if(userId == null){
      throw new InvalidDnDOperationException("NO_LOGGED_IN_USER");
    }
    Long storeId = StoreConstants.DEFAULT_STORE_ID;
    URIBuilder uriBuilder = new URIBuilder().fromURI(ServiceEndPoints.REWARD + storeId.toString() +
        URIBuilder.URL_TOKEN_SEP + userId.toString() + URIBuilder.URL_TOKEN_SEP + RESULTS).
         queryParameter(RequestConstants.PAGE_NO, Long.valueOf(pageNo).toString()).queryParameter(RequestConstants.PER_PAGE, Long.valueOf(perPage).toString());
    RewardPointWrapperApiResponse rewardPointWrapperApiResponse =  (RewardPointWrapperApiResponse) HkHttpClient.executeGet(uriBuilder.getWebServiceUrl(), RewardPointWrapperApiResponse.class);
    if(rewardPointWrapperApiResponse!=null){
       return rewardPointWrapperApiResponse.getRewardPointApiResponse();
    }
    return null;
  }

  public UserService getUserService() {
    return userService;
  }
}
