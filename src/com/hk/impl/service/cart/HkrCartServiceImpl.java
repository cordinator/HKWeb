package com.hk.impl.service.cart;

import com.hk.api.request.cart.*;
import com.hk.api.response.cart.wrapper.CartSummaryARW;
import com.hk.api.response.cart.wrapper.UpdateShoppingCartARW;
import com.hk.api.response.cart.wrapper.ValidatedShoppingCartARW;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.EnvConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.cart.CartService;
import com.hk.pact.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Rimal
 */
@Service
public class HkrCartServiceImpl implements CartService {

  private static final String SUMMARY = "/summary/";
  private static final String ADD = "/add/";
  private static final String EXT_OPT = "/extOpt";

  @Autowired
  private UserService userService;

  public UpdateShoppingCartARW addVariantToCart(AddSingleVariantToCartRequest addSingleVariantToCartRequest) {
    URIBuilder builder = new URIBuilder().fromURI(EnvConstants.HKR_SERVER_URL, ServiceEndPoints.CART + ADD);
    AddProductVariantToCartRequest addProductVariantToCartRequest = new AddProductVariantToCartRequest();
    addProductVariantToCartRequest.setOldVariantId(addSingleVariantToCartRequest.getOldVariantId());
    addProductVariantToCartRequest.setUserId(getUserService().getLoggedInUserId());
    return (UpdateShoppingCartARW) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), addProductVariantToCartRequest.getParameters(), UpdateShoppingCartARW.class);
  }

  public UpdateShoppingCartARW addVariantWithExtOpt(AddVariantWithExtraOptions addVariantWithExtraOptions){
    URIBuilder builder = new URIBuilder().fromURI(EnvConstants.HKR_SERVER_URL, ServiceEndPoints.CART + EXT_OPT + ADD);
    AddProductVariantWithExtraOptionsToCart addProductVariantWithExtraOptionsToCart = new AddProductVariantWithExtraOptionsToCart();
    addProductVariantWithExtraOptionsToCart.setOldVariantId(addVariantWithExtraOptions.getOldVariantId());
    addProductVariantWithExtraOptionsToCart.setUserId(addVariantWithExtraOptions.getUserId());
    addProductVariantWithExtraOptionsToCart.setLeftExtOpt(addVariantWithExtraOptions.getLeftExtOpt());
    addProductVariantWithExtraOptionsToCart.setRightExtOpt(addVariantWithExtraOptions.getRightExtOpt());
    return (UpdateShoppingCartARW) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), addProductVariantWithExtraOptionsToCart.getParameters(), UpdateShoppingCartARW.class);
  }

  public UpdateShoppingCartARW addPackToCart(AddPackToCartRequest addPackToCartRequest) {
    throw new UnsupportedOperationException();
  }

  public ValidatedShoppingCartARW updateVariantQtyInCart(AddSingleVariantToCartRequest addSingleVariantToCartRequest) {
    throw new UnsupportedOperationException();
  }

  public ValidatedShoppingCartARW updatePackQtyInCart(AddPackToCartRequest addPackToCartRequest) {
    throw new UnsupportedOperationException();
  }

  public ValidatedShoppingCartARW removeVariantsFromCart(RemoveVariantsFromCartRequest removeVariantsFromCartRequest) {
    throw new UnsupportedOperationException();
  }

  public ValidatedShoppingCartARW removePacksFromCart(RemovePacksFromCartRequest removePacksFromCartRequest) {
    throw new UnsupportedOperationException();
  }

  public ValidatedShoppingCartARW getShoppingCartForUser() {
    throw new UnsupportedOperationException();
  }

  public ValidatedShoppingCartARW applyOfferOnCart(Long offerId) {
    throw new UnsupportedOperationException();
  }

  public ValidatedShoppingCartARW applyCouponOnCart(String couponCode) {
    throw new UnsupportedOperationException();
  }

  public CartSummaryARW getCartSummaryForUser() {
    CartSummaryARW cartSummaryARW = new CartSummaryARW();
    Long loggedInUserId = getUserService().getLoggedInUserId();

    if (loggedInUserId != null) {
      String url = ServiceEndPoints.CART + URIBuilder.URL_TOKEN_SEP + loggedInUserId + SUMMARY;
      URIBuilder builder = new URIBuilder().fromURI(EnvConstants.HKR_SERVER_URL, url);

      cartSummaryARW = (CartSummaryARW) HkHttpClient.executeGet(builder.getWebServiceUrl(), CartSummaryARW.class);
    }
    return cartSummaryARW;
  }


  public UserService getUserService() {
    return userService;
  }
}


class AddProductVariantToCartRequest {
  private String oldVariantId;
  private Long userId;

  public AddProductVariantToCartRequest() {

  }


  public AddProductVariantToCartRequest(String oldVariantId) {

    this.oldVariantId = oldVariantId;

  }

  public Long getUserId() {
    return userId;
  }

  public void setUserId(Long userId) {
    this.userId = userId;
  }

  public String getOldVariantId() {
    return oldVariantId;
  }

  public void setOldVariantId(String oldVariantId) {
    this.oldVariantId = oldVariantId;
  }

  public Map<String, String> getParameters() {
    Map<String, String> params = new HashMap<String, String>();
    params.put("oldVariantId", this.oldVariantId);
    if (userId != null) {
      params.put("userId", this.userId.toString());
    } else {
      params.put("userId", null);
    }

    return params;
  }
}

class AddProductVariantWithExtraOptionsToCart extends AddProductVariantToCartRequest{

  private String leftExtOpt;
  private String rightExtOpt;

  public String getLeftExtOpt() {
    return leftExtOpt;
  }

  public void setLeftExtOpt(String leftExtOpt) {
    this.leftExtOpt = leftExtOpt;
  }

  public String getRightExtOpt() {
    return rightExtOpt;
  }

  public void setRightExtOpt(String rightExtOpt) {
    this.rightExtOpt = rightExtOpt;
  }

  public Map<String, String> getParameters() {
    Map<String, String> params = super.getParameters();
    params.put("leftExtOpt",this.leftExtOpt);
    params.put("rightExtOpt",this.rightExtOpt);
    return params;
  }

}

