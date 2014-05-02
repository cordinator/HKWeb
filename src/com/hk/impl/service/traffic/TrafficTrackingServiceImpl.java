package com.hk.impl.service.traffic;

import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.traffic.TrafficTrackingService;
import com.hk.web.filter.traffic.TrafficRequestParams;
import org.springframework.stereotype.Service;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Nov 21, 2013
 * Time: 5:37:51 PM
 */
@Service
public class TrafficTrackingServiceImpl implements TrafficTrackingService {

  private static final String UQ_VISIT = "/uq/visit";

  @Override
  public void trackUniqueTrafficVisit(TrafficRequestParams trafficRequestParams) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.TRAFFIC + UQ_VISIT);

    HkHttpClient.executePostForObject(builder.getWebServiceUrl(), trafficRequestParams.getParameters(), null);
  }
}
