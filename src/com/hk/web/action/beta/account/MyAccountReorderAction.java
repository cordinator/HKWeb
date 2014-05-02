package com.hk.web.action.beta.account;

import com.hk.common.constants.user.RoleConstants;
import com.hk.constants.account.MyAccountConstants;
import com.hk.web.action.beta.auth.LoginAction;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.stereotype.Component;
import org.stripesstuff.plugin.security.Secure;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Aug 2, 2013
 * Time: 1:48:34 PM
 */
@Component
@Secure(hasAnyRoles = {RoleConstants.HK_UNVERIFIED, RoleConstants.HK_USER, RoleConstants.HK_DEACTIVATED}, authActionBean = LoginAction.class, disallowRememberMe = true)

public class MyAccountReorderAction extends MyAccountOrderAction {

  private int tabId = MyAccountConstants.REORDERS_TAB;


  public Resolution pre() {
    fetchRecentOrdersForUser();
    return new ForwardResolution("/pages/account/myAccountReorders.jsp");
  }

  public int getTabId() {
    return tabId;
  }

  public void setTabId(int tabId) {
    this.tabId = tabId;
  }
}
