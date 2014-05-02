package com.hk.impl.service.hkr.speakTo;

import com.hk.api.request.hkr.notify.HkrUpdateSpeakToUserDetails;
import com.hk.api.response.hkr.speakTo.HkrSpeakToResponse;
import com.hk.api.response.hkr.subscribe.HkrSubscribeResponse;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.EnvConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.hkr.speakTo.HkrSpeakToService;
import org.springframework.stereotype.Service;

@Service
public class HkrSpeakToServiceImpl implements HkrSpeakToService {

  private static final String UPDATE = "update";

  @Override
  public HkrSpeakToResponse updateSpeakToResponse(HkrUpdateSpeakToUserDetails hkrUpdateSpeakToUserDetails) {

    URIBuilder uriBuilder = new URIBuilder().fromURI(EnvConstants.HKR_SERVER_URL, ServiceEndPoints.SPEAK_TO + UPDATE);
    return (HkrSpeakToResponse) HkHttpClient.executePostForObject(uriBuilder.getWebServiceUrl(), hkrUpdateSpeakToUserDetails.getParameters(), HkrSpeakToResponse.class);
  }

  @Override
  public HkrSubscribeResponse subscribeUserByEmail(String email) {

    URIBuilder uriBuilder = new URIBuilder().fromURI(EnvConstants.HKR_SERVER_URL, ServiceEndPoints.SUBSCRIBE + email);
    return (HkrSubscribeResponse)HkHttpClient.executePostForObject(uriBuilder.getWebServiceUrl(),null,HkrSubscribeResponse.class);
  }
}
