package com.hk.web.stripes;

import com.hk.constants.AppConstants;
import com.hk.constants.HealthkartWebConstants;
import com.hk.web.filter.WebContext;
import org.apache.commons.lang.StringUtils;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import java.io.File;

/**
 * @author Rimal
 */
public class HKResolutionHelper {

  public static final String FALLBACK_PATH = HKJspFileConstants.HOME_JSP;


  public static boolean shouldGetMobileJsp() {
    String viewPref = WebContext.getRequest().getHeader(HealthkartWebConstants.SITE_MODE_PREF_HEADER);
//    System.out.println("viewPref=" + viewPref);
    if (StringUtils.equals(viewPref, HealthkartWebConstants.SITE_MODE_PREF_HEADER_DESKTOP_VALUE)) {
      setDesktopCookie();
      return false;
    } else if (StringUtils.equals(viewPref, HealthkartWebConstants.SITE_MODE_PREF_HEADER_MOBILE_VALUE)) {
      setMobileCookie();
      return true;
    }

    //Code will come here when user is not explicitly mentioning his preference
    boolean mobile = false;
    String siteMode = WebContext.getRequest().getHeader(HealthkartWebConstants.SITE_MODE_HEADER);
//    System.out.println("viewPref=" + viewPref + "; siteMode=" + siteMode);
    if (StringUtils.equals(siteMode, HealthkartWebConstants.SITE_MODE_HEADER_MOB_VALUE) && !isDeskViewCookie()) {
      mobile = true;
    } else if (StringUtils.equals(siteMode, HealthkartWebConstants.SITE_MODE_HEADER_MOB_VALUE) && isDeskViewCookie()) {
      mobile = false;
    } else if (StringUtils.equals(siteMode, HealthkartWebConstants.SITE_MODE_HEADER_MOB_VALUE) || isMobViewCookie()) {
      mobile = true;
    }
//    System.out.println("viewPref=" + viewPref + "; siteMode=" + siteMode + "; isDeskViewCookie=" + isDeskViewCookie() + "; isMobViewCookie=" + isMobViewCookie() + "; shouldGetMobileJsp=" + mobile);
    return mobile;
  }

  public static void setDesktopCookie() {
    Cookie siteModeCookie = new Cookie(HealthkartWebConstants.SITE_MODE_COOKIE_NAME, HealthkartWebConstants.SITE_MODE_COOKIE_DESKTOP_VALUE);
    siteModeCookie.setPath("/");
    siteModeCookie.setMaxAge(15 * 24 * 3600);
    WebContext.getResponse().addCookie(siteModeCookie);
  }

  public static void setMobileCookie() {
    Cookie siteModeCookie = new Cookie(HealthkartWebConstants.SITE_MODE_COOKIE_NAME, HealthkartWebConstants.SITE_MODE_COOKIE_MOBILE_VALUE);
    siteModeCookie.setPath("/");
    siteModeCookie.setMaxAge(15 * 24 * 3600);
    WebContext.getResponse().addCookie(siteModeCookie);
  }

  public static boolean isMobViewCookie() {
    Cookie siteModeCookie = WebUtils.getCookie(WebContext.getRequest(), HealthkartWebConstants.SITE_MODE_COOKIE_NAME);
    if (siteModeCookie != null && siteModeCookie.getValue().equalsIgnoreCase(HealthkartWebConstants.SITE_MODE_COOKIE_MOBILE_VALUE))
      return true;

    return false;
  }

  public static boolean isDeskViewCookie() {
    Cookie siteModeCookie = WebUtils.getCookie(WebContext.getRequest(), HealthkartWebConstants.SITE_MODE_COOKIE_NAME);
    if (siteModeCookie != null && siteModeCookie.getValue().equalsIgnoreCase(HealthkartWebConstants.SITE_MODE_COOKIE_DESKTOP_VALUE))
      return true;

    return false;
  }

  public static boolean isValidPath(String path) {
    boolean valid = true;

    String absolutePath = path;
    if (path.startsWith("/")) {
      absolutePath = AppConstants.appBasePath + path;
    }
    File file = new File(absolutePath);
    valid = file.exists();
//    System.out.println("valid = " + valid);
    return valid;
  }
}
