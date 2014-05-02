package com.hk.api.response.location.address.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.location.address.response.AddressApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class AddressResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private AddressApiResponse addressResponse;


  public AddressApiResponse getAddressResponse() {
    return addressResponse;
  }

  public void setAddressResponse(AddressApiResponse addressResponse) {
    this.addressResponse = addressResponse;
  }
}
