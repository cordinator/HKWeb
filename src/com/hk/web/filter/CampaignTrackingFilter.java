package com.hk.web.filter;

import com.hk.impl.service.ServiceLocatorFactory;
import com.hk.pact.service.traffic.TrafficTrackingService;
import com.hk.web.constants.HealthkartConstants;
import com.hk.web.constants.HttpRequestAndSessionConstants;
import com.hk.web.filter.traffic.TrafficReqParamBuilder;
import com.hk.web.filter.traffic.TrafficRequestParams;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Nov 20, 2013
 * Time: 6:31:03 PM
 */
public class CampaignTrackingFilter implements Filter {

  private static final String PING_URL = "http://www.healthkart.com/helloweb.jsp";

  private ExecutorService trafficTrackerExecutorService = Executors.newFixedThreadPool(40);
  private TrafficTrackingService trafficTrackingService;

  private static Logger logger = LoggerFactory.getLogger(CampaignTrackingFilter.class);


  public void init(FilterConfig filterConfig) throws ServletException {
    trafficTrackingService = ServiceLocatorFactory.getService(TrafficTrackingService.class);
  }

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

    if (!(request instanceof HttpServletRequest)) {
      chain.doFilter(request, response);
      return;
    }

    HttpServletRequest httpRequest = (HttpServletRequest) request;

    String requestURL = httpRequest.getRequestURL().toString();

    if (requestURL.equals(PING_URL)) {
      return;
    }

   
    /*Map<String, Long> ReferrerIds = OrderSourceFinder.getOrderReferrer(httpRequest);*/
    HttpSession httpSession = httpRequest.getSession();
    Boolean newSession = (Boolean) httpSession.getAttribute(HttpRequestAndSessionConstants.NEW_SESSION);


    String trackingId = null;
    //Get temp user from cookie
    if (httpRequest.getCookies() != null) {
      for (Cookie cookie : httpRequest.getCookies()) {
        if (cookie.getName() != null && cookie.getName().equals(HealthkartConstants.Cookie.trackingId)) {
          trackingId = cookie.getValue();
        }
      }
    }

    if (newSession == null || !newSession.equals(true)) {

      //logger.info("getting traff track 2");
      httpSession.setAttribute(HttpRequestAndSessionConstants.NEW_SESSION, true);

      if (StringUtils.isNotBlank(trackingId)) {
        /*     TrafficTracking trafficTracking = trafficTrackingDao.get(TrafficTracking.class, Long.valueOf(trackingId));
     if (trafficTracking != null)
       httpSession.setAttribute(HttpRequestAndSessionConstants.TRAFFIC_TRACKING, trafficTracking);*/


      } else {

        //logger.info("getting traff track 3");
        String userAgent = httpRequest.getHeader(HttpRequestAndSessionConstants.USER_AGENT);
        //Check if it is a crawler or a bot
        if (userAgent != null && !userAgent.equals("")
            && !userAgent.toLowerCase().contains("bot") && !userAgent.toLowerCase().contains("spider")
            && !userAgent.toLowerCase().contains("price") && !userAgent.toLowerCase().contains("monit/4.10.1")
            && !userAgent.toLowerCase().contains("monit/5.1.1")
            && !userAgent.toLowerCase().contains("NewRelicPinger".toLowerCase())
            && !userAgent.toLowerCase().contains("YottaaMonitor".toLowerCase())
            && !userAgent.toLowerCase().contains("ia_archiver".toLowerCase())
            && !userAgent.toLowerCase().contains("facebookexternalhit".toLowerCase())
            && !userAgent.toLowerCase().contains("Microsoft Windows Network Diagnostics".toLowerCase())
            && !userAgent.toLowerCase().contains("AutoIt".toLowerCase())
            && !userAgent.toLowerCase().contains("Wget".toLowerCase())
            && !userAgent.toLowerCase().contains("Microsoft Windows Network Diagnostics".toLowerCase())
            && !userAgent.toLowerCase().contains("Mediapartners-Google".toLowerCase())
            && !userAgent.toLowerCase().contains("EasyBib AutoCite".toLowerCase())
            && !userAgent.toLowerCase().contains("ShortLinkTranslate".toLowerCase())
            && !userAgent.toLowerCase().contains("ICAP-IOD".toLowerCase())
            ) {


          //logger.info("getting traff track");
          final TrafficRequestParams trafficRequestParams = new TrafficReqParamBuilder().getTrafficRequestParams(httpRequest);
          if (trafficRequestParams != null) {

            trafficTrackerExecutorService.submit(new Runnable() {
              @Override
              public void run() {
                //logger.info("adding traff track ");
                trafficTrackingService.trackUniqueTrafficVisit(trafficRequestParams);
              }
            });

            //httpSession.setAttribute(HttpRequestAndSessionConstants.TRAFFIC_TRACKING, trafficTracking);
            Cookie cookie = new Cookie(HealthkartConstants.Cookie.trackingId, trafficRequestParams.getHid());
            cookie.setPath("/");
            cookie.setMaxAge(24 * 60 * 60); // 24 hours
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.addCookie(cookie);
          }
        }
      }

      //To use is for Order
      /*httpSession.setAttribute(HttpRequestAndSessionConstants.PRIMARY_REFERRER_ID, ReferrerIds.get(HttpRequestAndSessionConstants.PRIMARY_REFERRER_ID));
      httpSession.setAttribute(HttpRequestAndSessionConstants.SECONDARY_REFERRER_ID, ReferrerIds.get(HttpRequestAndSessionConstants.SECONDARY_REFERRER_ID));*/
    }
    chain.doFilter(request, response);

  }


  public void destroy() {
  }
}
