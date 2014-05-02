package com.hk.web.action.beta.auth;

import com.hk.api.response.user.response.activation.ActivateUserApiResponse;
import com.hk.pact.service.user.UserActivationService;
import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created with IntelliJ IDEA.
 * User: Shrey
 * Date: 6/13/13
 * Time: 5:17 PM
 * To change this template use File | Settings | File Templates.
 */

@Component
public class ActivateUserAction extends BaseAction {

  @Autowired
  private UserActivationService userActivationService;

  private String actLnk;

  @DefaultHandler
  @DontValidate
  public Resolution activateUser() {
    ActivateUserApiResponse activateUserResponse = getUserActivationService().activateUser(actLnk);
    if(activateUserResponse!=null){
      addRedirectAlertMessage(new SimpleMessage("You Account Activated Successfully!!"));
    } else{
      addRedirectAlertMessage(new SimpleMessage("Your Account is already activated or activation link is expired or damaged"));
    }
    return new ForwardResolution("/pages/auth/login.jsp");
  }

  public UserActivationService getUserActivationService() {
    return userActivationService;
  }

  public String getActLnk() {
    return actLnk;
  }

  public void setActLnk(String actLnk) {
    this.actLnk = actLnk;
  }
}
