package com.hk.api.response.order.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.order.OrderPlacedDetailsDto;
import com.hk.api.response.payment.BaseOrderAddress;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class OrderPlacedApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.ORDER_STATUS)
  private String orderStatus;
  @JsonProperty(DtoJsonConstants.GATEWAY_ORDER_ID)
  private String gatewayOrderId;
  @JsonProperty(DtoJsonConstants.ITEMS_IN_ORDER)
  private int itemsInOrder;
  @JsonProperty(DtoJsonConstants.ORDER_STATUS)
  private Long addressId;
  @JsonProperty(DtoJsonConstants.IS_ORDER_SUCCESS)
  private boolean orderPlaced;

  @JsonProperty(DtoJsonConstants.SHIPPING_ADDRESS)
  private BaseOrderAddress shippingAddress;
  @JsonProperty(DtoJsonConstants.ORDER_PLACED_DETAILS_DTO)
  private OrderPlacedDetailsDto orderPlacedDetailsDto;


  public String getOrderStatus() {
    return orderStatus;
  }

  public void setOrderStatus(String orderStatus) {
    this.orderStatus = orderStatus;
  }

  public String getGatewayOrderId() {
    return gatewayOrderId;
  }

  public void setGatewayOrderId(String gatewayOrderId) {
    this.gatewayOrderId = gatewayOrderId;
  }

  public int getItemsInOrder() {
    return itemsInOrder;
  }

  public void setItemsInOrder(int itemsInOrder) {
    this.itemsInOrder = itemsInOrder;
  }

  public BaseOrderAddress getShippingAddress() {
    return shippingAddress;
  }

  public void setShippingAddress(BaseOrderAddress shippingAddress) {
    this.shippingAddress = shippingAddress;
  }

  public OrderPlacedDetailsDto getOrderPlacedDetailsDto() {
    return orderPlacedDetailsDto;
  }

  public void setOrderPlacedDetailsDto(OrderPlacedDetailsDto orderPlacedDetailsDto) {
    this.orderPlacedDetailsDto = orderPlacedDetailsDto;
  }

  public Long getAddressId() {
    return addressId;
  }

  public void setAddressId(Long addressId) {
    this.addressId = addressId;
  }

  public boolean isOrderPlaced() {
    return orderPlaced;
  }

  public void setOrderPlaced(boolean orderPlaced) {
    this.orderPlaced = orderPlaced;
  }
}