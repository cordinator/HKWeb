package com.hk.impl.service.user;

import com.hk.api.request.user.CreateUserRequest;
import com.hk.api.request.user.forgotPassword.UserResetPasswordRequest;
import com.hk.api.response.user.response.CreateUserApiResponse;
import com.hk.api.response.user.response.UserApiResponse;
import com.hk.api.response.user.response.UserTempResponse;
import com.hk.api.response.user.response.forgotPassword.UserForgotPasswordApiResponse;
import com.hk.api.response.user.response.forgotPassword.UserResetPasswordApiResponse;
import com.hk.api.response.user.wrapper.UserResponseApiWrapper;
import com.hk.api.response.user.wrapper.UserTempApiResponseWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.EnvConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.user.UserService;
import com.shiro.PrincipalImpl;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Service;

import java.security.InvalidParameterException;


/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Sep 2, 2013
 * Time: 2:05:44 PM
 */
@Service
public class HkrUserServiceImpl implements UserService {

  private static final String NAME = "/name/";
  private static final String ID = "/id/";
  private static final String TEMP_USER = "/isTempUser/";


  @Override
  public CreateUserApiResponse signup(CreateUserRequest createUserRequest) {
    throw new UnsupportedOperationException();
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
  public boolean isTempUser(Long userId) {
    if (userId == null) {
      throw new InvalidParameterException("INVALID USER ID");
    }
    URIBuilder builder = new URIBuilder().fromURI(EnvConstants.HKR_SERVER_URL, ServiceEndPoints.USER + TEMP_USER + userId.toString());
    UserTempApiResponseWrapper userTempApiResponseWrapper = (UserTempApiResponseWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), UserTempApiResponseWrapper.class);
    if (userTempApiResponseWrapper != null) {
      return userTempApiResponseWrapper.getUserTempResponse().isTempUser();
    }
    return false;
  }

  @Override
  public UserApiResponse getUserResponseById(Long userId) {
    if (userId == null) {
      throw new InvalidParameterException("INVALID USER ID");
    }
    URIBuilder builder = new URIBuilder().fromURI(EnvConstants.HKR_SERVER_URL, ServiceEndPoints.USER + ID + userId.toString());
    UserResponseApiWrapper userResponseApiWrapper = (UserResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), UserResponseApiWrapper.class);
    if (userResponseApiWrapper != null) {
      return userResponseApiWrapper.getUserResponse();
    }
    return null;
  }

  @Override
  public UserApiResponse getUserResponseByLogin(String loginName) {
    if (loginName == null) {
      throw new InvalidParameterException("INVALID Login");
    }
    URIBuilder builder = new URIBuilder().fromURI(EnvConstants.HKR_SERVER_URL, ServiceEndPoints.USER + NAME + loginName);
    UserResponseApiWrapper userResponseApiWrapper = (UserResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), UserResponseApiWrapper.class);
    if (userResponseApiWrapper != null) {
      return userResponseApiWrapper.getUserResponse();
    }
    return null;
  }

  @Override
  public UserForgotPasswordApiResponse forgotPassword(String email) {
    throw new UnsupportedOperationException();
  }

  @Override
  public UserResetPasswordApiResponse resetPassword(UserResetPasswordRequest userResetPasswordRequest) {
    throw new UnsupportedOperationException();
  }

  @Override
  public boolean sendForgotPasswordEmail(UserApiResponse userApiResponse, String token) {
    throw new UnsupportedOperationException();
  }

  @Override
  public boolean isUserExist(String login) {
    throw new UnsupportedOperationException();
  }

  private PrincipalImpl getPrincipal() {
    return (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
  }
}
