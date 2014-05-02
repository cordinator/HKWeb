package com.hk.common.constants;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 2, 2013
 * Time: 5:31:34 PM
 */
public class ServiceEndPoints {

  public static final String URI_SEPARATOR = "/";

  private static final String END_POINT_PREFIX = "/api";

  private static final String PAGE = END_POINT_PREFIX.concat("/page");
  public static final String PAGE_DATA = PAGE.concat("/data/");
  public static final String PAGE_SUB_CAT_DATA = PAGE.concat("/subCat/data/");
  /*public static final String CATALOG_PAGE = PAGE.concat("/catalog/");
  public static final String CATEGORY_PAGE = PAGE.concat("/categoryPage/");*/

  public static final String CATEGORY = END_POINT_PREFIX.concat("/category");
//  public static final String PRIMARY_CATEGORY = CATEGORY.concat("/primary/");

  public static final String REVIEW_SERVICE_END_POINT = END_POINT_PREFIX.concat("/variant/review/");
  public static final String ADDRESS_SERVICE_END_POINT = END_POINT_PREFIX.concat("/user/address/");

  public static final String AUTO_COMPLETER = END_POINT_PREFIX.concat("/ac/comp/");
  public static final String CATALOG_RESULTS = END_POINT_PREFIX.concat("/catalog/results/");
  public static final String SEARCH_RESULTS = END_POINT_PREFIX.concat("/search/results/");

  public static final String STORE_VARIANT = END_POINT_PREFIX.concat("/variant/");
  public static final String STORE_VARIANT_COMPARE = END_POINT_PREFIX.concat("/variant/compare/");
  public static final String STORE_MENU = END_POINT_PREFIX.concat("/menu/");
  public static final String USER = END_POINT_PREFIX.concat("/user");
  public static final String USER_ACTIVATION = END_POINT_PREFIX.concat("/user/activation");
  public static final String USER_ACCOUNT = END_POINT_PREFIX.concat("/user/account");
  public static final String USER_TOKEN = END_POINT_PREFIX.concat("/user/token");
  public static final String CART = END_POINT_PREFIX.concat("/cart");
  public static final String TRAFFIC = END_POINT_PREFIX.concat("/traffic");
  public static final String STORE_VARIANT_BROWSE = END_POINT_PREFIX.concat("/variant/browse/");

  public static final String LOCATION = END_POINT_PREFIX.concat("/location/");

  public static final String PAYMENT = END_POINT_PREFIX.concat("/payment/");

  public static final String PACK = END_POINT_PREFIX.concat("/pack/");
  public static final String ORDER = END_POINT_PREFIX.concat("/order/");

  public static final String PAYMENT_MODES = "/rest/api/payment/createMap/";

  public static final String PAYMENT_REQUEST = "payment/skl/sss/eeq?proceed=";

  public static final String BRAND = END_POINT_PREFIX.concat("/brand/");

  public static final String REWARD = END_POINT_PREFIX.concat("/reward/");

  public static final String NOTIFY = END_POINT_PREFIX.concat("/notify/");

  public static final String SPEAK_TO = END_POINT_PREFIX.concat("/speakTo/");

  public static final String SUBSCRIBE = END_POINT_PREFIX.concat("/subscribe/");

  public static final String URL = END_POINT_PREFIX.concat("/url/");

  public static final String PINCODE = END_POINT_PREFIX.concat("/pincode/");
}
