package com.hk.api.response.location.address.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.location.address.Address;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class AddressApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.ADDRESS)
  private Address address;


  public Address getAddress() {
    return address;
  }

  public void setAddress(Address address) {
    this.address = address;
  }
}