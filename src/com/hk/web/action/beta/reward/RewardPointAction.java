package com.hk.web.action.beta.reward;

import com.hk.api.response.reward.RewardPointDTO;
import com.hk.api.response.reward.response.RewardPointApiResponse;
import com.hk.common.constants.user.RoleConstants;
import com.hk.constants.account.MyAccountConstants;
import com.hk.pact.service.reward.RewardPointService;
import com.hk.web.Page;
import com.hk.web.action.beta.BaseAction;
import com.hk.web.action.beta.auth.LoginAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.stripesstuff.plugin.security.Secure;

import java.util.ArrayList;
import java.util.List;

@Secure(hasAnyRoles = {RoleConstants.HK_UNVERIFIED, RoleConstants.HK_USER, RoleConstants.HK_DEACTIVATED}, authActionBean = LoginAction.class, disallowRememberMe = true)
@Component
public class RewardPointAction extends BaseAction {

    private List<RewardPointDTO> rewardPointsList = new ArrayList<RewardPointDTO>();
    private Double rewardPoints;
    private boolean apiResponse = true;
    private int tabId = MyAccountConstants.REWARD_POINTS_TAB;

    int pageNo = 1;
    int perPage = Page.DEFAULT_PAGE_SIZE;

    @Autowired
    private RewardPointService rewardPointService;

    @DefaultHandler
    public Resolution pre() {
        RewardPointApiResponse rewardPointApiResponse = getRewardPointService().getRewardPointTxnHistory(pageNo, perPage);
        if (rewardPointApiResponse == null) {
            apiResponse = false;
        } else {
            if (rewardPointApiResponse.isException()) {
                apiResponse = false;
            } else {
                rewardPointsList = rewardPointApiResponse.getRewardPoints();
                rewardPoints = rewardPointApiResponse.getTotRedeemPoints();
            }
        }
        return new ForwardResolution("/pages/account/myAccountRewardPoints.jsp");
    }

    public List<RewardPointDTO> getRewardPointsList() {
        return rewardPointsList;
    }

    public void setRewardPointsList(List<RewardPointDTO> rewardPointsList) {
        this.rewardPointsList = rewardPointsList;
    }

    public Double getRewardPoints() {
        return rewardPoints;
    }

    public void setRewardPoints(Double rewardPoints) {
        this.rewardPoints = rewardPoints;
    }

    public boolean isApiResponse() {
        return apiResponse;
    }

    public void setApiResponse(boolean apiResponse) {
        this.apiResponse = apiResponse;
    }

    public RewardPointService getRewardPointService() {
        return rewardPointService;
    }

    public int getTabId() {
        return tabId;
    }

    public void setTabId(int tabId) {
        this.tabId = tabId;
    }
  public int getPageNo() {
    return pageNo;
  }

  public void setPageNo(int pageNo) {
    this.pageNo = pageNo;
  }

  public int getPerPage() {
    return perPage;
  }

  public void setPerPage(int perPage) {
    this.perPage = perPage;
  }
}
