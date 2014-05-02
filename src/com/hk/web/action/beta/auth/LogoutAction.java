package com.hk.web.action.beta.auth;

import com.hk.pact.service.auth.LoginService;
import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.DontValidate;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 4, 2013
 * Time: 4:52:33 PM
 */
@Component
public class LogoutAction extends BaseAction {

  private String redirectUrl;

  @Autowired
  private LoginService loginService;

  @DefaultHandler
  @DontValidate
  public Resolution logout() {
    getLoginService().logout();


    if (!StringUtils.isBlank(redirectUrl)) {
      return new RedirectResolution(redirectUrl, false);
    }

    return new RedirectResolution(LoginAction.class);
  }

  public LoginService getLoginService() {
    return loginService;
  }

  public String getRedirectUrl() {
    return redirectUrl;
  }

  public void setRedirectUrl(String redirectUrl) {
    this.redirectUrl = redirectUrl;
  }
}
