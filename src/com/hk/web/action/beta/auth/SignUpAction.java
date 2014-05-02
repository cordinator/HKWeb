package com.hk.web.action.beta.auth;

import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.pact.service.email.EmailService;
import com.hk.pact.service.user.UserService;
import com.hk.pact.service.auth.LoginService;
import com.hk.pact.service.user.UserActivationService;
import com.hk.web.action.beta.BaseAction;
import com.hk.api.request.user.CreateUserRequest;
import com.hk.api.response.user.response.CreateUserApiResponse;
import com.hk.web.action.beta.home.HomeAction;
import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.validation.SimpleError;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by IntelliJ IDEA. User: Vaibhav Date: May 31, 2013 Time: 5:41:10 PM
 */
@Component
public class SignUpAction extends BaseAction {


  private String email;
  private String name;
  private String password;

  private Long userId;
  private String token;

  private String redirectUrl;

  @Autowired
  private UserService userService;
  @Autowired
  private LoginService loginService;
  @Autowired
  private UserActivationService userActivationService;
  @Autowired
  private EmailService emailService;


  @DefaultHandler
  @DontValidate
  public Resolution pre() {
    return new ForwardResolution("/pages/auth/signup.jsp");
  }

  public Resolution signup() {
    if(name == null || email == null || password == null){
      addRedirectAlertMessage(new SimpleError(HKWebMessageConstants.EMPTY_CHECK));
      return new RedirectResolution(SignUpAction.class);
    }
    CreateUserRequest createUserRequest = new CreateUserRequest();
    createUserRequest.setEmail(email);
    createUserRequest.setName(name);
    createUserRequest.setPassword(password);
    CreateUserApiResponse createUserResponse = getUserService().signup(createUserRequest);

    if (createUserResponse != null) {
      if (!createUserResponse.isException()) {

        getLoginService().login(createUserResponse.getUserResponse().getLogin(), createUserRequest.getPassword(), true);

        if (!createUserResponse.isActivated()) {
          // TODO # Use login instead of userId or we can send only token
          String activateLink = getUserActivationService().createActivationLink(createUserResponse.getActivationTokenResponse().getToken(),createUserResponse.getUserResponse().getId());
          getEmailService().sendWelcomeEmail(createUserResponse.getUserResponse(),activateLink);
        }

        if (!StringUtils.isBlank(redirectUrl)) {
          return new RedirectResolution(redirectUrl, false);
        }
      } else {
        addRedirectAlertMessage(new SimpleError(createUserResponse.getMessages().get(0)));
        return new RedirectResolution(SignUpAction.class);
      }
    }
    return new RedirectResolution(HomeAction.class);
  }


  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public EmailService getEmailService() {
    return emailService;
  }

  public Long getUserId() {
    return userId;
  }

  public void setUserId(Long userId) {
    this.userId = userId;
  }

  public String getToken() {
    return token;
  }

  public void setToken(String token) {
    this.token = token;
  }

  public String getRedirectUrl() {
    return redirectUrl;
  }

  public void setRedirectUrl(String redirectUrl) {
    this.redirectUrl = redirectUrl;
  }

  public UserService getUserService() {
    return userService;
  }

  public LoginService getLoginService() {
    return loginService;
  }

  public UserActivationService getUserActivationService() {
    return userActivationService;
  }

}