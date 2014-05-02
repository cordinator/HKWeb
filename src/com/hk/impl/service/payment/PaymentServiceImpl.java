package com.hk.impl.service.payment;

import com.hk.api.request.payment.AcceptPaymentForCartRequest;
import com.hk.api.request.payment.CreatePaymentForCartRequest;
import com.hk.api.response.order.wrapper.OrderPlacedResponseApiWrapper;
import com.hk.api.response.payment.wrapper.PreparePaymentResponseApiWrapper;
import com.hk.api.response.payment.wrapper.CreatePaymentResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.RequestConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.payment.PaymentService;
import com.hk.pact.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 24, 2013
 * Time: 2:01:50 PM
 */
@Service
public class PaymentServiceImpl implements PaymentService {

  private static final String PREPARE = "prepare";
  private static final String ACCEPT = "accept";
  private static final String CREATE = "create";


  @Autowired
  private UserService userService;

  @Override
  public PreparePaymentResponseApiWrapper prepareToAcceptPaymentForCart(Long addressId, Long paymentTypeId) {
    if (null == addressId) {
      //TODO: error
      return null;
    }

    if (null == paymentTypeId) {
      //TODO: error
      return null;
    }

    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId == null) {
      //TODO: error page/ login page ??
      return null;
    }

    Long storeId = StoreConstants.DEFAULT_STORE_ID;

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.PAYMENT + storeId.toString() +
        URIBuilder.URL_TOKEN_SEP + loggedInUserId.toString() + URIBuilder.URL_TOKEN_SEP + PREPARE);

    builder.queryParameter(RequestConstants.PAYMENT_TYPE_ID, paymentTypeId.toString());
    builder.queryParameter(RequestConstants.ADDRESS_ID, addressId.toString());


    return (PreparePaymentResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), PreparePaymentResponseApiWrapper.class);
  }

  @Override
  public CreatePaymentResponseApiWrapper createPaymentForCart(CreatePaymentForCartRequest createPaymentForCartRequest) {
    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId == null) {
      //TODO: error page/ login page ??
      return null;
    }

    createPaymentForCartRequest.setUserId(loggedInUserId);

    if (!createPaymentForCartRequest.validate()) {
      //TODO: errors
    }

    Long storeId = StoreConstants.DEFAULT_STORE_ID;

    System.out.println("Sending to edge");
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.PAYMENT + storeId.toString() +
        URIBuilder.URL_TOKEN_SEP + loggedInUserId.toString() + URIBuilder.URL_TOKEN_SEP + CREATE);

    return (CreatePaymentResponseApiWrapper) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), createPaymentForCartRequest.getParameters(), CreatePaymentResponseApiWrapper.class);
  }

  @Override
  public OrderPlacedResponseApiWrapper acceptPaymentForCart(AcceptPaymentForCartRequest acceptPaymentForCartRequest) {
    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId == null) {
      //TODO: error page/ login page ??
      return null;
    }

    /*acceptPaymentForCartRequest.setUserId(loggedInUserId);

    if (!acceptPaymentForCartRequest.validate()) {
      //TODO: errors
    }*/

    Long storeId = StoreConstants.DEFAULT_STORE_ID;

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.PAYMENT + storeId.toString() +
        URIBuilder.URL_TOKEN_SEP + loggedInUserId.toString() + URIBuilder.URL_TOKEN_SEP + ACCEPT);

    return (OrderPlacedResponseApiWrapper) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), acceptPaymentForCartRequest.getParameters(), OrderPlacedResponseApiWrapper.class);
  }

  public UserService getUserService() {
    return userService;
  }
}
