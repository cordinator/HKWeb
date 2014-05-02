package com.hk.impl.service.location.address;

import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.exception.InvalidInputException;
import com.hk.pact.service.location.address.AddressService;
import com.hk.pact.service.user.UserService;
import com.hk.api.request.user.CreateUserAddressRequest;
import com.hk.api.request.user.UpdateUserAddressRequest;
import com.hk.api.response.location.address.wrapper.CreateUpdateUserAddressResponseApiWrapper;
import com.hk.api.response.location.address.wrapper.UserAddressListResponseApiWrapper;
import com.hk.api.response.location.address.wrapper.AddressResponseApiWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Rimal
 */
@Service
public class AddressServiceImpl implements AddressService {

  private static final String GET_ADDRESS_SERVICE_END_POINT = ServiceEndPoints.ADDRESS_SERVICE_END_POINT + "get";
  private static final String CREATE_ADDRESS_SERVICE_END_POINT = ServiceEndPoints.ADDRESS_SERVICE_END_POINT + "create";
  private static final String UPDATE_ADDRESS_SERVICE_END_POINT = ServiceEndPoints.ADDRESS_SERVICE_END_POINT + "update";
  private static final String DELETE_ADDRESS_SERVICE_END_POINT = ServiceEndPoints.ADDRESS_SERVICE_END_POINT + "delete";

  @Autowired
  private UserService userService;


  public AddressResponseApiWrapper getAddressById(Long addressId) {
    URIBuilder builder = new URIBuilder().fromURI(GET_ADDRESS_SERVICE_END_POINT + URIBuilder.URL_TOKEN_SEP +
        StoreConstants.DEFAULT_STORE_ID_STR + URIBuilder.URL_TOKEN_SEP + addressId.toString());
    return (AddressResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), AddressResponseApiWrapper.class);
  }

  public UserAddressListResponseApiWrapper getAddressListForUser() {
    Long userId = getUserService().getLoggedInUserId();
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.ADDRESS_SERVICE_END_POINT +
        StoreConstants.DEFAULT_STORE_ID_STR + URIBuilder.URL_TOKEN_SEP +
        userId.toString() + "/list/");

    return (UserAddressListResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), UserAddressListResponseApiWrapper.class);
  }

  public CreateUpdateUserAddressResponseApiWrapper createAddressForUser(CreateUserAddressRequest createUserAddressRequest) {
    Long userId = getUserService().getLoggedInUserId();
    createUserAddressRequest.setUserId(userId);

    if (!createUserAddressRequest.validate()) {
      throw new InvalidInputException("CREATE_USER_ADDRESS_REQ_IS_INVALID");
    }

    URIBuilder builder = new URIBuilder().fromURI(CREATE_ADDRESS_SERVICE_END_POINT);

    return (CreateUpdateUserAddressResponseApiWrapper) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), createUserAddressRequest.getParams(), CreateUpdateUserAddressResponseApiWrapper.class);
  }

  public CreateUpdateUserAddressResponseApiWrapper updateAddressForUser(UpdateUserAddressRequest updateUserAddressRequest) {
    Long userId = getUserService().getLoggedInUserId();
    updateUserAddressRequest.setUserId(userId);

    if (!updateUserAddressRequest.validate()) {
      throw new InvalidInputException("UPDATE_USER_ADDRESS_REQ_IS_INVALID");
    }

    URIBuilder builder = new URIBuilder().fromURI(UPDATE_ADDRESS_SERVICE_END_POINT);

    return (CreateUpdateUserAddressResponseApiWrapper) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), updateUserAddressRequest.getParams(), CreateUpdateUserAddressResponseApiWrapper.class);
  }

  public UserAddressListResponseApiWrapper deleteAddressForUser(Long addressId) {
    Long userId = getUserService().getLoggedInUserId();
    URIBuilder builder = new URIBuilder().fromURI(DELETE_ADDRESS_SERVICE_END_POINT + URIBuilder.URL_TOKEN_SEP +
        StoreConstants.DEFAULT_STORE_ID_STR + URIBuilder.URL_TOKEN_SEP + userId.toString() + URIBuilder.URL_TOKEN_SEP +
        addressId.toString());

    return (UserAddressListResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), UserAddressListResponseApiWrapper.class);
  }


  public UserService getUserService() {
    return userService;
  }
}