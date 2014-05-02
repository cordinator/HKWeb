package com.hk.web.manager;

import com.hk.api.response.autocompleter.response.AutoCompleterResponseItem;
import com.hk.api.response.autocompleter.response.AutoCompleterVariantResponseItem;
import com.hk.api.response.brand.Brand;
import com.hk.api.response.cart.ShoppingCartVariant;
import com.hk.api.response.catalog.browse.CategoryBrowseNode;
import com.hk.api.response.catalog.filter.BrowseCategoryListing;
import com.hk.api.response.catalog.results.CatalogStoreVariant;
import com.hk.api.response.menu.MenuNode;
import com.hk.api.response.variant.compare.variant.VariantCompareBasicInfo;
import com.hk.api.response.variant.response.AbstractStoreVariantApiResponse;
import com.hk.constants.AppConstants;
import com.hk.pact.service.ac.AutoCompleterService;
import com.hk.pact.service.ui.PageService;
import com.hk.web.action.beta.brand.BrandListingAction;
import com.hk.web.action.beta.home.HomeAction;
import com.hk.web.filter.WebContext;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.util.ssl.SslUtil;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import java.util.Locale;

@Component
public class LinkManager {

//    @Value("#{hkEnvProps['" + Keys.Env.userEmailLinksRedirected + "']}")

  private static String userEmailLinksRedirected = "http://beta.healthkart.com";
  private static final String NAV_KEY = "navKey";
  private static final String VARIANT_ACTION_ID = "/sv";

  public String getAuthRedirectUrl() {
    RedirectResolution redirectResolution = new RedirectResolution("/auth/Login.action");
    return getUrlFromResolution(redirectResolution);
  }


  public static String getGenericLandingPageUrl(String urlFragment, String navKey) {
    if (StringUtils.isBlank(urlFragment) && StringUtils.isBlank(navKey)) {
      return "#";
    }

    StringBuilder url = new StringBuilder(urlFragment);
    url.append("?" + NAV_KEY + "=").append(navKey);

    RedirectResolution redirectResolution = new RedirectResolution(url.toString());

    return getUrlFromResolution(redirectResolution);
  }

  public static String getMenuNodeUrl(MenuNode menuNode) {
    if (StringUtils.isNotBlank(menuNode.getNavKey())) {
      String navKey = menuNode.getNavKey();
      if (navKey.contains(PageService.BRAND_LP_IDENTIFIER)) {
        return getBrandPageUrl(navKey, menuNode.getUrlFragment());
      }
      return getGenericLandingPageUrl(menuNode.getUrlFragment(), menuNode.getNavKey());
    }

    return "#";
/*

    StringBuilder menuNodeUrl = new StringBuilder(menuNode.getUrlFragment());
    menuNodeUrl.append("?" + NAV_KEY + "=").append(menuNode.getNavKey());

    RedirectResolution redirectResolution = new RedirectResolution(menuNodeUrl.toString());

    return getUrlFromResolution(redirectResolution);
*/


  }

  public static String getCategoryBrowseNodeUrl(CategoryBrowseNode categoryBrowseNode) {

    /* StringBuilder categoryBrowseNodeUrl = new StringBuilder(categoryBrowseNode.getUrlFragment());
   categoryBrowseNodeUrl.append("?" + NAV_KEY + "=").append(categoryBrowseNode.getNavKey());

   RedirectResolution redirectResolution = new RedirectResolution(categoryBrowseNodeUrl.toString());

   return getUrlFromResolution(redirectResolution);*/

    return getGenericLandingPageUrl(categoryBrowseNode.getUrlFragment(), categoryBrowseNode.getNavKey());


  }

  public static String getPCHItemUrl(String urlFragment, String navKey) {

    /* StringBuilder pchItemUrl = new StringBuilder(pageCategoryHeaderItem.getUrlFragment());
   pchItemUrl.append("?" + NAV_KEY + "=").append(pageCategoryHeaderItem.getNavKey());

   RedirectResolution redirectResolution = new RedirectResolution(pchItemUrl.toString());

   return getUrlFromResolution(redirectResolution);*/

    if (StringUtils.isNotBlank(navKey) && navKey.contains(PageService.BRAND_LP_IDENTIFIER)) {
      return getBrandPageUrl(navKey, urlFragment);
    }


    return getGenericLandingPageUrl(urlFragment, navKey);
  }

  public static String getAutoCompleterItemUrl(AutoCompleterResponseItem autoCompleterResponseItem) {

    if (autoCompleterResponseItem instanceof AutoCompleterVariantResponseItem) {
      AutoCompleterVariantResponseItem autoCompleterVariantResponseItem = (AutoCompleterVariantResponseItem) autoCompleterResponseItem;
      StringBuilder variantUrl = new StringBuilder(VARIANT_ACTION_ID);
//      StringBuilder variantUrl = new StringBuilder("/variant/");
      variantUrl.append(autoCompleterVariantResponseItem.getUrlFragment());
      variantUrl.append("?" + NAV_KEY + "=").append(autoCompleterVariantResponseItem.getNavKey());

      RedirectResolution redirectResolution = new RedirectResolution(variantUrl.toString());

      return getUrlFromResolution(redirectResolution);
    } else if (autoCompleterResponseItem.getType() == AutoCompleterService.CAT_RESULT_TYPE) {
      /* StringBuilder autoCompleterItemUrl = new StringBuilder(autoCompleterResponseItem.getUrlFragment());
     autoCompleterItemUrl.append("?" + NAV_KEY + "=").append(autoCompleterResponseItem.getNavKey());

     RedirectResolution redirectResolution = new RedirectResolution(autoCompleterItemUrl.toString());

     return getUrlFromResolution(redirectResolution);*/

      return getGenericLandingPageUrl(autoCompleterResponseItem.getUrlFragment(), autoCompleterResponseItem.getNavKey());


    } else if (autoCompleterResponseItem.getType() == AutoCompleterService.BRAND_CAT_RESULT_TYPE) {
      StringBuilder autoCompleterItemUrl = new StringBuilder(autoCompleterResponseItem.getUrlFragment());
      String[] values = autoCompleterResponseItem.getValue().split("#");
      Long brandId = Long.parseLong(values[0]);
      autoCompleterItemUrl.append("?" + NAV_KEY + "=").append(autoCompleterResponseItem.getNavKey()).append("&brands=").append(brandId);
      RedirectResolution redirectResolution = new RedirectResolution(autoCompleterItemUrl.toString());

      return getUrlFromResolution(redirectResolution);

    } else if (autoCompleterResponseItem.getType() == AutoCompleterService.BRAND_RESULT_TYPE) {
      StringBuilder brandUrl = new StringBuilder("/brand");
      brandUrl.append(autoCompleterResponseItem.getUrlFragment());
      brandUrl.append("?" + NAV_KEY + "=").append(autoCompleterResponseItem.getNavKey());

      RedirectResolution redirectResolution = new RedirectResolution(brandUrl.toString());

      return getUrlFromResolution(redirectResolution);


    } else {
      return "#";
    }


  }


  //-------------------------------------------------- variant url link builders start-------------------------------------------------------------------------------------


  public static String getVariantUrl(AbstractStoreVariantApiResponse abstractStoreVariantApiResponse) {
    StringBuilder variantUrl = new StringBuilder(VARIANT_ACTION_ID);
//    StringBuilder variantUrl = new StringBuilder("/variant/");
    variantUrl.append(abstractStoreVariantApiResponse.getUrlFragment());
    variantUrl.append("?" + NAV_KEY + "=").append(abstractStoreVariantApiResponse.getNavKey());

    RedirectResolution redirectResolution = new RedirectResolution(variantUrl.toString());

    return getUrlFromResolution(redirectResolution);
  }


  public static String getVariantUrl(ShoppingCartVariant shoppingCartVariant) {
    return getVariantLandingPageUrl(shoppingCartVariant.getNavKey(), shoppingCartVariant.getUrlFragment());
  }


  public static String getVariantUrl(CatalogStoreVariant catalogStoreVariant) {
    /* StringBuilder variantUrl = new StringBuilder(VARIANT_ACTION_ID);
//    StringBuilder variantUrl = new StringBuilder("/variant/");
   variantUrl.append(catalogStoreVariant.getUrlFragment());
   variantUrl.append("?" + NAV_KEY + "=").append(catalogStoreVariant.getNavKey());

   RedirectResolution redirectResolution = new RedirectResolution(variantUrl.toString());

   return getUrlFromResolution(redirectResolution);*/

    return getVariantLandingPageUrl(catalogStoreVariant.getNavKey(), catalogStoreVariant.getUrlFragment());

  }

  public static String getVariantUrl(VariantCompareBasicInfo variantCompareBasicInfo) {
    /* StringBuilder variantUrl = new StringBuilder(VARIANT_ACTION_ID);
//    StringBuilder variantUrl = new StringBuilder("/variant/");
   variantUrl.append(variantCompareBasicInfo.getUrlFragment());
   variantUrl.append("?" + NAV_KEY + "=").append(variantCompareBasicInfo.getNavKey());

   RedirectResolution redirectResolution = new RedirectResolution(variantUrl.toString());

   return getUrlFromResolution(redirectResolution);*/

    return getVariantLandingPageUrl(variantCompareBasicInfo.getNavKey(), variantCompareBasicInfo.getUrlFragment());
  }

  public static String getVariantLandingPageUrl(String navKey, String urlFragment) {
    if (StringUtils.isNotBlank(urlFragment)) {
      StringBuilder variantUrl = new StringBuilder(VARIANT_ACTION_ID);
      variantUrl.append(urlFragment);
      if (StringUtils.isNotBlank(navKey)) {
        variantUrl.append("?" + NAV_KEY + "=").append(navKey);
      }

      RedirectResolution redirectResolution = new RedirectResolution(variantUrl.toString());
      return getUrlFromResolution(redirectResolution);
    }
    return null;
  }


  //-------------------------------------------------- variant url link builders end-------------------------------------------------------------------------------------


  public static String getHomePageUrl() {
    RedirectResolution redirectResolution = new RedirectResolution(HomeAction.class);
    return "/";
    //return getUrlFromResolution(redirectResolution);
  }

  public static String getBrandListingUrl() {
    RedirectResolution redirectResolution = new RedirectResolution(BrandListingAction.class);

    return getUrlFromResolution(redirectResolution);
  }


  //-------------------------------------brand urls start-------------------------------------------------------------------

  public static String getBrandCategoryPageUrl(BrowseCategoryListing browseCategoryListing, Long brandId) {
    StringBuilder brandCatPageUrl = new StringBuilder(browseCategoryListing.getUrlFragment());

    brandCatPageUrl.append("?" + NAV_KEY + "=").append(browseCategoryListing.getNavKey());
    if (brandId != null) {
      brandCatPageUrl.append("&brands=").append(brandId);
    }
    RedirectResolution redirectResolution = new RedirectResolution(brandCatPageUrl.toString());

    return getUrlFromResolution(redirectResolution);
  }


  public static String getBrandCategoryPageUrl(BrowseCategoryListing browseCategoryListing) {
    return getBrandCategoryPageUrl(browseCategoryListing, null);
  }

  public static String getBrandPageUrl(Brand brand) {
    return getBrandPageUrl(brand.getNavKey(), brand.getUrlFragment());
  }


  public static String getBrandPageUrl(String brandNavKey, String brandUrlFragment) {
    StringBuilder brandPageUrl = new StringBuilder("/brand");

    brandPageUrl.append(brandUrlFragment);
    brandPageUrl.append("?" + NAV_KEY + "=").append(brandNavKey);

    RedirectResolution redirectResolution = new RedirectResolution(brandPageUrl.toString());

    return getUrlFromResolution(redirectResolution);
  }

//-------------------------------------brand urls end-------------------------------------------------------------------  


  public String getUserActivationLink(String activationLink) {
    RedirectResolution redirectResolution = new RedirectResolution("/auth/ActivateUser.action").addParameter("actLnk", activationLink);
    return userEmailLinksRedirected + redirectResolution.getUrl(Locale.getDefault());
  }

  public String getForgotPasswordLink(String activationLink) {
    RedirectResolution redirectResolution = new RedirectResolution("/auth/ForgotPassword.action?rstPwd=").addParameter("actLnk", activationLink);
    return userEmailLinksRedirected + redirectResolution.getUrl(Locale.getDefault());
  }

  /*
  * This method generated a full URL from the redirect resolution
  */

  private static String getUrlFromResolution(RedirectResolution redirectResolution) {
    String url = redirectResolution.getUrl(Locale.getDefault());
    if (WebContext.getRequest() != null && WebContext.getResponse() != null) {
      return SslUtil.encodeUrlFullForced(WebContext.getRequest(), WebContext.getResponse(), url, null);
    }
    String contextPath = AppConstants.contextPath;
    return SslUtil.encodeUrlFullForced(WebContext.getRequest(), WebContext.getResponse(), url, contextPath);
  }


  /*public static RedirectResolution getRedirectResolutionForCategoryPage(Long categoryId) {
    return new RedirectResolution(CategoryAction.class)
        .addParameter("pageTypeValue", categoryId.toString());

  }

  public static String getCategoryPageUrl(Long categoryId) {
    return getUrlFromResolution(getRedirectResolutionForCategoryPage(categoryId));
  }*/


  /* public static RedirectResolution getRedirectResolutionForMenuLandingPage(String navKey) {
    return new RedirectResolution(CatalogActionNew.class).addParameter("navKey", navKey);
  }

  public static String getMenuLandingPageUrl(String navKey) {
    return getUrlFromResolution(getRedirectResolutionForMenuLandingPage(navKey));
  }*/


  /* public static String getRedirectLinkForPCHItem(PageCategoryHeaderItem pageCategoryHeaderItem) {
    Long pageTypeId = pageCategoryHeaderItem.getPageTypeId();
    if (PageTypeEnum.CATEGORY.getId().equals(pageTypeId)) {

      Long categoryId = Long.parseLong(pageCategoryHeaderItem.getPageTypeValue());
      return getCategoryPageUrl(categoryId);

    }


    //TODO: fix
    else if (PageTypeEnum.MENU_LANDING.getId().equals(pageTypeId)) {

      Long menuNodeId = Long.parseLong(pageCategoryHeaderItem.getPageTypeValue());
      return getMenuLandingPageUrl(menuNodeId);


    } else if (PageTypeEnum.SUB_CAT.getId().equals(pageTypeId)) {
      String pageTypeVal = pageCategoryHeaderItem.getPageTypeValue();
      String[] pageTypeValArr = pageTypeVal.split("$");

      if (2 != pageTypeValArr.length) {
        return getHomePageUrl();
      }

      String catPrefix = pageTypeValArr[0];
      Long categoryId = Long.parseLong(pageTypeValArr[1]);

      return getSubCatPageUrl(categoryId, catPrefix);

    } else {
      return getHomePageUrl();
    }

    return null;
  }*/


//    public String getTermsAndConditionsUrl() {
//        return "terms.jsp";
//    }
//
//    public String getCodGatewayUrl() {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/payment/CodGatewaySendReceive.action");
//        return getUrlFromResolution(redirectResolution);
//    }
//
//    public String getPaymentModesUrl() {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/payment/PaymentMode.action");
//        return getUrlFromResolution(redirectResolution);
//    }
//
//    public String getSelectAddressUrl() {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/user/SelectAddress.action");
//        return getUrlFromResolution(redirectResolution);
//    }
//
//    public String getOrderTrackLink(String trackingId, Long courierId, ShippingOrder shippingOrder) {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/order/TrackCourier.action").addParameter("trackingId", trackingId).addParameter("courierId",
//                courierId).addParameter("shippingOrder", shippingOrder);
//        return userEmailLinksRedirected + redirectResolution.getUrl(Locale.getDefault());
//    }
//
//    public String getOrderInvoiceLink(Order order) {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/accounting/SOInvoice.action").addParameter("order", order.getId());
//        return getUrlFromResolution(redirectResolution);
//    }
//
//    public String getShippingOrderInvoiceLink(ShippingOrder shippingOrder) {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/accounting/SOInvoice.action").addParameter("shippingOrder", shippingOrder.getId());
//        return userEmailLinksRedirected + redirectResolution.getUrl(Locale.getDefault());
//    }
//
//    public String getRetailInvoiceLink(AccountingInvoice accountingInvoice) {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/accounting/AccountingInvoice.action").addParameter("accountingInvoice", accountingInvoice.getId());
//        return getUrlFromResolution(redirectResolution);
//    }
//
//    public String getCartUrl() {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/cart/Cart.action");
//        return getUrlFromResolution(redirectResolution);
//    }
//
//    public String getReviewPageLink(HashMap params) {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/catalog/product/ProductReview.action").addParameters(params);
//        return userEmailLinksRedirected + redirectResolution.getUrl(Locale.getDefault());
//    }
//
//    public String getUnsubscribeLink(User user) {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/email/HKUnsubscribeEmail.action").addParameter("unsubscribeToken", user.getUnsubscribeToken());
//        return userEmailLinksRedirected + redirectResolution.getUrl(Locale.getDefault());
//    }
//
//    public String getUserActivationLink(TempToken token) {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/user/VerifyUser.action").addParameter("token", token.getToken());
//        return userEmailLinksRedirected + redirectResolution.getUrl(Locale.getDefault());
//    }
//
//    public String getReferralSignupLink(User user) {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/referral/ReferralSignup.action").addParameter("userHash", user.getUserHash());
//        return userEmailLinksRedirected + redirectResolution.getUrl(Locale.getDefault());
//    }
//
//    public String getReferralProgramUrl() {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/referral/ReferralProgram.action");
//        return userEmailLinksRedirected + redirectResolution.getUrl(Locale.getDefault());
//    }
//
//    public String getEmailUnsubscribeLink(EmailRecepient emailRecepient) {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/email/UnsubscribeEmail.action").addParameter("unsubscribeToken", emailRecepient.getUnsubscribeToken());
//        return userEmailLinksRedirected + redirectResolution.getUrl(Locale.getDefault());
//    }
//
//    public String getViewTicketUrl(Ticket ticket) {
//        RedirectResolution redirectResolution = new RedirectResolution("/admin/ticket/ViewAndEditTicket.action").addParameter("ticket", ticket.getId());
//        return getUrlFromResolution(redirectResolution);
//    }
//
//    public String getResetPasswordLink(TempToken token) {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/user/PasswordReset.action").addParameter("token", token.getToken());
//        return userEmailLinksRedirected + redirectResolution.getUrl(Locale.getDefault());
//    }
//
//    public String getSSOResetPasswordLink(TempToken token) {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/user/SSOPasswordReset.action").addParameter("token", token.getToken());
//        return userEmailLinksRedirected + redirectResolution.getUrl(Locale.getDefault());
//    }
//
//    public String getCitrusPaymentNetBankingGatewayUrl() {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/payment/gateway/CitrusNetbankingSendReceive.action");
//        return getUrlFromResolution(redirectResolution);
//    }
//
//    public String getCitrusPaymentGatewayUrl() {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/payment/gateway/CitrusGatewaySendReceive.action");
//        return getUrlFromResolution(redirectResolution);
//    }
//
//    public String getIciciPaymentGatewayUrl() {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/payment/gateway/IciciGatewaySendReceive.action");
//        return getUrlFromResolution(redirectResolution);
//    }
//
//    public String getCitrusPaymentCreditDebitGatewayUrl() {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/payment/gateway/CitrusCreditDebitSendReceive.action");
//        return getUrlFromResolution(redirectResolution);
//    }
//
//    public String getEbsPaymentGatewayReturnUrl() {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/payment/gateway/EbsSendReceive.action");
//        return getUrlFromResolution(redirectResolution);
//    }
//
//    public String getCodConverterLink(Order order) {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/payment/RegisterOnlinePayment.action").addParameter("order", order);
//        return getUrlFromResolution(redirectResolution);
//    }
//
//    public String getPayPalPaymentGatewayReturnUrl() {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/payment/gateway/PayPalCreditDebitSendReceive.action");
//        return getUrlFromResolution(redirectResolution);
//    }
//
//
//    public String getPayPalPaymentGatewayCancelUrl() {
//        RedirectResolution redirectResolution = new RedirectResolution("/core/payment/PaymentMode.action");
//        return getUrlFromResolution(redirectResolution);
//    }
//
//
//    public String getRelativeProductURL(Product product, Long productReferrerId) {
//        /* String productURL = null;
//                String productSlug = product.getSlug();
//                String productId = product.getId();
//                // commented to stop internal product tagging
//                // productURL = "/product/" + productSlug + "/" + productId + "?productReferrerId=" + productReferrerId;
//                //productURL = "/product/" + productSlug + "/" + productId;
//
//                 * RedirectResolution redirectResolution = new RedirectResolution(ProductAction.class). addParameter("referrer",
//                 * referrerId). addParameter("productId", productId).addParameter("productSlug", productSlug); return
//                 * getUrlFromResolution(redirectResolution);
//
//
//                RedirectResolution redirectResolution = new RedirectResolution("/core/catalog/product/Product.action").addParameter("productId", productId).addParameter("productSlug",
//                        productSlug);
//                return getUrlFromResolution(redirectResolution);
//
//                //return productURL;
//        */
//        String productURL = null;
//        String productSlug = product.getSlug();
//        String productId = product.getId();
//        productURL = "/product/" + productSlug + "/" + productId;
//
//        if (productReferrerId != null && productReferrerId != 0) {
//            productURL = productURL.concat("?productReferrerId=" + productReferrerId);
//        }
//
//        return productURL;
//
//    }
//
//    public String getProductURL(Product product, Long productReferrerId) {
//
//        String productURL = null;
//        String productSlug = product.getSlug();
//        String productId = product.getId();
//        productURL = "/product/" + productSlug + "/" + productId;
//
//        RedirectResolution redirectResolution = new RedirectResolution(productURL);
//        if (productReferrerId != null && productReferrerId != 0) {
//            redirectResolution.addParameter("productReferrerId", productReferrerId);
//        }
//
//        return getUrlFromResolution(redirectResolution);
//
//        /*
//         * RedirectResolution redirectResolution = new RedirectResolution(ProductAction.class). addParameter("referrer",
//         * referrerId). addParameter("productId", productId).addParameter("productSlug", productSlug); return
//         * getUrlFromResolution(redirectResolution);
//         */
//
//    }
//
//    public String getFeedbackPage() {
//        RedirectResolution redirectResolution = new RedirectResolution("/feedback");
//        return userEmailLinksRedirected + redirectResolution.getUrl(Locale.getDefault());
//    }
//
//    public String getTryOnImageURL(ProductVariant productVariant) {
//
//        String tryOnURL = "/makeover/tryOn.jsp";
//
//        RedirectResolution redirectResolution = new RedirectResolution(tryOnURL);
//        if (productVariant != null) {
//            redirectResolution.addParameter("productid", productVariant);
////            redirectResolution.addParameter("type", productVariant.getProduct().getSecondaryCategory());
//        }
//
//        return getUrlFromResolution(redirectResolution);
//    }

}
