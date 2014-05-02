package com.hk.api.response.location.address.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.location.address.Address;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;
import java.util.ArrayList;

/**
 * @author Rimal
 */
public class UserAddressListApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.ADDRESSES)
  private List<Address> addresses = new ArrayList<Address>();


  public List<Address> getAddresses() {
    return addresses;
  }

  public void setAddresses(List<Address> addresses) {
    this.addresses = addresses;
  }
}
