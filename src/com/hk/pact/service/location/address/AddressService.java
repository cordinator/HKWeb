package com.hk.pact.service.location.address;

import com.hk.api.request.user.CreateUserAddressRequest;
import com.hk.api.request.user.UpdateUserAddressRequest;
import com.hk.api.response.location.address.wrapper.UserAddressListResponseApiWrapper;
import com.hk.api.response.location.address.wrapper.CreateUpdateUserAddressResponseApiWrapper;
import com.hk.api.response.location.address.wrapper.AddressResponseApiWrapper;

/**
 * @author Rimal
 */
public interface AddressService {

  public AddressResponseApiWrapper getAddressById(Long addressId);

  public UserAddressListResponseApiWrapper getAddressListForUser();

  public CreateUpdateUserAddressResponseApiWrapper createAddressForUser(CreateUserAddressRequest createUserAddressRequest);

  public CreateUpdateUserAddressResponseApiWrapper updateAddressForUser(UpdateUserAddressRequest updateUserAddressRequest);

  public UserAddressListResponseApiWrapper deleteAddressForUser(Long addressId);
}