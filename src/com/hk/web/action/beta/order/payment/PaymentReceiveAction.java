package com.hk.web.action.beta.order.payment;

import com.hk.api.request.payment.AcceptPaymentForCartRequest;
import com.hk.api.response.order.response.OrderPlacedApiResponse;
import com.hk.api.response.order.wrapper.OrderPlacedResponseApiWrapper;
import com.hk.constants.payment.PaymentGatewayParameters;
import com.hk.pact.service.payment.PaymentService;
import com.hk.web.action.beta.BaseAction;
import com.hk.web.action.beta.order.SelectPaymentModeAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PaymentReceiveAction extends BaseAction {

  @Autowired
  private PaymentService paymentService;

  private OrderPlacedApiResponse orderPlacedApiResponse;

  @DefaultHandler
  public Resolution pre() {
    String gatewayOrderId = getContext().getRequest().getParameter(PaymentGatewayParameters.GATEWAYORDER_ID);
    String accountId = getContext().getRequest().getParameter(PaymentGatewayParameters.ACCOUNTID);
    String amountStr = getContext().getRequest().getParameter(PaymentGatewayParameters.AMOUNT);
    Double amount = NumberUtils.toDouble(amountStr);
    String transactionStatus = getContext().getRequest().getParameter(PaymentGatewayParameters.TRANSACTIONSTATUS);
    String gatewayChecksum = getContext().getRequest().getParameter(PaymentGatewayParameters.CHECKSUM);


    AcceptPaymentForCartRequest acceptPaymentForCartRequest = new AcceptPaymentForCartRequest();

    acceptPaymentForCartRequest.setAccountId(accountId);
    acceptPaymentForCartRequest.setHkPayAmount(amount);
    acceptPaymentForCartRequest.setHkPayChecksum(gatewayChecksum);
    acceptPaymentForCartRequest.setHkPayStatus(transactionStatus);
    acceptPaymentForCartRequest.setHkPayGatewayOrderId(gatewayOrderId);

    OrderPlacedResponseApiWrapper orderPlacedResponseApiWrapper = getPaymentService().acceptPaymentForCart(acceptPaymentForCartRequest);

    if (orderPlacedResponseApiWrapper == null) {
      //TODO: error
      return new RedirectResolution(SelectPaymentModeAction.class).addParameter("paymentFail",true);
    } else {
      orderPlacedApiResponse = orderPlacedResponseApiWrapper.getOrderPlacedApiResponse();
      if(orderPlacedApiResponse!=null){
        if(orderPlacedApiResponse.isOrderPlaced()){
          return new ForwardResolution("/pages/order/orderSuccess.jsp");
        } else{
          return new RedirectResolution(SelectPaymentModeAction.class).addParameter("paymentFail",true).addParameter("selectedAddressId",orderPlacedApiResponse.getAddressId());
        }
      }else{
        return new RedirectResolution(SelectPaymentModeAction.class).addParameter("paymentFail",true);
      }
    }
  }

  public PaymentService getPaymentService() {
    return paymentService;
  }

  public OrderPlacedApiResponse getOrderPlacedApiResponse() {
    return orderPlacedApiResponse;
  }

  public void setOrderPlacedApiResponse(OrderPlacedApiResponse orderPlacedApiResponse) {
    this.orderPlacedApiResponse = orderPlacedApiResponse;
  }
}
