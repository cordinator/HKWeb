package com.hk.web.resource.cart;

import com.hk.api.request.cart.*;
import com.hk.api.response.cart.response.CartSummaryAR;
import com.hk.api.response.cart.wrapper.CartSummaryARW;
import com.hk.api.response.cart.wrapper.UpdateShoppingCartARW;
import com.hk.api.response.cart.wrapper.ValidatedShoppingCartARW;
import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.constants.rest.HKWebRequestConstants;
import com.hk.pact.service.auth.LoginService;
import com.hk.pact.service.cart.CartService;
import com.hk.pact.service.user.UserService;
import com.hk.web.response.cart.AddToCartResponse;
import com.hk.web.response.cart.CartSummaryResponse;
import com.hk.web.response.cart.UpdateCartResponse;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 25, 2013
 * Time: 10:35:02 PM
 */
@Component
@Path("/cart")
public class CartResource {


  @Autowired
  private CartService cartService;
  @Autowired
  private UserService userService;
  @Autowired
  private LoginService loginService;


  @POST
  @Path("/variant/add")
  public AddToCartResponse addSingleVariantToCart(AddSingleVariantToCartRequest addSingleVariantToCartRequest) {

    AddToCartResponse addToCartResponse = new AddToCartResponse();

    Long userId = getUserService().getLoggedInUserId();

    if (userId == null) {
      getLoginService().createAndLoginAsGuestUser();
      userId = getUserService().getLoggedInUserId();

      if (userId == null) {
        addToCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_ADD_TO_CART);
        return addToCartResponse;
      }
    }

    addSingleVariantToCartRequest.setUserId(userId);
    UpdateShoppingCartARW updateShoppingCartResponseWrapper = getCartService().addVariantToCart(addSingleVariantToCartRequest);


    if (updateShoppingCartResponseWrapper.getUpdateShoppingCartResponse() != null) {
      addToCartResponse = new AddToCartResponse(updateShoppingCartResponseWrapper.getUpdateShoppingCartResponse());
      return addToCartResponse;
    } else {
      addToCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_ADD_TO_CART);
      return addToCartResponse;
    }
  }

  /**
   * only an integration jugaad need to be removed
   *
   * @param addSingleVariantToCartRequest
   * @return
   */
  @POST
  @Path("/productVariant/add")
  public AddToCartResponse addProductVariantToHkrCart(AddSingleVariantToCartRequest addSingleVariantToCartRequest) {

    AddToCartResponse addToCartResponse = new AddToCartResponse();

    Long userId = getUserService().getLoggedInUserId();

    /*if (userId == null) {
    /*if (userId == null) {
      getLoginService().createAndLoginAsGuestUser();
      userId = getUserService().getLoggedInUserId();

      if (userId == null) {
        addToCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_ADD_TO_CART);
        return addToCartResponse;
      }
    }*/

    addSingleVariantToCartRequest.setUserId(userId);
    UpdateShoppingCartARW updateShoppingCartResponseWrapper = getCartService().addVariantToCart(addSingleVariantToCartRequest);


    if (updateShoppingCartResponseWrapper != null && updateShoppingCartResponseWrapper.getUpdateShoppingCartResponse() != null) {
      if (userId == null) {
        String login = updateShoppingCartResponseWrapper.getUpdateShoppingCartResponse().getLoginForUser();
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(login, login);
        usernamePasswordToken.setRememberMe(true);

        try {
          SecurityUtils.getSubject().login(usernamePasswordToken);
          //getSecurityManager().login(null, usernamePasswordToken);
        } catch (AuthenticationException e) {
//        logger.error("Unable to login", e);
          // Note: if the login fails, existing subject is still retained
          //      throw new LoginException("Unable to login", e);
        }
      }
      addToCartResponse = new AddToCartResponse(updateShoppingCartResponseWrapper.getUpdateShoppingCartResponse());
      return addToCartResponse;
    } else {
      addToCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_ADD_TO_CART);
      return addToCartResponse;
    }
  }

  @POST
  @Path("/productVariantExtOpt/add")
  public AddToCartResponse addProductVariantToHkrCartWithExtraOptions(AddVariantWithExtraOptions addVariantWithExtraOptions) {
    AddToCartResponse addToCartResponse = new AddToCartResponse();
    Long userId = getUserService().getLoggedInUserId();

    addVariantWithExtraOptions.setUserId(userId);
    UpdateShoppingCartARW updateShoppingCartARW = getCartService().addVariantWithExtOpt(addVariantWithExtraOptions);

    if (updateShoppingCartARW != null && updateShoppingCartARW.getUpdateShoppingCartResponse() != null) {
      if (userId == null) {
        String login = updateShoppingCartARW.getUpdateShoppingCartResponse().getLoginForUser();
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(login, login);
        usernamePasswordToken.setRememberMe(true);

        try {
          SecurityUtils.getSubject().login(usernamePasswordToken);
        } catch (AuthenticationException e) {

        }
      }
      addToCartResponse = new AddToCartResponse(updateShoppingCartARW.getUpdateShoppingCartResponse());
      return addToCartResponse;
    } else {
      addToCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_ADD_TO_CART);
      return addToCartResponse;
    }
  }


  @POST
  @Path("/pack/add")
  public AddToCartResponse addPackToCart(AddPackToCartRequest addPackToCartRequest) {

    AddToCartResponse addToCartResponse = new AddToCartResponse();

    Long userId = getUserService().getLoggedInUserId();

    if (userId == null) {
      getLoginService().createAndLoginAsGuestUser();
      userId = getUserService().getLoggedInUserId();

      if (userId == null) {
        addToCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_ADD_TO_CART);
        return addToCartResponse;
      }
    }

    addPackToCartRequest.setUserId(userId);
    UpdateShoppingCartARW updateShoppingCartResponseWrapper = getCartService().addPackToCart(addPackToCartRequest);


    if (updateShoppingCartResponseWrapper.getUpdateShoppingCartResponse() != null) {
      addToCartResponse = new AddToCartResponse(updateShoppingCartResponseWrapper.getUpdateShoppingCartResponse());
      return addToCartResponse;
    } else {
      addToCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_ADD_TO_CART);
      return addToCartResponse;
    }


  }


  @POST
  @Path("/variant/update")
  public UpdateCartResponse updateSingleVariantToCart(AddSingleVariantToCartRequest addSingleVariantToCartRequest) {

    UpdateCartResponse updateCartResponse = new UpdateCartResponse();
    Long userId = getUserService().getLoggedInUserId();

    if (userId == null) {
      getLoginService().createAndLoginAsGuestUser();
      userId = getUserService().getLoggedInUserId();

      if (userId == null) {
        updateCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_ADD_TO_CART);
        return updateCartResponse;
      }
    }

    addSingleVariantToCartRequest.setUserId(userId);
    ValidatedShoppingCartARW validatedShoppingCartResponseWrapper = getCartService().updateVariantQtyInCart(addSingleVariantToCartRequest);


    if (validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse() != null) {
      updateCartResponse.setValidatedShoppingCartApiResponse(validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse());
      return updateCartResponse;
    } else {
      updateCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_ADD_TO_CART);
      return updateCartResponse;
    }

  }

  @POST
  @Path("/pack/update")
  public UpdateCartResponse updatePackToCart(AddPackToCartRequest addPackToCartRequest) {

    UpdateCartResponse updateCartResponse = new UpdateCartResponse();
    Long userId = getUserService().getLoggedInUserId();

    if (userId == null) {
      getLoginService().createAndLoginAsGuestUser();
      userId = getUserService().getLoggedInUserId();

      if (userId == null) {
        updateCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_ADD_TO_CART);
        return updateCartResponse;
      }
    }

    addPackToCartRequest.setUserId(userId);
    ValidatedShoppingCartARW validatedShoppingCartResponseWrapper = getCartService().updatePackQtyInCart(addPackToCartRequest);


    if (validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse() != null) {
      updateCartResponse.setValidatedShoppingCartApiResponse(validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse());
      return updateCartResponse;
    } else {
      updateCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_ADD_TO_CART);
      return updateCartResponse;
    }

  }

  @POST
  @Path("/variant/remove")
  public UpdateCartResponse removeVariantsFromCart(RemoveVariantsFromCartRequest removeVariantsFromCartRequest) {
    UpdateCartResponse updateCartResponse = new UpdateCartResponse();
    ValidatedShoppingCartARW validatedShoppingCartResponseWrapper = getCartService().removeVariantsFromCart(removeVariantsFromCartRequest);

    if (validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse() != null) {
      updateCartResponse.setValidatedShoppingCartApiResponse(validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse());
      return updateCartResponse;
    } else {
      updateCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_ADD_TO_CART);
      return updateCartResponse;
    }
  }

  @POST
  @Path("/pack/remove")
  public UpdateCartResponse removePacksFromCart(RemovePacksFromCartRequest removePacksFromCartRequest) {
    UpdateCartResponse updateCartResponse = new UpdateCartResponse();
    ValidatedShoppingCartARW validatedShoppingCartResponseWrapper = getCartService().removePacksFromCart(removePacksFromCartRequest);

    if (validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse() != null) {
      updateCartResponse.setValidatedShoppingCartApiResponse(validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse());
      return updateCartResponse;
    } else {
      updateCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_ADD_TO_CART);
      return updateCartResponse;
    }
  }

  @GET
  @Path("/applyOffer/{offId}")
  public UpdateCartResponse applyOfferOnCart(@PathParam(HKWebRequestConstants.OFFER_ID) Long offerId) {
    UpdateCartResponse updateCartResponse = new UpdateCartResponse();
    ValidatedShoppingCartARW validatedShoppingCartResponseWrapper = getCartService().applyOfferOnCart(offerId);

    if (validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse() != null) {
      updateCartResponse.setValidatedShoppingCartApiResponse(validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse());
      return updateCartResponse;
    } else {
      updateCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_APPLY_OFFER_ON_CART);
      return updateCartResponse;
    }
  }

  @GET
  @Path("/applyCoupon/{couponCode}")
  public UpdateCartResponse applyCouponOnCart(@PathParam(HKWebRequestConstants.COUPON_CODE) String couponCode) {
    UpdateCartResponse updateCartResponse = new UpdateCartResponse();
    ValidatedShoppingCartARW validatedShoppingCartResponseWrapper = getCartService().applyCouponOnCart(couponCode);

    if (validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse() != null) {
      updateCartResponse.setValidatedShoppingCartApiResponse(validatedShoppingCartResponseWrapper.getValidatedShoppingCartResponse());
      return updateCartResponse;
    } else {
      updateCartResponse.setException(true).addMessage(HKWebMessageConstants.UNABLE_TO_APPLY_OFFER_ON_CART);
      return updateCartResponse;
    }
  }

  @GET
  @Path("/summary")
  public CartSummaryResponse getCartSummary() {
    CartSummaryARW cartSummaryARW = getCartService().getCartSummaryForUser();

    CartSummaryResponse cartSummaryResponse = new CartSummaryResponse();
    if (cartSummaryARW != null && cartSummaryARW.getCartSummaryAR() != null) {
      CartSummaryAR cartSummaryAR = cartSummaryARW.getCartSummaryAR();
      cartSummaryResponse.setNoOfItems(cartSummaryAR.getItemsInCart());
      if (cartSummaryAR.getShoppingCartPricingDto() != null) {
        cartSummaryResponse.setCartValue(cartSummaryAR.getShoppingCartPricingDto().getTotalPayable());
      }

    }
    return cartSummaryResponse;
  }


  public CartService getCartService() {
    return cartService;
  }

  public UserService getUserService() {
    return userService;
  }

  public void setUserService(UserService userService) {
    this.userService = userService;
  }

  public LoginService getLoginService() {
    return loginService;
  }
}
