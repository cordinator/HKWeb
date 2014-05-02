package com.hk.pact.service.hkr.speakTo;


import com.hk.api.request.hkr.notify.HkrUpdateSpeakToUserDetails;
import com.hk.api.response.hkr.speakTo.HkrSpeakToResponse;
import com.hk.api.response.hkr.subscribe.HkrSubscribeResponse;

public interface HkrSpeakToService {

  public HkrSpeakToResponse updateSpeakToResponse(HkrUpdateSpeakToUserDetails hkrUpdateSpeakToUserDetails);

  public HkrSubscribeResponse subscribeUserByEmail(String email);
}
