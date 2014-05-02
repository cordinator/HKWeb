package com.hk.web.action.beta.order;

import com.hk.web.action.beta.BaseAction;
import com.hk.api.response.order.response.OrderPlacedApiResponse;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.stereotype.Component;

/**
 * Created with IntelliJ IDEA.
 * User: Sachit
 * Date: 18/06/13
 * Time: 18:26
 */

@Component
public class OrderSuccessAction extends BaseAction {

  private OrderPlacedApiResponse orderPlacedApiResponse;

  @DefaultHandler
  public Resolution pre() {
    return new ForwardResolution("/pages/order/orderSuccess.jsp");
  }


  public OrderPlacedApiResponse getOrderPlacedApiResponse() {
    return orderPlacedApiResponse;
  }

  public void setOrderPlacedApiResponse(OrderPlacedApiResponse orderPlacedApiResponse) {
    this.orderPlacedApiResponse = orderPlacedApiResponse;
  }
}
