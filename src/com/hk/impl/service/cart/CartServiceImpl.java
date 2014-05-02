package com.hk.impl.service.cart;

import com.hk.api.request.cart.*;
import com.hk.api.response.cart.wrapper.CartSummaryARW;
import com.hk.api.response.cart.wrapper.UpdateShoppingCartARW;
import com.hk.api.response.cart.wrapper.ValidatedShoppingCartARW;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.cart.CartService;
import com.hk.pact.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 25, 2013
 * Time: 10:38:13 PM
 */
//@Service
public class CartServiceImpl implements CartService {

  private static final String ADD = "/add";
  private static final String UPDATE = "/update";
  private static final String REMOVE = "/remove";

  private static final String ADD_PACK = "/add/pack";
  private static final String UPDATE_PACK = "/update/pack";
  private static final String REMOVE_PACK = "/remove/pack";

  private static final String GET = "/get/";
  private static final String SUMMARY = "/summary/";

  private static final String APPLY_OFFER = "/applyOffer/";
  private static final String APPLY_COUPON = "/applyCoupon/";

  @Autowired
  private UserService userService;


  @Override
  public UpdateShoppingCartARW addPackToCart(AddPackToCartRequest addPackToCartRequest) {
    if (addPackToCartRequest.validate()) {
      URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CART + ADD_PACK);

      return (UpdateShoppingCartARW) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), addPackToCartRequest.getParameters(), UpdateShoppingCartARW.class);

    }

    return null;
  }

  @Override
  public UpdateShoppingCartARW addVariantToCart(AddSingleVariantToCartRequest addSingleVariantToCartRequest) {

    if (addSingleVariantToCartRequest.validate()) {
      URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CART + ADD);

      return (UpdateShoppingCartARW) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), addSingleVariantToCartRequest.getParameters(), UpdateShoppingCartARW.class);

    }

    return null;
  }

  @Override
  public ValidatedShoppingCartARW updateVariantQtyInCart(AddSingleVariantToCartRequest addSingleVariantToCartRequest) {
    if (addSingleVariantToCartRequest.validate()) {
      URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CART + UPDATE);
      return (ValidatedShoppingCartARW) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), addSingleVariantToCartRequest.getParameters(), ValidatedShoppingCartARW.class);
    }
    return null;
  }

  @Override
  public ValidatedShoppingCartARW updatePackQtyInCart(AddPackToCartRequest addPackToCartRequest) {
    if (addPackToCartRequest.validate()) {
      URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CART + UPDATE_PACK);
      return (ValidatedShoppingCartARW) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), addPackToCartRequest.getParameters(), ValidatedShoppingCartARW.class);
    }
    return null;
  }

  @Override
  public ValidatedShoppingCartARW removeVariantsFromCart(RemoveVariantsFromCartRequest removeVariantsFromCartRequest) {

    Long loggedInUserId = getUserService().getLoggedInUserId();
    removeVariantsFromCartRequest.setUserId(loggedInUserId);
    if (removeVariantsFromCartRequest.validate()) {

      URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CART + REMOVE);
      return (ValidatedShoppingCartARW) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), removeVariantsFromCartRequest.getParameters(), ValidatedShoppingCartARW.class);
    }
    return null;
  }

  public ValidatedShoppingCartARW removePacksFromCart(RemovePacksFromCartRequest removePacksFromCartRequest) {
    Long loggedInUserId = getUserService().getLoggedInUserId();
    removePacksFromCartRequest.setUserId(loggedInUserId);
    if (removePacksFromCartRequest.validate()) {

      URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.CART + REMOVE_PACK);
      return (ValidatedShoppingCartARW) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), removePacksFromCartRequest.getParameters(), ValidatedShoppingCartARW.class);
    }
    return null;
  }

  @Override
  public ValidatedShoppingCartARW getShoppingCartForUser() {
    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId == null) {
      return null;
    }
    String url = ServiceEndPoints.CART + GET;
    url = url.concat(StoreConstants.DEFAULT_STORE_ID_STR).concat(URIBuilder.URL_TOKEN_SEP).concat(loggedInUserId.toString());
    URIBuilder builder = new URIBuilder().fromURI(url);

    return (ValidatedShoppingCartARW) HkHttpClient.executeGet(builder.getWebServiceUrl(), ValidatedShoppingCartARW.class);
  }

  @Override
  public ValidatedShoppingCartARW applyOfferOnCart(Long offerId) {
    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId == null) {
      return null;
    }
    String url = ServiceEndPoints.CART + APPLY_OFFER;
    url = url.concat(StoreConstants.DEFAULT_STORE_ID_STR).concat(URIBuilder.URL_TOKEN_SEP).concat(loggedInUserId.toString()).concat(URIBuilder.URL_TOKEN_SEP).concat(offerId.toString());
    URIBuilder builder = new URIBuilder().fromURI(url);

    return (ValidatedShoppingCartARW) HkHttpClient.executeGet(builder.getWebServiceUrl(), ValidatedShoppingCartARW.class);
  }

  public ValidatedShoppingCartARW applyCouponOnCart(String couponCode) {
    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId == null) {
      return null;
    }

    String url = ServiceEndPoints.CART + APPLY_COUPON;
    url = url.concat(StoreConstants.DEFAULT_STORE_ID_STR).concat(URIBuilder.URL_TOKEN_SEP).concat(loggedInUserId.toString()).concat(URIBuilder.URL_TOKEN_SEP).concat(couponCode);
    URIBuilder builder = new URIBuilder().fromURI(url);

    return (ValidatedShoppingCartARW) HkHttpClient.executeGet(builder.getWebServiceUrl(), ValidatedShoppingCartARW.class);
  }

  @Override
  public CartSummaryARW getCartSummaryForUser() {
    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId == null) {
      return null;
    }
    String url = ServiceEndPoints.CART + SUMMARY;
    url = url.concat(StoreConstants.DEFAULT_STORE_ID_STR).concat(URIBuilder.URL_TOKEN_SEP).concat(loggedInUserId.toString());
    URIBuilder builder = new URIBuilder().fromURI(url);

    return (CartSummaryARW) HkHttpClient.executeGet(builder.getWebServiceUrl(), CartSummaryARW.class);
  }

  @Override
  public UpdateShoppingCartARW addVariantWithExtOpt(AddVariantWithExtraOptions addVariantWithExtraOptions) {
    throw new UnsupportedOperationException();
  }

  public UserService getUserService() {
    return userService;
  }
}
