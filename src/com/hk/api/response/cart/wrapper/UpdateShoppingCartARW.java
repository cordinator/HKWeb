package com.hk.api.response.cart.wrapper;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.cart.response.UpdateShoppingCartAR;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 15, 2013
 * Time: 5:49:54 PM
 */
public class UpdateShoppingCartARW extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private UpdateShoppingCartAR updateShoppingCartResponse;


  public UpdateShoppingCartAR getUpdateShoppingCartResponse() {
    return updateShoppingCartResponse;
  }

  public void setUpdateShoppingCartResponse(UpdateShoppingCartAR updateShoppingCartResponse) {
    this.updateShoppingCartResponse = updateShoppingCartResponse;
  }
}
