package com.hk.web.response.cart;

import com.hk.web.response.GenericResponse;
import com.hk.constants.rest.HKWebJsonConstants;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 3, 2013
 * Time: 3:59:27 PM
 */
public class CartSummaryResponse extends GenericResponse {

  private int noOfItems;
  private double cartValue;


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

  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(HKWebJsonConstants.NO_OF_ITEMS);
    if (this.cartValue != 0D) {
      keys.add(HKWebJsonConstants.CART_VAL);
    }


    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.noOfItems);
    if (this.cartValue != 0D) {
      values.add(this.cartValue);
    }

    return values;
  }
}
