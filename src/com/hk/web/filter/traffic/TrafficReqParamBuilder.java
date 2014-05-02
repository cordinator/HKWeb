package com.hk.web.filter.traffic;

import com.hk.web.constants.HttpRequestAndSessionConstants;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.Calendar;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Nov 21, 2013
 * Time: 4:51:57 PM
 */
public class TrafficReqParamBuilder {


  public TrafficRequestParams getTrafficRequestParams(HttpServletRequest httpRequest) {

    String pageUrl = httpRequest.getRequestURL().toString();
    if (StringUtils.isNotBlank(pageUrl) && StringUtils.equals(pageUrl, "http:///")) {
      return null;
    }

    Map<String, String> trafficInfoMap = TrafficSourceFinder.getTrafficDetails(httpRequest);
    TrafficRequestParams trafficRequestParams = new TrafficRequestParams();
    Calendar cal = Calendar.getInstance();
    trafficRequestParams.setHid(Long.valueOf(cal.getTimeInMillis()).toString());

    String srcUrl = httpRequest.getHeader(HttpRequestAndSessionConstants.REFERER);
    if (StringUtils.isNotBlank(srcUrl) && srcUrl.length() > 190) {
      srcUrl = srcUrl.substring(0, 180);
    }
    trafficRequestParams.setSrcUrl(srcUrl);
    String userAgent = httpRequest.getHeader(HttpRequestAndSessionConstants.USER_AGENT);
    if (StringUtils.isNotBlank(userAgent) && userAgent.length() > 190) {
      userAgent = userAgent.substring(0, 180);
    }
    trafficRequestParams.setUserAgent(userAgent);
    trafficRequestParams.setTrafficSrc(trafficInfoMap.get(TrafficSourceFinder.TRAFFIC_SRC));
    String trafficSrcDetails = trafficInfoMap.get(TrafficSourceFinder.TRAFFIC_SRC_DETAILS);
    if (StringUtils.isNotBlank(trafficSrcDetails) && trafficSrcDetails.length() > 190) {
      trafficSrcDetails = trafficSrcDetails.substring(0, 180);
    }
    trafficRequestParams.setTrafficSrcDetails(trafficSrcDetails);
    trafficRequestParams.setTrafficSrcPaid(Boolean.valueOf(trafficInfoMap.get(TrafficSourceFinder.TRAFFIC_SRC_PAID)));

    trafficRequestParams.setLandingUrl(pageUrl);


    trafficRequestParams.setIp(getClientIPAddress(httpRequest));
    trafficRequestParams.setSessionId(httpRequest.getSession().getId());

    return trafficRequestParams;


  }

  public String getClientIPAddress(HttpServletRequest request) {
    // Apache redirection
    String ipAddress = request.getHeader("X-FORWARDED-FOR");
    if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
      ipAddress = request.getRemoteAddr();
    }
    if (ipAddress.contains(",")) {
      ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
    }
    return ipAddress;
  }
}
