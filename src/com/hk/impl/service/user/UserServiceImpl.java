package com.hk.impl.service.user;


import com.hk.api.request.user.CreateUserRequest;
import com.hk.api.request.user.forgotPassword.UserResetPasswordRequest;
import com.hk.api.response.user.response.CreateUserApiResponse;
import com.hk.api.response.user.response.UserApiResponse;
import com.hk.api.response.user.response.forgotPassword.UserForgotPasswordApiResponse;
import com.hk.api.response.user.response.forgotPassword.UserResetPasswordApiResponse;
import com.hk.api.response.user.wrapper.CreateUserResponseApiWrapper;
import com.hk.api.response.user.wrapper.UserExistApiResponseWrapper;
import com.hk.api.response.user.wrapper.UserResponseApiWrapper;
import com.hk.api.response.user.wrapper.forgotPassword.UserForgotPasswordResponseApiWrapper;
import com.hk.api.response.user.wrapper.forgotPassword.UserResetPasswordResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.constants.user.RoleConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.exception.InvalidInputException;
import com.hk.pact.service.email.EmailService;
import com.hk.pact.service.user.UserService;
import com.hk.util.HKEmailUtils;
import com.hk.web.manager.LinkManager;
import com.shiro.PrincipalImpl;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;

import java.security.InvalidParameterException;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 29, 2013
 * Time: 12:31:27 AM
 */

public class UserServiceImpl implements UserService {

  private static final String NAME = "/name/";
  private static final String ID = "/id/";
  private static final String SIGNUP = "/signup/";
  private static final String FORGOT_PASSWORD = "/forgotPassword/";
  private static final String RESET_PASSWORD = "/resetPassword/";
  private static final String USER_EXIST = "userExist";


  @Autowired
  private LinkManager linkManager;
  @Autowired
  private EmailService emailService;

  @Override
  public CreateUserApiResponse signup(CreateUserRequest createUserRequest) {
    createUserRequest.setStoreId(StoreConstants.DEFAULT_STORE_ID);

    if (!createUserRequest.validate()) {
      throw new InvalidInputException(HKWebMessageConstants.SIGNUP_REQ_INVALID);
    }

    if (!HKEmailUtils.isValidEmail(createUserRequest.getEmail())) {
      throw new InvalidInputException(HKWebMessageConstants.INVALID_EMAIL);
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER + SIGNUP);
    CreateUserResponseApiWrapper createUserResponseWrapper = (CreateUserResponseApiWrapper) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), createUserRequest.getParameters(), CreateUserResponseApiWrapper.class);

    if (createUserResponseWrapper != null) {
      return createUserResponseWrapper.getCreateUserResponse();
    }

    return null;
  }


  @Override
  public Long getLoggedInUserId() {
    try {
      if (getPrincipal() != null) {
        return getPrincipal().getId();
      }
    } catch (Throwable t) {
      t.printStackTrace(); //TODO:logger
    }
    return null;
  }

  @Override
  public UserApiResponse getUserResponseByLogin(String loginName) {
    if (StringUtils.isBlank(loginName)) {
      throw new InvalidParameterException("LOGIN_CANNOT_BE_BLANK");
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER + NAME + StoreConstants.DEFAULT_STORE_ID.toString() + ServiceEndPoints.URI_SEPARATOR + loginName);

    UserResponseApiWrapper userResponseWrapper = (UserResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), UserResponseApiWrapper.class);
    if (userResponseWrapper != null && userResponseWrapper.getUserResponse() != null) {
      return userResponseWrapper.getUserResponse();
    }
    return null;
  }

  @Override
  public UserApiResponse getUserResponseById(Long userId) {
    if (userId == null) {
      throw new InvalidParameterException("USER_ID_CANNOT_BE_BLANK");
    }
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER + ID + userId);

    UserResponseApiWrapper userResponseWrapper = (UserResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), UserResponseApiWrapper.class);
    if (userResponseWrapper != null && userResponseWrapper.getUserResponse() != null) {
      return userResponseWrapper.getUserResponse();
    }
    return null;
  }

  @Override
  public boolean isTempUser(Long userId) {
    UserApiResponse userResponse = getUserResponseById(userId);

    if (userResponse == null) {
      throw new InvalidParameterException("USER_ID_DOES_NOT_EXIST");
    }

    return userResponse.getRoles().contains(RoleConstants.TEMP_USER);
  }

  public UserForgotPasswordApiResponse forgotPassword(String email) {
    if (StringUtils.isBlank(email)) {
      throw new InvalidParameterException("EMAIL_CANNOT_BE_BLANK");
    }

    if (!HKEmailUtils.isValidEmail(email)) {
      throw new InvalidInputException(HKWebMessageConstants.INVALID_EMAIL);
    }
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER + FORGOT_PASSWORD +
        StoreConstants.DEFAULT_STORE_ID_STR + ServiceEndPoints.URI_SEPARATOR + email);

    UserForgotPasswordResponseApiWrapper forgotPasswordResponseApiWrapper = (UserForgotPasswordResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), UserForgotPasswordResponseApiWrapper.class);
    if (forgotPasswordResponseApiWrapper != null && forgotPasswordResponseApiWrapper.getUserForgotPasswordApiResponse() != null) {
      return forgotPasswordResponseApiWrapper.getUserForgotPasswordApiResponse();
    }
    return null;
  }

  public UserResetPasswordApiResponse resetPassword(UserResetPasswordRequest userResetPasswordRequest) {
    userResetPasswordRequest.setStoreId(StoreConstants.DEFAULT_STORE_ID);

    if (!userResetPasswordRequest.validate()) {
      throw new InvalidInputException(HKWebMessageConstants.RESET_PASSWORD_REQ_INVALID);
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER + RESET_PASSWORD);

    UserResetPasswordResponseApiWrapper resetPasswordResponseApiWrapper = (UserResetPasswordResponseApiWrapper) HkHttpClient.executePostForObject(
        builder.getWebServiceUrl(), userResetPasswordRequest.getParams(), UserResetPasswordResponseApiWrapper.class);

    UserResetPasswordApiResponse resetPasswordApiResponse = null;
    if (resetPasswordResponseApiWrapper != null) {
      resetPasswordApiResponse = resetPasswordResponseApiWrapper.getUserResetPasswordApiRepsonse();
    }

    return resetPasswordApiResponse;
  }

  @Override
  public boolean sendForgotPasswordEmail(UserApiResponse userApiResponse, String token) {
    String activationToken = HKEmailUtils.createActivationLink(null, token);
    String activationLink = getLinkManager().getForgotPasswordLink(activationToken);
    return getEmailService().sendForgotPasswordEmail(userApiResponse, activationLink);
  }

  @Override
  public boolean isUserExist(String login) {
    if (login == null) {
      throw new InvalidParameterException("LOGIN_CAN_NOT_BE_NULL");
    }
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER + ServiceEndPoints.URI_SEPARATOR + StoreConstants.DEFAULT_STORE_ID_STR + ServiceEndPoints.URI_SEPARATOR + USER_EXIST + ServiceEndPoints.URI_SEPARATOR + login);
    UserExistApiResponseWrapper userExistApiResponseWrapper = (UserExistApiResponseWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), UserExistApiResponseWrapper.class);
    if (userExistApiResponseWrapper != null && userExistApiResponseWrapper.getUserExistApiResponse() != null) {
      return userExistApiResponseWrapper.getUserExistApiResponse().isUserExist();
    }
    return false;
  }

  private PrincipalImpl getPrincipal() {
    return (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
  }

  public LinkManager getLinkManager() {
    return linkManager;
  }

  public EmailService getEmailService() {
    return emailService;
  }
}