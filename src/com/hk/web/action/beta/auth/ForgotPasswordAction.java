package com.hk.web.action.beta.auth;

import com.hk.api.request.user.forgotPassword.UserResetPasswordRequest;
import com.hk.api.response.user.response.TokenValidationApiResponse;
import com.hk.api.response.user.response.forgotPassword.UserForgotPasswordApiResponse;
import com.hk.api.response.user.response.forgotPassword.UserResetPasswordApiResponse;
import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.pact.service.user.TokenService;
import com.hk.pact.service.user.UserService;
import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.SimpleMessage;
import net.sourceforge.stripes.validation.SimpleError;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ForgotPasswordAction extends BaseAction {

  private String email;
  private String actLnk;
  private String token;
  private String password;
  private boolean mailSuccess = false;

  @Autowired
  private UserService userService;
  @Autowired
  private TokenService tokenService;

  @DefaultHandler
  public Resolution pre() {
    return new ForwardResolution("/pages/auth/forgotPassword.jsp");
  }

  public Resolution sendMail() {
    UserForgotPasswordApiResponse userForgotPasswordApiResponse = getUserService().forgotPassword(email);
    if (userForgotPasswordApiResponse == null) {
      addRedirectAlertMessage(new SimpleError(HKWebMessageConstants.ERROR));
    } else if (userForgotPasswordApiResponse.isException()) {
      addRedirectAlertMessage(new SimpleError(userForgotPasswordApiResponse.getMessages().get(0)));
    } else {
      //Sending Email
      if (userForgotPasswordApiResponse.getUserApiResponse() != null) {
        getUserService().sendForgotPasswordEmail(userForgotPasswordApiResponse.getUserApiResponse(), userForgotPasswordApiResponse.getToken());
        //addRedirectAlertMessage(new SimpleMessage(HKWebMessageConstants.FORGOT_PASSWORD_EMAIL));
        mailSuccess = true;
      } else {
        addRedirectAlertMessage(new SimpleError(HKWebMessageConstants.ERROR));
      }
    }
    return new ForwardResolution("/pages/auth/forgotPassword.jsp");
  }

  public Resolution rstPwd() {
    if (actLnk == null) {
      addRedirectAlertMessage(new SimpleError(HKWebMessageConstants.TOKEN_EXPIRED));
      return new ForwardResolution("/pages/auth/forgotPassword.jsp");
    }
    token = actLnk.split("@")[1];
    if (token == null) {
      addRedirectAlertMessage(new SimpleError(HKWebMessageConstants.TOKEN_EXPIRED));
      return new ForwardResolution("/pages/auth/forgotPassword.jsp");
    }
    TokenValidationApiResponse tokenValidationApiResponse = getTokenService().validateToken(token);
    if(tokenValidationApiResponse == null){
        addRedirectAlertMessage(new SimpleError(HKWebMessageConstants.ERROR));
        return new ForwardResolution("/pages/auth/forgotPassword.jsp");
    } else if(!tokenValidationApiResponse.isValid()){
       addRedirectAlertMessage(new SimpleError(tokenValidationApiResponse.getMessages().get(0)));
       return new ForwardResolution("/pages/auth/forgotPassword.jsp");
    }
    return new ForwardResolution("/pages/auth/resetPassword.jsp");
  }

  public Resolution resetPassword() {
    UserResetPasswordRequest userResetPasswordRequest = new UserResetPasswordRequest();
    userResetPasswordRequest.setToken(token);
    userResetPasswordRequest.setNewPassword(password);
    UserResetPasswordApiResponse userResetPasswordApiResponse = getUserService().resetPassword(userResetPasswordRequest);
    if (userResetPasswordApiResponse == null) {
      addRedirectAlertMessage(new SimpleError(HKWebMessageConstants.ERROR));
    } else if (userResetPasswordApiResponse.isException()) {
      addRedirectAlertMessage(new SimpleError(userResetPasswordApiResponse.getMessages().get(0)));
    } else {
      addRedirectAlertMessage(new SimpleMessage(userResetPasswordApiResponse.getMessages().get(0)));
      return new ForwardResolution("/pages/auth/login.jsp");
    }
    return new ForwardResolution("/pages/auth/forgotPassword.jsp");
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public UserService getUserService() {
    return userService;
  }

  public String getActLnk() {
    return actLnk;
  }

  public void setActLnk(String actLnk) {
    this.actLnk = actLnk;
  }

  public String getToken() {
    return token;
  }

  public void setToken(String token) {
    this.token = token;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public boolean isMailSuccess() {
    return mailSuccess;
  }

  public void setMailSuccess(boolean mailSuccess) {
    this.mailSuccess = mailSuccess;
  }

    public TokenService getTokenService() {
        return tokenService;
    }
}
