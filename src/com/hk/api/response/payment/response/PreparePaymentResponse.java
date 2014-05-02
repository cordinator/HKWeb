package com.hk.api.response.payment.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.cart.ShoppingCartTrimmedVariant;
import com.hk.api.response.payment.OrderPricingDto;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 24, 2013
 * Time: 2:25:36 PM
 */
public class PreparePaymentResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.ORDER_PRICING_DTO)
  private OrderPricingDto orderPricingDto;

  @JsonProperty(DtoJsonConstants.NO_ITEMS_IN_CART)
  private int itemsInCart;

  @JsonProperty(DtoJsonConstants.CART_TRIMMED_VARIANTS)
  private List<ShoppingCartTrimmedVariant> shoppingCartTrimmedVariants = new ArrayList<ShoppingCartTrimmedVariant>();


  public OrderPricingDto getOrderPricingDto() {
    return orderPricingDto;
  }

  public void setOrderPricingDto(OrderPricingDto orderPricingDto) {
    this.orderPricingDto = orderPricingDto;
  }

  public List<ShoppingCartTrimmedVariant> getShoppingCartTrimmedVariants() {
    return shoppingCartTrimmedVariants;
  }

  public void setShoppingCartTrimmedVariants(List<ShoppingCartTrimmedVariant> shoppingCartTrimmedVariants) {
    this.shoppingCartTrimmedVariants = shoppingCartTrimmedVariants;
  }

  public int getItemsInCart() {
    return itemsInCart;
  }

  public void setItemsInCart(int itemsInCart) {
    this.itemsInCart = itemsInCart;
  }
}


