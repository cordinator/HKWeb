package com.hk.pact.service.hkr.notify;


import com.hk.api.request.hkr.notify.HkrUpdateNotifyMeUserDetails;
import com.hk.api.response.hkr.notify.HkrNotifyMeResponse;
import com.hk.api.response.hkr.notify.HkrNotifyMeUpdateResponse;

public interface HkrNotifyMeService {

  public HkrNotifyMeResponse getNotifyMeResponseOfLoginUser(Long userId);

  public HkrNotifyMeUpdateResponse updateNotifyMe(HkrUpdateNotifyMeUserDetails hkrUpdateNotifyMeUserDetails);
}
