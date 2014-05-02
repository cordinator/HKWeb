package com.hk.api.response.cart.wrapper;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.cart.response.ValidatedShoppingCartAR;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 4, 2013
 * Time: 4:24:32 PM
 */
public class ValidatedShoppingCartARW extends AbstractBaseResponseApiWrapper {


  @JsonProperty(DtoJsonConstants.RESULTS)
  private ValidatedShoppingCartAR validatedShoppingCartResponse;


  public ValidatedShoppingCartAR getValidatedShoppingCartResponse() {
    return validatedShoppingCartResponse;
  }

  public void setValidatedShoppingCartResponse(ValidatedShoppingCartAR validatedShoppingCartResponse) {
    this.validatedShoppingCartResponse = validatedShoppingCartResponse;
  }
}
