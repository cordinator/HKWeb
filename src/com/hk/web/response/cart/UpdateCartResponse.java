package com.hk.web.response.cart;

import com.hk.web.response.GenericResponse;
import com.hk.api.response.cart.response.ValidatedShoppingCartAR;
import com.hk.constants.rest.HKWebJsonConstants;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 18, 2013
 * Time: 4:34:21 PM
 */
public class UpdateCartResponse extends GenericResponse {


  private ValidatedShoppingCartAR validatedShoppingCartApiResponse;


  public ValidatedShoppingCartAR getValidatedShoppingCartApiResponse() {
    return validatedShoppingCartApiResponse;
  }

  public void setValidatedShoppingCartApiResponse(ValidatedShoppingCartAR validatedShoppingCartApiResponse) {
    this.validatedShoppingCartApiResponse = validatedShoppingCartApiResponse;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(HKWebJsonConstants.CART);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(validatedShoppingCartApiResponse);

    return values;
  }
}
