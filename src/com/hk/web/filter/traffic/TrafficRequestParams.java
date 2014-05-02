package com.hk.web.filter.traffic;

import com.hk.common.constants.StoreConstants;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Nov 21, 2013
 * Time: 4:37:49 PM
 */
public class TrafficRequestParams {

  private String srcUrl;
  private String userAgent;
  private String trafficSrc;
  private String trafficSrcDetails;
  private Boolean trafficSrcPaid;
  private String landingUrl;

  private Long userId;
  private String ip;
  private String sessionId;
  private Long storeId;
  /*private Long orderId;
  private Long firstOrder;
  private Long returningUser;
*/
  /*private String primaryCategory;
  private String productId;*/

  private String hid;

  public String getHid() {
    return hid;
  }

  public void setHid(String hid) {
    this.hid = hid;
  }

  public String getSrcUrl() {
    return srcUrl;
  }

  public void setSrcUrl(String srcUrl) {
    this.srcUrl = srcUrl;
  }

  public String getUserAgent() {
    return userAgent;
  }

  public void setUserAgent(String userAgent) {
    this.userAgent = userAgent;
  }

  public String getTrafficSrc() {
    return trafficSrc;
  }

  public void setTrafficSrc(String trafficSrc) {
    this.trafficSrc = trafficSrc;
  }

  public String getTrafficSrcDetails() {
    return trafficSrcDetails;
  }

  public void setTrafficSrcDetails(String trafficSrcDetails) {
    this.trafficSrcDetails = trafficSrcDetails;
  }

  public Boolean isTrafficSrcPaid() {
    return trafficSrcPaid;
  }

  public void setTrafficSrcPaid(Boolean trafficSrcPaid) {
    this.trafficSrcPaid = trafficSrcPaid;
  }

  public String getLandingUrl() {
    return landingUrl;
  }

  public void setLandingUrl(String landingUrl) {
    this.landingUrl = landingUrl;
  }


  public Long getUserId() {
    return userId;
  }

  public void setUserId(Long userId) {
    this.userId = userId;
  }

  public String getIp() {
    return ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }

  public String getSessionId() {
    return sessionId;
  }

  public void setSessionId(String sessionId) {
    this.sessionId = sessionId;
  }

  public Map<String, String> getParameters() {
    Map<String, String> params = new HashMap<String, String>();


    params.put("srcUrl", this.srcUrl);
    params.put("userAgent", this.userAgent);
    params.put("trafficSrc", this.trafficSrc);
    params.put("trafficSrcDetails", this.trafficSrcDetails);
    params.put("trafficSrcPaid", this.trafficSrcPaid.toString());
    params.put("landingUrl", this.landingUrl);
    params.put("ip", this.ip);
    params.put("sessionId", this.sessionId);
    params.put("hid", this.hid);
    params.put("storeId", StoreConstants.DEFAULT_STORE_ID_STR);

    if (userId != null) {
      params.put("userId", this.userId.toString());
    } else {
      params.put("userId", null);
    }

    return params;
  }


}
