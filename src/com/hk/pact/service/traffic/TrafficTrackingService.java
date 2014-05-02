package com.hk.pact.service.traffic;

import com.hk.web.filter.traffic.TrafficRequestParams;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Nov 21, 2013
 * Time: 5:01:55 PM
 */
public interface TrafficTrackingService {

  public void trackUniqueTrafficVisit(TrafficRequestParams trafficRequestParams);
}
