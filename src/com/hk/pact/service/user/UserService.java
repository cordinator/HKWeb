package com.hk.pact.service.user;

import com.hk.api.request.user.CreateUserRequest;
import com.hk.api.request.user.forgotPassword.UserResetPasswordRequest;
import com.hk.api.response.user.response.CreateUserApiResponse;
import com.hk.api.response.user.response.UserApiResponse;
import com.hk.api.response.user.response.forgotPassword.UserForgotPasswordApiResponse;
import com.hk.api.response.user.response.forgotPassword.UserResetPasswordApiResponse;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 23, 2013
 * Time: 4:58:29 AM
 */
public interface UserService {

  public CreateUserApiResponse signup(CreateUserRequest createUserRequest);

  public Long getLoggedInUserId();

  public boolean isTempUser(Long userId);

  public UserApiResponse getUserResponseById(Long userId);

  public UserApiResponse getUserResponseByLogin(String loginName);

  public UserForgotPasswordApiResponse forgotPassword(String email);

  public UserResetPasswordApiResponse resetPassword(UserResetPasswordRequest userResetPasswordRequest);

  public boolean sendForgotPasswordEmail(UserApiResponse userApiResponse, String token);

  public boolean isUserExist(String login);
}