package com.hk.web.resource.reward;


import com.hk.api.response.reward.response.RewardPointApiResponse;
import com.hk.api.response.reward.response.RewardPointBaseApiResponse;
import com.hk.common.constants.RequestConstants;
import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.pact.service.reward.RewardPointService;
import com.hk.web.PaginationConstants;
import com.hk.web.response.reward.RewardPointSentResponse;
import com.hk.web.response.reward.RewardPointSentWrapperResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.*;

@Component
@Path("/reward/")
public class RewardPointResource {

  @Autowired
  private RewardPointService rewardPointService;


  @GET
  @Path("/points/")
  @Produces("application/json")
  public RewardPointSentWrapperResponse getTotRewardPoints() {
    RewardPointSentWrapperResponse rewardPointSentWrapperResponse = new RewardPointSentWrapperResponse();
    RewardPointBaseApiResponse rewardPointBaseApiResponse = null;
    try {
      rewardPointBaseApiResponse = getRewardPointService().getRewardPoints();
    } catch (Exception e) {
      rewardPointSentWrapperResponse.setException(true);
      rewardPointSentWrapperResponse.addMessage(HKWebMessageConstants.ERROR);
    }
    if(rewardPointBaseApiResponse == null){
      rewardPointSentWrapperResponse.setException(true);
      rewardPointSentWrapperResponse.addMessage(HKWebMessageConstants.ERROR);
    } else{
      rewardPointSentWrapperResponse.setException(rewardPointBaseApiResponse.isException());
      rewardPointSentWrapperResponse.setMessages(rewardPointBaseApiResponse.getMessages());
      rewardPointSentWrapperResponse.setTotRedeemPoints(rewardPointBaseApiResponse.getTotRedeemPoints());
    }
    return rewardPointSentWrapperResponse;
  }

  @GET
  @Path("/results/")
  @Produces("application/json")
  public RewardPointSentResponse getRewardPointTxnHistory(@QueryParam(RequestConstants.PAGE_NO) @DefaultValue(PaginationConstants.DEFAULT_PAGE_STR) int pageNo, @QueryParam(RequestConstants.PER_PAGE) @DefaultValue(PaginationConstants.DEFAULT_PER_PAGE_CATALOG_STR) int perPage) {
    RewardPointSentResponse rewardPointSentResponse = new RewardPointSentResponse();
    RewardPointApiResponse rewardPointApiResponse = null;
    try {
      rewardPointApiResponse = getRewardPointService().getRewardPointTxnHistory(pageNo, perPage);
    } catch (Exception e) {
      rewardPointSentResponse.setException(true);
      rewardPointSentResponse.addMessage(HKWebMessageConstants.ERROR);
    }
    if(rewardPointApiResponse == null){
      rewardPointSentResponse.setException(true);
      rewardPointSentResponse.addMessage(HKWebMessageConstants.ERROR);
    }else{
      rewardPointSentResponse.setException(rewardPointApiResponse.isException());
      rewardPointSentResponse.setMessages(rewardPointApiResponse.getMessages());
      rewardPointSentResponse.setTotRedeemPoints(rewardPointApiResponse.getTotRedeemPoints());
      rewardPointSentResponse.setRewardPoints(rewardPointApiResponse.getRewardPoints());
    }
    return rewardPointSentResponse;
  }

  public RewardPointService getRewardPointService() {
    return rewardPointService;
  }
}
