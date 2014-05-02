package com.hk.common.constants;

import com.hk.pact.service.LoadPropertyService;
import com.hk.impl.service.ServiceLocatorFactory;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 2, 2013
 * Time: 8:23:39 PM
 */
public class EnvConstants {

  //TODO: needs some refactoring w.r.t db
  public static final String API_SERVER_URL = "API_SERVER_URL";
  public static final String HK_PAY_SERVER_URL = "HK_PAY_SERVER_URL";
  public static final String HK_PAY_RETURN_URL_PREFIX = "HK_PAY_RETURN_URL_PREFIX";
  public static final String HKR_SERVER_URL = "HKR_SERVER_URL";


  public static final String HK_PAY_PAYMENT_URL = "http://" + "securepay.healthkart.com" + "/gateway/request";
  public static final String HK_PAY_RETURN_URL_SUFFIX = "/order/payment/PaymentReceive.action";

  public static final String DEV_ENVIRONMENT = "dev";
  public static final String PROD_ENVIRONMENT = "prod";

  public static String getHkPayReturnUrl() {
    StringBuilder hkPayReturnUrlBuilder = new StringBuilder("http://");
    LoadPropertyService loadPropertyService = ServiceLocatorFactory.getService(LoadPropertyService.class);
    String hkPayReturUrlPrefix = (String) loadPropertyService.getProperty(HK_PAY_RETURN_URL_PREFIX);
    hkPayReturnUrlBuilder.append(hkPayReturUrlPrefix).append(HK_PAY_RETURN_URL_SUFFIX);

    return hkPayReturnUrlBuilder.toString();
  }

  public static boolean isDevEnv(){
    LoadPropertyService loadPropertyService = ServiceLocatorFactory.getService(LoadPropertyService.class);
     String env = (String)loadPropertyService.getProperty("project.env");
     return (env.equals(DEV_ENVIRONMENT));
  }

  public static boolean isProdEnv(){
    LoadPropertyService loadPropertyService = ServiceLocatorFactory.getService(LoadPropertyService.class);
    String env = (String)loadPropertyService.getProperty("project.env");
    return (env.equals(PROD_ENVIRONMENT));
  }
}
