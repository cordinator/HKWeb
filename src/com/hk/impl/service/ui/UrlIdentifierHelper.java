package com.hk.impl.service.ui;

import com.hk.pact.service.ui.PageService;

/**
 * @author Rimal
 */
public class UrlIdentifierHelper {

  public static String getMenuNodeIdFromNavKey(String navKey) {
    navKey = navKey.replaceAll(PageService.CATALOG_LP_IDENTIFIER, "");
    return navKey;
  }

  public static String getCategoryPrefixFromNavKey(String navKey) {
    navKey = navKey.replaceAll(PageService.CATEGORY_LP_IDENTIFIER, "");
    return navKey;
  }

  public static String getBrandIdFromNavKey(String navKey) {
    navKey = navKey.replaceAll(PageService.BRAND_LP_IDENTIFIER, "");
    return navKey;
  }

  public static String getSubCategoryPrefixFromNavKey(String navKey) {
    navKey = navKey.replaceAll(PageService.SUB_CATEGORY_LP_IDENTIFIER, "");
    return navKey;
  }

  public static String normalizeString(String stringToBeNormalized) {
    String normalizedFragment = stringToBeNormalized;
    normalizedFragment = normalizedFragment.toLowerCase();
    normalizedFragment = normalizedFragment.replaceAll(",", "");
    normalizedFragment = normalizedFragment.replaceAll("&", "n");
    normalizedFragment = normalizedFragment.replaceAll("\\?", "");
    normalizedFragment = normalizedFragment.replaceAll("\\s", "-");
    normalizedFragment = normalizedFragment.replaceAll("%", "");
    normalizedFragment = normalizedFragment.replaceAll("'", "");
    normalizedFragment = normalizedFragment.replaceAll("/", "-");
    normalizedFragment = normalizedFragment.replaceAll("[^\\x00-\\x7f]", "");

    return normalizedFragment;
  }
}
