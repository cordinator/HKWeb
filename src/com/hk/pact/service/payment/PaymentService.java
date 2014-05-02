package com.hk.pact.service.payment;

import com.hk.api.request.payment.AcceptPaymentForCartRequest;
import com.hk.api.request.payment.CreatePaymentForCartRequest;
import com.hk.api.response.payment.wrapper.CreatePaymentResponseApiWrapper;
import com.hk.api.response.order.wrapper.OrderPlacedResponseApiWrapper;
import com.hk.api.response.payment.wrapper.PreparePaymentResponseApiWrapper;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 24, 2013
 * Time: 1:56:06 PM
 */
public interface PaymentService {

  public PreparePaymentResponseApiWrapper prepareToAcceptPaymentForCart(Long addressId, Long paymentTypeId);

  public CreatePaymentResponseApiWrapper createPaymentForCart(CreatePaymentForCartRequest createPaymentForCartRequest);

  public OrderPlacedResponseApiWrapper acceptPaymentForCart(AcceptPaymentForCartRequest acceptPaymentForCartRequest);

}
