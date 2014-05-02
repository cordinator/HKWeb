package com.hk.common.http;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Rimal
 */
public class HKSessionHelper {

  public static String getSessionIdentifierId(HttpServletRequest httpServletRequest) {
    HttpSession httpSession = httpServletRequest.getSession(false);

    if (httpSession == null) {
      httpSession = httpServletRequest.getSession(true);
    }
    return httpSession.getId();
  }
}
