package com.hk.web.response.cart;

import com.hk.web.response.GenericResponse;
import com.hk.api.response.cart.response.UpdateShoppingCartAR;
import com.hk.api.response.cart.response.CartSummaryAR;
import com.hk.constants.rest.HKWebJsonConstants;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 18, 2013
 * Time: 4:14:02 PM
 */
public class AddToCartResponse extends GenericResponse {

  private int noOfItems;
  private double cartValue;
  private String lastUpdatedSVName;

  public AddToCartResponse() {

  }

  public AddToCartResponse(UpdateShoppingCartAR updateShoppingCartAR) {
    if (updateShoppingCartAR != null) {
      this.lastUpdatedSVName = updateShoppingCartAR.getLastAddedStoreVariantName();

      CartSummaryAR cartSummaryApiResponse = updateShoppingCartAR.getCartSummaryResponse();

      if (cartSummaryApiResponse != null) {
        this.noOfItems = cartSummaryApiResponse.getItemsInCart();
        this.cartValue = cartSummaryApiResponse.getShoppingCartPricingDto() != null ? cartSummaryApiResponse.getShoppingCartPricingDto().getTotalPayable() : 0D;
      }
    }
  }


  public int getNoOfItems() {
    return noOfItems;
  }

  public void setNoOfItems(int noOfItems) {
    this.noOfItems = noOfItems;
  }

  public double getCartValue() {
    return cartValue;
  }

  public void setCartValue(double cartValue) {
    this.cartValue = cartValue;
  }

  public String getLastUpdatedSVName() {
    return lastUpdatedSVName;
  }

  public void setLastUpdatedSVName(String lastUpdatedSVName) {
    this.lastUpdatedSVName = lastUpdatedSVName;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(HKWebJsonConstants.NO_OF_ITEMS);
    if (this.cartValue != 0D) {
      keys.add(HKWebJsonConstants.CART_VAL);
    }
    keys.add(HKWebJsonConstants.SV_NAME);

    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.noOfItems);
    if (this.cartValue != 0D) {
      values.add(this.cartValue);
    }
    values.add(this.lastUpdatedSVName);
    return values;
  }
}
