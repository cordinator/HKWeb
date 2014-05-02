package com.hk.api.response.location.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.location.Pincode;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class PincodeApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.PINCODE)
  private Pincode pincode;


  public Pincode getPincode() {
    return pincode;
  }

  public void setPincode(Pincode pincode) {
    this.pincode = pincode;
  }
}
