package com.hk.impl.service.auth;

import com.hk.api.response.user.response.UserApiResponse;
import com.hk.api.response.user.wrapper.UserResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.RequestConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.exception.LoginException;
import com.hk.pact.service.auth.LoginService;
import com.hk.pact.service.user.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.mgt.SecurityManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.security.InvalidParameterException;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 24, 2013
 * Time: 6:37:21 PM
 */

public class LoginServiceImpl implements LoginService {

  private static final String GUEST = "/guest/";
  private static final String LOGIN = "/login/";

  private static Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);

  @Autowired
  private SecurityManager securityManager;
  @Autowired
  private UserService userService;

  @Override
  public boolean login(String email, String password, boolean rememberMe) throws LoginException {

    Long loggedInUserId = getUserService().getLoggedInUserId();
    Long tempUserId = null;
    if (loggedInUserId != null && getUserService().isTempUser(loggedInUserId)) {
      tempUserId = loggedInUserId;
    }

    UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(email, password);
    usernamePasswordToken.setRememberMe(rememberMe);

    try {
      SecurityUtils.getSubject().login(usernamePasswordToken);
      //getSecurityManager().login(null, usernamePasswordToken);
    } catch (AuthenticationException e) {
      logger.error("Unable to login", e);
      // Note: if the login fails, existing subject is still retained
      throw new LoginException("Unable to login", e);
    }

    loggedInUserId = getUserService().getLoggedInUserId();
    onLoginUser(loggedInUserId, tempUserId);
    return true;
  }


  private void onLoginUser(Long loggedInUserId, Long tempUserId) {
    if (loggedInUserId == null) {
      throw new InvalidParameterException("USER_ID_CANNOT_BE_BLANK");
    }
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER + LOGIN + loggedInUserId);
    if (tempUserId != null) {
      builder.queryParameter(RequestConstants.TEMP_ID, tempUserId.toString());
    }

    HkHttpClient.executeGet(builder.getWebServiceUrl());
  }


  @Override
  public void createAndLoginAsGuestUser() {
    UserApiResponse userResponse = createGuestUser();
    //TODO: handle null
    login(userResponse.getLogin(), userResponse.getLogin(), true);

  }

  @Override
  public void logout() {
    SecurityUtils.getSubject().logout();
  }

  private UserApiResponse createGuestUser() {

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER + GUEST + StoreConstants.DEFAULT_STORE_ID.toString());

    UserResponseApiWrapper userResponseWrapper = (UserResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), UserResponseApiWrapper.class);
    if (userResponseWrapper != null && userResponseWrapper.getUserResponse() != null) {
      return userResponseWrapper.getUserResponse();
    }
    return null;
  }

  public SecurityManager getSecurityManager() {
    return securityManager;
  }

  public UserService getUserService() {
    return userService;
  }
}
