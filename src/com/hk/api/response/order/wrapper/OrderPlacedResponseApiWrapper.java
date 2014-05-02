package com.hk.api.response.order.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.order.response.OrderPlacedApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class OrderPlacedResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private OrderPlacedApiResponse orderPlacedApiResponse;


  public OrderPlacedApiResponse getOrderPlacedApiResponse() {
    return orderPlacedApiResponse;
  }

  public void setOrderPlacedApiResponse(OrderPlacedApiResponse orderPlacedApiResponse) {
    this.orderPlacedApiResponse = orderPlacedApiResponse;
  }
}
