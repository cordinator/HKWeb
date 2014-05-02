package com.hk.web.action.beta.account;

import com.hk.api.request.user.UpdateUserAddressRequest;
import com.hk.api.response.location.State;
import com.hk.api.response.location.address.Address;
import com.hk.api.response.location.address.response.UserAddressListApiResponse;
import com.hk.api.response.location.address.response.account.UpdateUserAddressDetailApiResponse;
import com.hk.api.response.location.address.wrapper.AddressResponseApiWrapper;
import com.hk.api.response.location.address.wrapper.UserAddressListResponseApiWrapper;
import com.hk.api.response.location.response.StateApiResponse;
import com.hk.common.constants.location.LocationConstants;
import com.hk.common.constants.user.RoleConstants;
import com.hk.constants.account.MyAccountConstants;
import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.pact.service.location.LocationService;
import com.hk.pact.service.location.address.AddressService;
import com.hk.pact.service.user.UserAccountService;
import com.hk.web.action.beta.BaseAction;
import com.hk.web.action.beta.auth.LoginAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.SimpleMessage;
import net.sourceforge.stripes.validation.SimpleError;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.stripesstuff.plugin.security.Secure;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
@Component
@Secure(hasAnyRoles = {RoleConstants.HK_UNVERIFIED, RoleConstants.HK_USER, RoleConstants.HK_DEACTIVATED}, authActionBean = LoginAction.class, disallowRememberMe = true)
public class MyAccountAddressAction extends BaseAction {

  private Long addressId;
  private Address address;
  private UserAddressListApiResponse userAddressListResponse;

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

  private int tabId = MyAccountConstants.ADDRESSES_TAB;
  private List<State> stateList = new ArrayList<State>(0);
  private boolean accountLoaded = true;


  @Autowired
  private AddressService addressService;
  @Autowired
  private UserAccountService userAccountService;
  @Autowired
  private LocationService locationService;


  private void setAddresses() {
    UserAddressListResponseApiWrapper addressListResponseWrapper = getAddressService().getAddressListForUser();
    if (addressListResponseWrapper != null) {
      userAddressListResponse = addressListResponseWrapper.getUserAddressListResponse();
    } else {
      accountLoaded = false;
    }
  }

  private void populateAddressParams() {
    AddressResponseApiWrapper addressResponseWrapper = getAddressService().getAddressById(addressId);
    if (addressResponseWrapper != null) {
      address = addressResponseWrapper.getAddressResponse().getAddress();
      StateApiResponse stateResponse = getLocationService().getAllStatesForCountry(LocationConstants.COUNTRY_CODE_FOR_INDIA);
      if (stateResponse != null) {
        stateList = stateResponse.getStates();
      }
    } else {
      accountLoaded = false;
    }

  }

  @DefaultHandler
  public Resolution pre() {
    setAddresses();
    return new ForwardResolution("/pages/account/myAccountAddress.jsp");
  }

  public Resolution editAddress() {
    populateAddressParams();
    /*
    UserAddressListResponseApiWrapper addressListResponseWrapper = getAddressService().getAddressListForUser();
    if (addressListResponseWrapper != null) {
      userAddressListResponse = addressListResponseWrapper.getUserAddressListResponse();
    }*/
    return new ForwardResolution("/pages/account/myAccountEditAddress.jsp");
  }

  public Resolution addAddressForUser() {
    UpdateUserAddressRequest updateUserAddressRequest = new UpdateUserAddressRequest();

    updateUserAddressRequest.setAddressId(addressId);
    updateUserAddressRequest.setName(name);
    updateUserAddressRequest.setLine1(line1);
    updateUserAddressRequest.setLandmark(landmark);
    updateUserAddressRequest.setCityId(cityId);
    updateUserAddressRequest.setCityName(cityName);
    updateUserAddressRequest.setPlaceId(placeId);
    updateUserAddressRequest.setPincode(pincode);
    updateUserAddressRequest.setStateId(stateId);
    updateUserAddressRequest.setContactNo(contactNo);
    updateUserAddressRequest.setAlternateContactNo(alternateContactNo);

    UpdateUserAddressDetailApiResponse updateUserAddressDetailApiResponse = getUserAccountService().updateUserAddress(updateUserAddressRequest);

    if (updateUserAddressDetailApiResponse != null) {
      userAddressListResponse = updateUserAddressDetailApiResponse.getUserAddressListApiResponse();
      if (updateUserAddressDetailApiResponse.isException()) {
        addRedirectAlertMessage(new SimpleError(updateUserAddressDetailApiResponse.getMessages().get(0)));
        populateAddressParams();
        return new ForwardResolution("/pages/account/myAccountEditAddress.jsp");

      } else {
        addRedirectAlertMessage(new SimpleMessage(HKWebMessageConstants.ADDRESS_SAVE));
      }
    } else {
      accountLoaded = false;
    }
    return new ForwardResolution("/pages/account/myAccountAddress.jsp");
  }

  public Resolution deleteAddress() {
    UserAddressListResponseApiWrapper userAddressListResponseApiWrapper = getAddressService().deleteAddressForUser(addressId);
    if (userAddressListResponseApiWrapper != null) {
      userAddressListResponse = userAddressListResponseApiWrapper.getUserAddressListResponse();
      addRedirectAlertMessage(new SimpleMessage(HKWebMessageConstants.ADDRESS_DELETE));
    } else {
      addRedirectAlertMessage(new SimpleError(HKWebMessageConstants.ADDRESS_DELETE_FAIL));
    }
    setAddresses();
    return new ForwardResolution("/pages/account/myAccountAddress.jsp");
  }


  public Long getAddressId() {
    return addressId;
  }

  public void setAddressId(Long addressId) {
    this.addressId = addressId;
  }

  public Address getAddress() {
    return address;
  }

  public void setAddress(Address address) {
    this.address = address;
  }

  public UserAddressListApiResponse getUserAddressListResponse() {
    return userAddressListResponse;
  }

  public void setUserAddressListResponse(UserAddressListApiResponse userAddressListResponse) {
    this.userAddressListResponse = userAddressListResponse;
  }


  public AddressService getAddressService() {
    return addressService;
  }

  public UserAccountService getUserAccountService() {
    return userAccountService;
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

  public int getTabId() {
    return tabId;
  }

  public void setTabId(int tabId) {
    this.tabId = tabId;
  }

  public List<State> getStateList() {
    return stateList;
  }

  public void setStateList(List<State> stateList) {
    this.stateList = stateList;
  }

  public LocationService getLocationService() {
    return locationService;
  }

  public boolean isAccountLoaded() {
    return accountLoaded;
  }

  public void setAccountLoaded(boolean accountLoaded) {
    this.accountLoaded = accountLoaded;
  }

  public String getAlternateContactNo() {
    return alternateContactNo;
  }

  public void setAlternateContactNo(String alternateContactNo) {
    this.alternateContactNo = alternateContactNo;
  }
}