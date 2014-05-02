package com.hk.api.response.hkr.notify;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;


public class HkrNotifyMeResponseWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private HkrNotifyMeResponse hkrNotifyMeResponse;

  public HkrNotifyMeResponse getHkrNotifyMeResponse() {
    return hkrNotifyMeResponse;
  }

  public void setHkrNotifyMeResponse(HkrNotifyMeResponse hkrNotifyMeResponse) {
    this.hkrNotifyMeResponse = hkrNotifyMeResponse;
  }
}
