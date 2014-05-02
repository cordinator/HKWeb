package com.hk.web.action.beta.cart;

import com.hk.api.response.cart.ShoppingCartPricingDto;
import com.hk.api.response.cart.ShoppingCartTrimmedVariant;
import com.hk.api.response.cart.response.ValidatedShoppingCartAR;
import com.hk.api.response.cart.wrapper.ValidatedShoppingCartARW;
import com.hk.pact.service.cart.CartService;
import com.hk.web.action.beta.BaseAction;
import com.hk.web.action.beta.order.SelectAddressAction;
import net.sourceforge.stripes.action.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 4, 2013
 * Time: 4:49:38 PM
 */
@Component
public class CartAction extends BaseAction {

  private ValidatedShoppingCartAR validatedShoppingCartResponse;
  private List<ShoppingCartTrimmedVariant> trimmedVariants = new ArrayList<ShoppingCartTrimmedVariant>(0);

  private boolean cartEmpty = true;
  private Long offerId;

  @Autowired
  private CartService cartService;

  @DefaultHandler
  @DontValidate
  public Resolution renderCart() {
    ValidatedShoppingCartARW validatedShoppingCartResponseWrapper = getCartService().getShoppingCartForUser();

    if (null != validatedShoppingCartResponseWrapper) {
      validatedShoppingCartResponse = validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse();
      if (validatedShoppingCartResponse.getShoppingCartPricingDto() != null) {
        ShoppingCartPricingDto shoppingCartPricingDto = validatedShoppingCartResponse.getShoppingCartPricingDto();

        if (shoppingCartPricingDto.getShoppingCartVariants() != null && shoppingCartPricingDto.getShoppingCartVariants().size() > 0) {
          cartEmpty = false;
        }
        if (shoppingCartPricingDto.getShoppingCartPacks() != null && shoppingCartPricingDto.getShoppingCartPacks().size() > 0) {
          cartEmpty = false;
        }
      }
    }

    return new ForwardResolution("/pages/cart/cart.jsp");
  }


  public Resolution applyOffer() {
    ValidatedShoppingCartARW validatedShoppingCartResponseWrapper = getCartService().applyOfferOnCart(offerId);

    if (null != validatedShoppingCartResponseWrapper) {
      validatedShoppingCartResponse = validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse();
      if (validatedShoppingCartResponse.getShoppingCartPricingDto() != null) {
        ShoppingCartPricingDto shoppingCartPricingDto = validatedShoppingCartResponse.getShoppingCartPricingDto();

        if (shoppingCartPricingDto.getShoppingCartVariants() != null && shoppingCartPricingDto.getShoppingCartVariants().size() > 0) {
          cartEmpty = false;
        }
        if (shoppingCartPricingDto.getShoppingCartPacks() != null && shoppingCartPricingDto.getShoppingCartPacks().size() > 0) {
          cartEmpty = false;
        }
      }
    }

    return new ForwardResolution("/pages/cart/cart.jsp");
  }

  public Resolution placeOrder() {
    ValidatedShoppingCartARW validatedShoppingCartResponseWrapper = getCartService().getShoppingCartForUser();

    if (null != validatedShoppingCartResponseWrapper) {
      ValidatedShoppingCartAR validatedShoppingCartResponse = validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse();

      if (!validatedShoppingCartResponse.getTrimmedShoppingCartVariants().isEmpty()) {
        //let the user press place order again n again till there are no trimmed cart variants

        /**
         * TODO: stay on cart page and display a popup saying these are trimmed variants, and have been trimmed for {x} reason,
         */

      } else {
        return new RedirectResolution(SelectAddressAction.class, "pre");
      }
    }
    return null;
  }


  public ValidatedShoppingCartAR getValidatedShoppingCartResponse() {
    return validatedShoppingCartResponse;
  }

  public void setValidatedShoppingCartResponse(ValidatedShoppingCartAR validatedShoppingCartResponse) {
    this.validatedShoppingCartResponse = validatedShoppingCartResponse;
  }

  public List<ShoppingCartTrimmedVariant> getTrimmedVariants() {
    return trimmedVariants;
  }

  public void setTrimmedVariants(List<ShoppingCartTrimmedVariant> trimmedVariants) {
    this.trimmedVariants = trimmedVariants;
  }

  public boolean isCartEmpty() {
    return cartEmpty;
  }

  public void setCartEmpty(boolean cartEmpty) {
    this.cartEmpty = cartEmpty;
  }

  public CartService getCartService() {
    return cartService;
  }

  public Long getOfferId() {
    return offerId;
  }

  public void setOfferId(Long offerId) {
    this.offerId = offerId;
  }
}