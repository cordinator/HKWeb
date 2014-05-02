package com.hk.api.response.pack;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class PackListResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private PackListApiResponse packListApiResponse;


  public PackListApiResponse getPackListApiResponse() {
    return packListApiResponse;
  }

  public void setPackListApiResponse(PackListApiResponse packListApiResponse) {
    this.packListApiResponse = packListApiResponse;
  }
}
