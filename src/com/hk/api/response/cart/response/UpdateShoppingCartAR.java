package com.hk.api.response.cart.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 15, 2013
 * Time: 5:49:45 PM
 */
public class UpdateShoppingCartAR extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.NAME)
  private String lastAddedStoreVariantName;


  @JsonProperty(DtoJsonConstants.CART_SUMMARY)
  private CartSummaryAR cartSummaryResponse;


  @JsonProperty(DtoJsonConstants.LOGIN)
  private String loginForUser;      // only for hkr integration


  public String getLastAddedStoreVariantName() {
    return lastAddedStoreVariantName;
  }

  public void setLastAddedStoreVariantName(String lastAddedStoreVariantName) {
    this.lastAddedStoreVariantName = lastAddedStoreVariantName;
  }

  public CartSummaryAR getCartSummaryResponse() {
    return cartSummaryResponse;
  }

  public void setCartSummaryResponse(CartSummaryAR cartSummaryResponse) {
    this.cartSummaryResponse = cartSummaryResponse;
  }

  public String getLoginForUser() {
    return loginForUser;
  }

  public void setLoginForUser(String loginForUser) {
    this.loginForUser = loginForUser;
  }
}
