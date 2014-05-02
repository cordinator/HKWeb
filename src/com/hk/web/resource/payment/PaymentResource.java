package com.hk.web.resource.payment;

import com.hk.api.request.payment.CreatePaymentForCartRequest;
import com.hk.api.response.payment.response.CreatePaymentResponse;
import com.hk.api.response.payment.wrapper.CreatePaymentResponseApiWrapper;
import com.hk.common.constants.payment.EnumPaymentStatus;
import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.pact.service.payment.HKPayPaymentService;
import com.hk.pact.service.payment.PaymentService;
import com.hk.pact.service.user.UserService;
import com.hk.web.response.payment.PaymentSentResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Component
@Path("/payment/")
public class PaymentResource {

  @Autowired
  private UserService userService;
  @Autowired
  private PaymentService paymentService;
  @Autowired
  private HKPayPaymentService hkPayPaymentService;

  @POST
  @Path("/create")
  @Produces("application/json")
  public PaymentSentResponse getPaymentSentResponse(CreatePaymentForCartRequest createPaymentForCartRequest) {

    PaymentSentResponse paymentSentResponse = new PaymentSentResponse();
    Long loggedInUserId = getUserService().getLoggedInUserId();

    if (loggedInUserId == null) {
      paymentSentResponse.setException(true).addMessage(HKWebMessageConstants.NO_LOGGED_IN_USER);
      return paymentSentResponse;
    }

    try {

      createPaymentForCartRequest.setPaymentStatusId(EnumPaymentStatus.REQUEST.getId());

      CreatePaymentResponseApiWrapper createPaymentResponseApiWrapper = getPaymentService().createPaymentForCart(createPaymentForCartRequest);
      System.out.println("received from edge");
      if (createPaymentResponseApiWrapper == null) {
        //TODO: error msg
        paymentSentResponse.setException(true).addMessage(HKWebMessageConstants.ERROR);
        return paymentSentResponse;
      } else if (createPaymentResponseApiWrapper.getCreatePaymentResponse() == null) {
        //TODO: error msg
        paymentSentResponse.setException(true).addMessage(HKWebMessageConstants.ERROR);
        return paymentSentResponse;
      }

      CreatePaymentResponse createPaymentResponse = createPaymentResponseApiWrapper.getCreatePaymentResponse();

      if(createPaymentResponse.isException()){
        paymentSentResponse.setException(true).setMessages(createPaymentResponse.getMessages());
        return paymentSentResponse;
      }
      if (createPaymentResponse.getShoppingCartTrimmedVariants() != null && createPaymentResponse.getShoppingCartTrimmedVariants().size() > 0) {
        //TODO: display trimmed variants
        paymentSentResponse.setShoppingCartTrimmedVariants(createPaymentResponse.getShoppingCartTrimmedVariants());
        return paymentSentResponse;
      }


      String gateWayOrderId = createPaymentResponse.getGatewayOrderId();
      String paymentChecksum = createPaymentResponse.getCheckSum();
      System.out.println("builgin pay sent resp");
      paymentSentResponse.setGatewayOrderId(gateWayOrderId);
      paymentSentResponse.setPaymentChecksum(paymentChecksum);

      System.out.println("built pay sent resp" + gateWayOrderId + ":->" + paymentChecksum);
      return paymentSentResponse;

    } catch (Exception e) {
      paymentSentResponse.setException(true).addMessage(HKWebMessageConstants.ERROR);
      return paymentSentResponse;
    }
  }

  public UserService getUserService() {
    return userService;
  }

  public PaymentService getPaymentService() {
    return paymentService;
  }

  public HKPayPaymentService getHkPayPaymentService() {
    return hkPayPaymentService;
  }
}
