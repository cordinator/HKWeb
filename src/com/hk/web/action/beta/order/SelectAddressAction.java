package com.hk.web.action.beta.order;

import com.hk.api.request.user.CreateUserAddressRequest;
import com.hk.api.request.user.UpdateUserAddressRequest;
import com.hk.api.response.location.State;
import com.hk.api.response.location.address.Address;
import com.hk.api.response.location.address.response.CreateUpdateUserAddressApiResponse;
import com.hk.api.response.location.address.response.UserAddressListApiResponse;
import com.hk.api.response.location.address.wrapper.CreateUpdateUserAddressResponseApiWrapper;
import com.hk.api.response.location.address.wrapper.UserAddressListResponseApiWrapper;
import com.hk.api.response.location.response.StateApiResponse;
import com.hk.common.constants.location.LocationConstants;
import com.hk.common.constants.user.RoleConstants;
import com.hk.pact.service.cart.CartService;
import com.hk.pact.service.location.LocationService;
import com.hk.pact.service.location.address.AddressService;
import com.hk.pact.service.user.UserService;
import com.hk.web.action.beta.BaseAction;
import com.hk.web.action.beta.auth.LoginAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.validation.SimpleError;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.stripesstuff.plugin.security.Secure;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Sachit
 * Date: 11/06/13
 * Time: 16:12
 */
@Component
@Secure(hasAnyRoles = {RoleConstants.HK_UNVERIFIED, RoleConstants.HK_USER}, authActionBean = LoginAction.class, disallowRememberMe = true)
public class SelectAddressAction extends BaseAction {

  private Long addressId;
  private String name;
  private String line1;
  private String landmark;
  private String cityName;

  private Long stateId;
  private Long cityId;
  private Long placeId;
  private String pincode;
  private String contactNo;
  private String alternateContactNo;

  private List<State> stateList = new ArrayList<State>(0);
  private List<Address> addressList = new ArrayList<Address>(0);


  @Autowired
  private CartService cartService;
  @Autowired
  private UserService userService;
  @Autowired
  private AddressService addressService;
  @Autowired
  private LocationService locationService;

  private void populateAddressParams() {
    UserAddressListResponseApiWrapper userAddressListResponseWrapper = getAddressService().getAddressListForUser();

    if (userAddressListResponseWrapper != null) {
      UserAddressListApiResponse userAddressListResponse = userAddressListResponseWrapper.getUserAddressListResponse();
      if (userAddressListResponse != null) {
        addressList = userAddressListResponse.getAddresses();
      }
    }
    StateApiResponse stateResponse = getLocationService().getAllStatesForCountry(LocationConstants.COUNTRY_CODE_FOR_INDIA);
    if (stateResponse != null) {
      stateList = stateResponse.getStates();
    }
  }

  @DefaultHandler
  public Resolution pre() {
    populateAddressParams();
    return new ForwardResolution("/pages/address/selectAddress.jsp");
  }


  public Resolution addAddressForUser() {
    CreateUserAddressRequest createUserAddressRequest = new CreateUserAddressRequest();
    buildBaseAddressCreateUpdateRequest(createUserAddressRequest);

    CreateUpdateUserAddressResponseApiWrapper userAddressResponseWrapper = getAddressService().createAddressForUser(createUserAddressRequest);
    if (userAddressResponseWrapper != null && userAddressResponseWrapper.getUserAddressResponse() != null) {
      CreateUpdateUserAddressApiResponse createUpdateUserAddressResponse = userAddressResponseWrapper.getUserAddressResponse();

      //if no exception then forward to payment mode page
      if (!createUpdateUserAddressResponse.isException()) {

        return new RedirectResolution(SelectPaymentModeAction.class, "pre")
            .addParameter("selectedAddressId", createUpdateUserAddressResponse.getLastModifiedAddressId());
      } else {
        addRedirectAlertMessage(new SimpleError(createUpdateUserAddressResponse.getMessages().get(0)));

      }
    }
    populateAddressParams();
    return new ForwardResolution("/pages/address/selectAddress.jsp");

  }


  public Resolution testSelectAddress() {
    return new RedirectResolution(SelectPaymentModeAction.class, "pre")
        .addParameter("selectedAddressId", 1L);
  }


  public Resolution updateAddressForUser() {
    UpdateUserAddressRequest updateUserAddressRequest = new UpdateUserAddressRequest();

    buildBaseAddressCreateUpdateRequest(updateUserAddressRequest);
    updateUserAddressRequest.setAddressId(addressId);

    CreateUpdateUserAddressResponseApiWrapper userAddressResponseWrapper = getAddressService().updateAddressForUser(updateUserAddressRequest);
    if (userAddressResponseWrapper != null && userAddressResponseWrapper.getUserAddressResponse() != null) {
      CreateUpdateUserAddressApiResponse createUpdateUserAddressResponse = userAddressResponseWrapper.getUserAddressResponse();

      //if no exception then forward to payment mode page
      if (!createUpdateUserAddressResponse.isException()) {
        return new RedirectResolution(SelectPaymentModeAction.class, "pre")
            .addParameter("selectedAddressId", createUpdateUserAddressResponse.getLastModifiedAddressId());
      }
      addRedirectAlertMessage(new SimpleError(createUpdateUserAddressResponse.getMessages().get(0)));
    }
    populateAddressParams();
    return new ForwardResolution("/pages/address/selectAddress.jsp");
  }

  public Resolution deleteAddressForUser() {
    UserAddressListResponseApiWrapper userAddressListResponseWrapper = getAddressService().deleteAddressForUser(addressId);

    if (userAddressListResponseWrapper != null) {
      UserAddressListApiResponse userAddressListResponse = userAddressListResponseWrapper.getUserAddressListResponse();
      if (userAddressListResponse != null) {
        addressList = userAddressListResponse.getAddresses();
      }
    }
    return new RedirectResolution(SelectAddressAction.class, "pre");
  }


  private CreateUserAddressRequest buildBaseAddressCreateUpdateRequest(CreateUserAddressRequest createUserAddressRequest) {
    createUserAddressRequest.setName(name);
    createUserAddressRequest.setLine1(line1);
    createUserAddressRequest.setLandmark(landmark);
    createUserAddressRequest.setCityId(cityId);
    createUserAddressRequest.setPlaceId(placeId);
    createUserAddressRequest.setPincode(pincode);
    createUserAddressRequest.setContactNo(contactNo);
    createUserAddressRequest.setAlternateContactNo(alternateContactNo);

    createUserAddressRequest.setCityName(cityName);
    createUserAddressRequest.setStateId(stateId);
    return createUserAddressRequest;
  }


  public Long getAddressId() {
    return addressId;
  }

  public void setAddressId(Long addressId) {
    this.addressId = addressId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getLine1() {
    return line1;
  }

  public void setLine1(String line1) {
    this.line1 = line1;
  }

  public String getLandmark() {
    return landmark;
  }

  public void setLandmark(String landmark) {
    this.landmark = landmark;
  }

  public String getCityName() {
    return cityName;
  }

  public void setCityName(String cityName) {
    this.cityName = cityName;
  }

  public Long getStateId() {
    return stateId;
  }

  public void setStateId(Long stateId) {
    this.stateId = stateId;
  }

  public Long getCityId() {
    return cityId;
  }

  public void setCityId(Long cityId) {
    this.cityId = cityId;
  }

  public Long getPlaceId() {
    return placeId;
  }

  public void setPlaceId(Long placeId) {
    this.placeId = placeId;
  }

  public String getPincode() {
    return pincode;
  }

  public void setPincode(String pincode) {
    this.pincode = pincode;
  }

  public String getContactNo() {
    return contactNo;
  }

  public void setContactNo(String contactNo) {
    this.contactNo = contactNo;
  }

  public List<State> getStateList() {
    return stateList;
  }

  public void setStateList(List<State> stateList) {
    this.stateList = stateList;
  }

  public List<Address> getAddressList() {
    return addressList;
  }

  public void setAddressList(List<Address> addressList) {
    this.addressList = addressList;
  }

  public String getAlternateContactNo() {
    return alternateContactNo;
  }

  public void setAlternateContactNo(String alternateContactNo) {
    this.alternateContactNo = alternateContactNo;
  }


  public CartService getCartService() {
    return cartService;
  }

  public UserService getUserService() {
    return userService;
  }

  public AddressService getAddressService() {
    return addressService;
  }

  public LocationService getLocationService() {
    return locationService;
  }
}