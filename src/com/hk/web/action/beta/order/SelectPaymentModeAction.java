package com.hk.web.action.beta.order;

import com.hk.api.response.location.address.Address;
import com.hk.api.response.location.address.response.AddressApiResponse;
import com.hk.api.response.location.address.wrapper.AddressResponseApiWrapper;
import com.hk.api.response.payment.response.PreparePaymentResponse;
import com.hk.api.response.payment.response.SelectPaymentModeResponse;
import com.hk.api.response.payment.wrapper.PreparePaymentResponseApiWrapper;
import com.hk.api.response.user.response.UserApiResponse;
import com.hk.common.constants.payment.EnumPaymentType;
import com.hk.common.constants.user.RoleConstants;
import com.hk.pact.service.location.address.AddressService;
import com.hk.pact.service.payment.HKPayPaymentService;
import com.hk.pact.service.payment.PaymentService;
import com.hk.pact.service.user.UserService;
import com.hk.web.action.beta.BaseAction;
import com.hk.web.action.beta.auth.LoginAction;
import com.hk.web.action.beta.cart.CartAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.stripesstuff.plugin.security.Secure;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
@Component
@Secure(hasAnyRoles = {RoleConstants.HK_UNVERIFIED, RoleConstants.HK_USER}, authActionBean = LoginAction.class, disallowRememberMe = true)
public class SelectPaymentModeAction extends BaseAction {

  private Long selectedAddressId;
  /*private Long cartId;*/
  private Address selectedAddress;

  private PreparePaymentResponse preparePaymentResponse;
  private List<SelectPaymentModeResponse> selectPaymentModeResponses = new ArrayList<SelectPaymentModeResponse>();

  private String email;
  private String accountId;
  private String amountStr;
  private Long defaultPaymentModeResponseId;

  private boolean paymentFail = false;

  @Autowired
  private AddressService addressService;
  @Autowired
  private PaymentService paymentService;
  @Autowired
  private UserService userService;
  @Autowired
  private HKPayPaymentService hkPayPaymentService;


  @DefaultHandler
  public Resolution pre() {
    Long loggedInUserId = getUserService().getLoggedInUserId();

    //User is not logged-on sending to LoginAction
    if (loggedInUserId == null) {
      return new RedirectResolution(LoginAction.class);
    }
    selectPaymentModeResponses = getHkPayPaymentService().getSelectPaymentModeResponseWrapper();

    if (selectPaymentModeResponses != null && selectPaymentModeResponses.size() > 0) {
      UserApiResponse userApiResponse = getUserService().getUserResponseById(loggedInUserId);
      if (userApiResponse != null) {
        email = userApiResponse.getEmail();
      }

      if (selectedAddressId == null) {
        return new RedirectResolution(SelectAddressAction.class);
      }

      AddressResponseApiWrapper addressResponseWrapper = getAddressService().getAddressById(selectedAddressId);
      if (addressResponseWrapper == null || addressResponseWrapper.getAddressResponse() == null) {
        return new RedirectResolution(SelectAddressAction.class);
      }

      if (addressResponseWrapper.getAddressResponse() != null) {
        AddressApiResponse addressResponse = addressResponseWrapper.getAddressResponse();
        if (!addressResponse.isException()) {
          selectedAddress = addressResponse.getAddress();
        }
      }

      //TODO# Need to change logic for default Payment Mode Response

      defaultPaymentModeResponseId = EnumPaymentType.ONLINE_PAYMENT.getId();

      PreparePaymentResponseApiWrapper preparePaymentResponseApiWrapper = getPaymentService().prepareToAcceptPaymentForCart(selectedAddressId, defaultPaymentModeResponseId);
      double amount = 0.0;
      if (preparePaymentResponseApiWrapper == null) {
        //TODO: error
        return null;
      }

      if (preparePaymentResponseApiWrapper.getOrderPreparedForPurchaseResponse() != null) {
        preparePaymentResponse = preparePaymentResponseApiWrapper.getOrderPreparedForPurchaseResponse();
        if(preparePaymentResponse.getOrderPricingDto() == null){
          return new RedirectResolution(CartAction.class);
        }
        amount = preparePaymentResponse.getOrderPricingDto().getTotalPayable();
        if (preparePaymentResponse.getShoppingCartTrimmedVariants() != null && preparePaymentResponse.getShoppingCartTrimmedVariants().size() > 0) {
          //TODO: error
        }
      }
      amountStr = getHkPayPaymentService().getAmountStr(amount);
    } else {
      //TODO: display error on page no payment mode available or secure pay is down
    }
    return new ForwardResolution("/pages/payment/selectPaymentType.jsp");
  }

  public Long getSelectedAddressId() {
    return selectedAddressId;
  }

  public void setSelectedAddressId(Long selectedAddressId) {
    this.selectedAddressId = selectedAddressId;
  }

  public Address getSelectedAddress() {
    return selectedAddress;
  }

  public void setSelectedAddress(Address selectedAddress) {
    this.selectedAddress = selectedAddress;
  }

  public AddressService getAddressService() {
    return addressService;
  }

  public PaymentService getPaymentService() {
    return paymentService;
  }


  public PreparePaymentResponse getOrderPreparedForPurchaseResponse() {
    return preparePaymentResponse;
  }

  public void setOrderPreparedForPurchaseResponse(PreparePaymentResponse preparePaymentResponse) {
    this.preparePaymentResponse = preparePaymentResponse;
  }


  public List<SelectPaymentModeResponse> getSelectPaymentModeResponses() {
    return selectPaymentModeResponses;
  }

  public void setSelectPaymentModeResponses(List<SelectPaymentModeResponse> selectPaymentModeResponses) {
    this.selectPaymentModeResponses = selectPaymentModeResponses;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public UserService getUserService() {
    return userService;
  }

  public String getAccountId() {
    return accountId;
  }

  public void setAccountId(String accountId) {
    this.accountId = accountId;
  }

  public String getAmountStr() {
    return amountStr;
  }

  public void setAmountStr(String amountStr) {
    this.amountStr = amountStr;
  }

  /* public Long getCartId() {
    return cartId;
  }

  public void setCartId(Long cartId) {
    this.cartId = cartId;
  }*/

  public Long getDefaultPaymentModeResponseId() {
    return defaultPaymentModeResponseId;
  }

  public void setDefaultPaymentModeResponseId(Long defaultPaymentModeResponseId) {
    this.defaultPaymentModeResponseId = defaultPaymentModeResponseId;
  }

  public HKPayPaymentService getHkPayPaymentService() {
    return hkPayPaymentService;
  }

  public boolean isPaymentFail() {
    return paymentFail;
  }

  public boolean getPaymentFail() {
    return paymentFail;
  }


  public void setPaymentFail(boolean paymentFail) {
    this.paymentFail = paymentFail;
  }
}