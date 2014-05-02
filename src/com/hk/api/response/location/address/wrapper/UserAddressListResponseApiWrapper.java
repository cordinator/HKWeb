package com.hk.api.response.location.address.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.location.address.response.UserAddressListApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class UserAddressListResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private UserAddressListApiResponse userAddressListResponse;

  public UserAddressListApiResponse getUserAddressListResponse() {
    return userAddressListResponse;
  }

  public void setUserAddressListResponse(UserAddressListApiResponse userAddressListResponse) {
    this.userAddressListResponse = userAddressListResponse;
  }
}
