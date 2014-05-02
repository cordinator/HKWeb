package com.hk.api.response.cart.response;

import org.codehaus.jackson.annotate.JsonProperty;
import com.hk.common.constants.DtoJsonConstants;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 15, 2013
 * Time: 5:50:51 PM
 */
public class CartSummaryAR extends AbstractShoppingCartAR {

  @JsonProperty(DtoJsonConstants.NO_ITEMS_IN_CART)
  private int itemsInCart;


  public int getItemsInCart() {
    return itemsInCart;
  }

  public void setItemsInCart(int itemsInCart) {
    this.itemsInCart = itemsInCart;
  }
}
