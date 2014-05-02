package com.hk.api.response.cart.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.cart.response.CartSummaryAR;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 15, 2013
 * Time: 5:50:57 PM
 */
public class CartSummaryARW extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private CartSummaryAR cartSummaryAR;


  public CartSummaryAR getCartSummaryAR() {
    return cartSummaryAR;
  }

  public void setCartSummaryAR(CartSummaryAR cartSummaryAR) {
    this.cartSummaryAR = cartSummaryAR;
  }
}
