package com.hk.api.response.location.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.location.response.PincodeApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class PincodeResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private PincodeApiResponse pincodeApiResponse;


  public PincodeApiResponse getPincodeApiResponse() {
    return pincodeApiResponse;
  }

  public void setPincodeApiResponse(PincodeApiResponse pincodeApiResponse) {
    this.pincodeApiResponse = pincodeApiResponse;
  }
}
