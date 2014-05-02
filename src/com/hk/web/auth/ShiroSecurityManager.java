package com.hk.web.auth;

import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.springframework.beans.factory.annotation.Autowired;


/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 24, 2013
 * Time: 3:46:58 PM
 */
public class ShiroSecurityManager extends DefaultWebSecurityManager {

  private RemoteUserRealm remoteUserRealm;

  private static final String rememberMeCookieName = "SSID";

  @Autowired
  public ShiroSecurityManager(RemoteUserRealm remoteUserRealm) {
    this.remoteUserRealm = remoteUserRealm;

    setRealm(remoteUserRealm);
    CookieRememberMeManager rememberMeManager = new CookieRememberMeManager();
    SimpleCookie cookie = new SimpleCookie();
    cookie.setName(rememberMeCookieName);
    cookie.setHttpOnly(true);
    cookie.setMaxAge(3600 * 24 * 30);
    cookie.setPath("/");
    rememberMeManager.setCookie(cookie);
    setRememberMeManager(rememberMeManager);
//    setSessionMode(DefaultWebSecurityManager.HTTP_SESSION_MODE);
//    setRememberMeCookieMaxAge(3600 * 24 * 30); // 30 days
    setCacheManager(null);
  }

  public RemoteUserRealm getRemoteUserRealm() {
    return remoteUserRealm;
  }

 /* protected SubjectContext createSubjectContext() {
    return new DefaultWebSubjectContext();
  }*/
}
