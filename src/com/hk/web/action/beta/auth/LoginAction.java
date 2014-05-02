package com.hk.web.action.beta.auth;

import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.exception.LoginException;
import com.hk.pact.service.auth.LoginService;
import com.hk.web.action.beta.BaseAction;
import com.hk.web.action.beta.home.HomeAction;
import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.validation.SimpleError;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 22, 2013
 * Time: 2:45:14 PM
 */
@Component
public class LoginAction extends BaseAction {


  private String email;
  private String password;

  private String redirectUrl;
  private boolean rememberMe;
  /*private String source;

  public static final String SOURCE_CHECKOUT = "checkout";*/

  @Autowired
  private LoginService loginService;

  @DefaultHandler
  @DontValidate
  public Resolution pre() {
    return new ForwardResolution("/pages/auth/login.jsp");
  }


  public Resolution login() {

    if (validate()) {
      boolean loginSuccess;
      String errMsg = HKWebMessageConstants.INVALID_EMAIL_PASSWORD;

      try {
        loginSuccess = getLoginService().login(email, password, true);
      } catch (LoginException e) {
        loginSuccess = false;
        //errMsg = HKWebMessageConstants.ERROR;
      }
      if (loginSuccess) {
        if (!StringUtils.isBlank(redirectUrl)) {
          return new RedirectResolution(redirectUrl, false);
        }
        return new RedirectResolution(HomeAction.class);
      } else {
        addRedirectAlertMessage(new SimpleError(errMsg));
        return new ForwardResolution("/pages/auth/login.jsp");
      }
    } else {
      addRedirectAlertMessage(new SimpleError(HKWebMessageConstants.INVALID_EMAIL_PASSWORD));
      return new ForwardResolution("/pages/auth/login.jsp");
    }


  }


  private boolean validate() {
    boolean valid = true;
    if (StringUtils.isBlank(password)) {
      valid = false;
      addRedirectAlertMessage(new SimpleError(HKWebMessageConstants.ENTER_PASSWORD));
    }
    if (StringUtils.isBlank(email)) {
      valid = false;
      addRedirectAlertMessage(new SimpleError(HKWebMessageConstants.ENTER_EMAIL));
    }
    return valid;
  }

  public LoginService getLoginService() {
    return loginService;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getRedirectUrl() {
    return redirectUrl;
  }

  public void setRedirectUrl(String redirectUrl) {
    this.redirectUrl = redirectUrl;
  }

  public boolean isRememberMe() {
    return rememberMe;
  }

  public void setRememberMe(boolean rememberMe) {
    this.rememberMe = rememberMe;
  }

  /*public String getSource() {
    return source;
  }

  public void setSource(String source) {
    this.source = source;
  }*/
}
