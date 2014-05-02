package com.hk.taglib;

import com.hk.api.response.cart.ShoppingCartVariant;
import com.hk.api.response.menu.MenuNode;
import com.hk.api.response.variant.compare.variant.VariantCompareBasicInfo;
import com.hk.api.response.variant.response.AbstractStoreVariantApiResponse;
import com.hk.util.analytics.HKAnalyticsUtils;
import com.hk.web.manager.LinkManager;

/**
 * @author Rimal
 */
public class Functions {

  public static String getVariantUrl(AbstractStoreVariantApiResponse abstractStoreVariantApiResponse) {
    return LinkManager.getVariantUrl(abstractStoreVariantApiResponse);
  }

  public static String getShoppingCartVariantUrl(ShoppingCartVariant shoppingCartVariant) {
    return LinkManager.getVariantUrl(shoppingCartVariant);
  }

  public static String getCompareVariantUrl(VariantCompareBasicInfo variantCompareBasicInfo) {
    return LinkManager.getVariantUrl(variantCompareBasicInfo);
  }

  public static MenuNode appendItrackerParamsForMenuNode(MenuNode menuNode, boolean expandedMenu) {
    HKAnalyticsUtils.appendItrackerParam(menuNode, expandedMenu);

    for (MenuNode child : menuNode.getChildNodes()) {
      appendItrackerParamsForMenuNode(child, expandedMenu);
    }
    return menuNode;
  }

  /* public static String getRedirectLinkForPCHItem(PageCategoryHeaderItem pageCategoryHeaderItem) {
    return LinkManager.getRedirectLinkForPCHItem(pageCategoryHeaderItem);
  }*/


  /*public static String getAutoCompleterItemUrl(AutoCompleterResponseItem autoCompleterResponseItem) {
    return LinkManager.getAutoCompleterItemUrl(autoCompleterResponseItem);
  }*/
}