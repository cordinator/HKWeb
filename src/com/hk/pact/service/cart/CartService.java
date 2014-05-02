package com.hk.pact.service.cart;

import com.hk.api.request.cart.*;
import com.hk.api.response.cart.wrapper.CartSummaryARW;
import com.hk.api.response.cart.wrapper.UpdateShoppingCartARW;
import com.hk.api.response.cart.wrapper.ValidatedShoppingCartARW;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 25, 2013
 * Time: 10:36:25 PM
 */
public interface CartService {


  public UpdateShoppingCartARW addVariantToCart(AddSingleVariantToCartRequest addSingleVariantToCartRequest);

  public UpdateShoppingCartARW addVariantWithExtOpt(AddVariantWithExtraOptions addVariantWithExtraOptions);

  public UpdateShoppingCartARW addPackToCart(AddPackToCartRequest addPackToCartRequest);

  public ValidatedShoppingCartARW updateVariantQtyInCart(AddSingleVariantToCartRequest addSingleVariantToCartRequest);

  public ValidatedShoppingCartARW updatePackQtyInCart(AddPackToCartRequest addPackToCartRequest);

  public ValidatedShoppingCartARW removeVariantsFromCart(RemoveVariantsFromCartRequest removeVariantsFromCartRequest);

  public ValidatedShoppingCartARW removePacksFromCart(RemovePacksFromCartRequest removePacksFromCartRequest);

  public ValidatedShoppingCartARW getShoppingCartForUser();

  public ValidatedShoppingCartARW applyOfferOnCart(Long offerId);

  public ValidatedShoppingCartARW applyCouponOnCart(String couponCode);

  public CartSummaryARW getCartSummaryForUser();
}
