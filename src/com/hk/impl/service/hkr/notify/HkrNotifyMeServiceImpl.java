package com.hk.impl.service.hkr.notify;

import com.hk.api.request.hkr.notify.HkrUpdateNotifyMeUserDetails;
import com.hk.api.response.hkr.notify.HkrNotifyMeResponse;
import com.hk.api.response.hkr.notify.HkrNotifyMeResponseWrapper;
import com.hk.api.response.hkr.notify.HkrNotifyMeUpdateResponse;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.EnvConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.hkr.notify.HkrNotifyMeService;
import org.springframework.stereotype.Service;

@Service
public class HkrNotifyMeServiceImpl implements HkrNotifyMeService {

  private static final String DETAILS = "details";
  private static final String UPDATE = "update";

  @Override
  public HkrNotifyMeUpdateResponse updateNotifyMe(HkrUpdateNotifyMeUserDetails hkrUpdateNotifyMeUserDetails) {
    URIBuilder uriBuilder = new URIBuilder().fromURI(EnvConstants.HKR_SERVER_URL, ServiceEndPoints.NOTIFY + UPDATE);
    return (HkrNotifyMeUpdateResponse) HkHttpClient.executePostForObject(uriBuilder.getWebServiceUrl(), hkrUpdateNotifyMeUserDetails.getParameters(), HkrNotifyMeUpdateResponse.class);
  }

  @Override
  public HkrNotifyMeResponse getNotifyMeResponseOfLoginUser(Long userId) {

    URIBuilder uriBuilder = new URIBuilder().fromURI(EnvConstants.HKR_SERVER_URL, ServiceEndPoints.NOTIFY + DETAILS + ServiceEndPoints.URI_SEPARATOR + userId.toString());
    HkrNotifyMeResponseWrapper hkrNotifyMeResponseWrapper = (HkrNotifyMeResponseWrapper) HkHttpClient.executeGet(uriBuilder.getWebServiceUrl(), HkrNotifyMeResponseWrapper.class);
    if (hkrNotifyMeResponseWrapper != null) {
      return hkrNotifyMeResponseWrapper.getHkrNotifyMeResponse();
    }
    return null;
  }
}
