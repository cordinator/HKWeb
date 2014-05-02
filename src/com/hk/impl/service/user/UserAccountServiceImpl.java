package com.hk.impl.service.user;

import com.hk.api.request.user.UpdateUserAddressRequest;
import com.hk.api.response.location.address.response.account.UpdateUserAddressDetailApiResponse;
import com.hk.api.response.location.address.wrapper.account.UpdateUserAddressDetailResponseApiWrapper;
import com.hk.api.response.user.response.UserApiResponse;
import com.hk.api.response.user.response.account.UserAccountUpdateApiResponse;
import com.hk.api.response.user.response.account.UserEmailUpdateApiResponse;
import com.hk.api.response.user.wrapper.account.UserAccountUpdateResponseApiWrapper;
import com.hk.api.response.user.wrapper.account.UserEmailUpdateResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.exception.InvalidInputException;
import com.hk.pact.service.user.UserAccountService;
import com.hk.pact.service.user.UserService;
import com.hk.util.HKEmailUtils;
import com.hk.web.request.user.account.UpdateUserBasicInfoRequest;
import com.hk.web.request.user.account.UpdateUserEmailRequest;
import com.hk.web.request.user.account.UpdateUserPasswordRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Rimal
 */
@Service
public class UserAccountServiceImpl implements UserAccountService {

  private static final String BASIC_INFO_UPDATE = "/basic/update/";
  private static final String EMAIL_UPDATE = "/email/update/";
  private static final String PASSWORD_UPDATE = "/password/update/";
  private static final String ADDRESS_UPDATE = "/address/update/";
//  private static final String ADDRESS_DELETE = "/address/delete/";

  @Autowired
  private UserService userService;


  @Override
  public UserApiResponse getUserAccountDetails() {
    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId == null) {
      throw new UnsupportedOperationException(HKWebMessageConstants.NO_LOGGED_IN_USER);
    }
    return getUserService().getUserResponseById(loggedInUserId);
  }

  @Override
  public UserAccountUpdateApiResponse updateBasicAccountInfoForUser(UpdateUserBasicInfoRequest updateUserBasicInfoRequest) {
    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId == null) {
      throw new UnsupportedOperationException(HKWebMessageConstants.NO_LOGGED_IN_USER);
    }

    updateUserBasicInfoRequest.setUserId(loggedInUserId);

    if (!updateUserBasicInfoRequest.validate()) {
      throw new InvalidInputException(HKWebMessageConstants.INVALID_UPDATE_BASIC_INFO_REQ);
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER_ACCOUNT + BASIC_INFO_UPDATE);

    UserAccountUpdateResponseApiWrapper userAccountUpdateResponseWrapper = (UserAccountUpdateResponseApiWrapper) HkHttpClient.executePostForObject(
        builder.getWebServiceUrl(), updateUserBasicInfoRequest.getParameters(), UserAccountUpdateResponseApiWrapper.class);

    UserAccountUpdateApiResponse userAccountUpdateResponse = null;
    if (userAccountUpdateResponseWrapper != null) {
      userAccountUpdateResponse = userAccountUpdateResponseWrapper.getUserAccountUpdateResponse();
    }

    return userAccountUpdateResponse;
  }

  @Override
  public UserEmailUpdateApiResponse updateEmailForUser(UpdateUserEmailRequest updateUserEmailRequest) {
    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId == null) {
      throw new UnsupportedOperationException(HKWebMessageConstants.NO_LOGGED_IN_USER);
    }

    updateUserEmailRequest.setUserId(loggedInUserId);

    if (!updateUserEmailRequest.validate()) {
      throw new InvalidInputException(HKWebMessageConstants.INVALID_UPDATE_EMAIL_REQ);
    }
    if (!HKEmailUtils.isValidEmail(updateUserEmailRequest.getNewEmail())) {
      throw new InvalidInputException(HKWebMessageConstants.INVALID_EMAIL);
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER_ACCOUNT + EMAIL_UPDATE);

    UserEmailUpdateResponseApiWrapper emailUpdateResponseApiWrapper = (UserEmailUpdateResponseApiWrapper) HkHttpClient.executePostForObject(
        builder.getWebServiceUrl(), updateUserEmailRequest.getParameters(), UserEmailUpdateResponseApiWrapper.class);

    UserEmailUpdateApiResponse userEmailUpdateApiResponse = null;
    if (emailUpdateResponseApiWrapper != null) {
      userEmailUpdateApiResponse = emailUpdateResponseApiWrapper.getUserEmailUpdateApiResponse();
    }

    return userEmailUpdateApiResponse;
  }

  @Override
  public UserAccountUpdateApiResponse updatePasswordForUser(UpdateUserPasswordRequest updateUserPasswordRequest) {
    Long loggedInUserId = getUserService().getLoggedInUserId();
    updateUserPasswordRequest.setUserId(loggedInUserId);

    if (!updateUserPasswordRequest.validate()) {
      throw new InvalidInputException(HKWebMessageConstants.INVALID_UPDATE_PASSWORD_REQ);
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER_ACCOUNT + PASSWORD_UPDATE);

    UserAccountUpdateResponseApiWrapper userAccountUpdateResponseWrapper = (UserAccountUpdateResponseApiWrapper) HkHttpClient.executePostForObject(
        builder.getWebServiceUrl(), updateUserPasswordRequest.getParameters(), UserAccountUpdateResponseApiWrapper.class);

    UserAccountUpdateApiResponse userAccountUpdateResponse = null;
    if (userAccountUpdateResponseWrapper != null) {
      userAccountUpdateResponse = userAccountUpdateResponseWrapper.getUserAccountUpdateResponse();
    }

    return userAccountUpdateResponse;
  }

  @Override
  public UpdateUserAddressDetailApiResponse updateUserAddress(UpdateUserAddressRequest updateUserAddressRequest) {
    Long loggedInUserId = getUserService().getLoggedInUserId();
    updateUserAddressRequest.setUserId(loggedInUserId);

    if (!updateUserAddressRequest.validate()) {
      throw new InvalidInputException(HKWebMessageConstants.INVALID_UPDATE_BASIC_INFO_REQ);
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER_ACCOUNT + ADDRESS_UPDATE);

    UpdateUserAddressDetailResponseApiWrapper addressDetailResponseApiWrapper = (UpdateUserAddressDetailResponseApiWrapper) HkHttpClient.executePostForObject(
        builder.getWebServiceUrl(), updateUserAddressRequest.getParams(), UpdateUserAddressDetailResponseApiWrapper.class);

    UpdateUserAddressDetailApiResponse updateUserAddressDetailApiResponse = null;
    if (addressDetailResponseApiWrapper != null) {
      updateUserAddressDetailApiResponse = addressDetailResponseApiWrapper.getUpdateUserAddressDetailApiResponse();
    }

    return updateUserAddressDetailApiResponse;
  }

  /*public UserAccountApiResponse deleteUserAddress(Long addressId) {
    Long loggedInUserId = getUserService().getLoggedInUserId();

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER_ACCOUNT + ADDRESS_DELETE +
        StoreConstants.DEFAULT_STORE_ID_STR + URIBuilder.URL_TOKEN_SEP + loggedInUserId + URIBuilder.URL_TOKEN_SEP + addressId);

    UserAccountResponseApiWrapper userAccountResponseWrapper = (UserAccountResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), UserAccountResponseApiWrapper.class);

    UserAccountApiResponse userAccountResponse = null;
    if (userAccountResponseWrapper != null) {
      userAccountResponse = userAccountResponseWrapper.getUserAccountResponse();
    }

    return userAccountResponse;
  }*/


  public UserService getUserService() {
    return userService;
  }
}