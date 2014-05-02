package com.hk.api.response.location.address.wrapper;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.location.address.response.CreateUpdateUserAddressApiResponse;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class CreateUpdateUserAddressResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private CreateUpdateUserAddressApiResponse userAddressResponse;


  public CreateUpdateUserAddressApiResponse getUserAddressResponse() {
    return userAddressResponse;
  }

  public void setUserAddressResponse(CreateUpdateUserAddressApiResponse userAddressResponse) {
    this.userAddressResponse = userAddressResponse;
  }
}
