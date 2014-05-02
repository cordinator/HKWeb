package com.hk.api.response.location.address.response.account;

import com.hk.api.response.location.address.response.CreateUpdateUserAddressApiResponse;
import com.hk.api.response.location.address.response.UserAddressListApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class UpdateUserAddressDetailApiResponse extends CreateUpdateUserAddressApiResponse {

  @JsonProperty(DtoJsonConstants.USER_ADDRESS_DETAILS)
  private UserAddressListApiResponse userAddressListApiResponse;


  public UserAddressListApiResponse getUserAddressListApiResponse() {
    return userAddressListApiResponse;
  }

  public void setUserAddressListApiResponse(UserAddressListApiResponse userAddressListApiResponse) {
    this.userAddressListApiResponse = userAddressListApiResponse;
  }
}
