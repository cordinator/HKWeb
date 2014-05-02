package com.hk.web.action.test;

import com.hk.constants.HealthkartWebConstants;
import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.ForwardResolution;
import com.hk.web.stripes.HKJspFileConstants;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.stereotype.Component;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;

/**
 * @author Rimal
 */
@Component
public class HelloAction extends BaseAction {

  @DefaultHandler
  public Resolution pre() {
    return new ForwardResolution(HKJspFileConstants.HELLO_JSP);
//    return new HKForwardResolution(HKJspFileConstants.HELLO_JSP);
  }

  public Resolution setDesktopMode() {
    Cookie siteModeCookie = WebUtils.getCookie(getContext().getRequest(), HealthkartWebConstants.SITE_MODE_COOKIE_NAME);
    if (siteModeCookie == null) {
      siteModeCookie = new Cookie(HealthkartWebConstants.SITE_MODE_COOKIE_NAME, HealthkartWebConstants.SITE_MODE_COOKIE_DESKTOP_VALUE);
    } else {
      siteModeCookie.setValue(HealthkartWebConstants.SITE_MODE_COOKIE_DESKTOP_VALUE);
    }
    getContext().getResponse().addCookie(siteModeCookie);

    return new RedirectResolution(HelloAction.class);
  }

  public Resolution setMobileMode() {
    Cookie siteModeCookie = WebUtils.getCookie(getContext().getRequest(), HealthkartWebConstants.SITE_MODE_COOKIE_NAME);
    if (siteModeCookie == null) {
      siteModeCookie = new Cookie(HealthkartWebConstants.SITE_MODE_COOKIE_NAME, HealthkartWebConstants.SITE_MODE_COOKIE_MOBILE_VALUE);
    } else {
      siteModeCookie.setValue(HealthkartWebConstants.SITE_MODE_COOKIE_MOBILE_VALUE);
    }
    getContext().getResponse().addCookie(siteModeCookie);

    return new RedirectResolution(HelloAction.class);
  }
}
