package com.hk.pact.service.user;

import com.hk.web.request.user.account.UpdateUserBasicInfoRequest;
import com.hk.web.request.user.account.UpdateUserEmailRequest;
import com.hk.web.request.user.account.UpdateUserPasswordRequest;
import com.hk.api.response.user.response.account.UserAccountApiResponse;
import com.hk.api.response.user.response.account.UserAccountUpdateApiResponse;
import com.hk.api.response.user.response.account.UserEmailUpdateApiResponse;
import com.hk.api.response.user.response.UserApiResponse;
import com.hk.api.response.location.address.response.account.UpdateUserAddressDetailApiResponse;
import com.hk.api.request.user.UpdateUserAddressRequest;

/**
 * @author Rimal
 */
public interface UserAccountService {

  public UserApiResponse getUserAccountDetails();

  public UserAccountUpdateApiResponse updateBasicAccountInfoForUser(UpdateUserBasicInfoRequest updateUserBasicInfoRequest);

  public UserEmailUpdateApiResponse updateEmailForUser(UpdateUserEmailRequest updateUserEmailRequest);

  public UserAccountUpdateApiResponse updatePasswordForUser(UpdateUserPasswordRequest updateUserPasswordRequest);

  public UpdateUserAddressDetailApiResponse updateUserAddress(UpdateUserAddressRequest updateUserAddressRequest);

//  public UserAccountApiResponse deleteUserAddress(Long addressId);
}