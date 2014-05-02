package com.hk.api.response.location.address.wrapper.account;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.location.address.response.account.UpdateUserAddressDetailApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class UpdateUserAddressDetailResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private UpdateUserAddressDetailApiResponse updateUserAddressDetailApiResponse;


  public UpdateUserAddressDetailApiResponse getUpdateUserAddressDetailApiResponse() {
    return updateUserAddressDetailApiResponse;
  }

  public void setUpdateUserAddressDetailApiResponse(UpdateUserAddressDetailApiResponse updateUserAddressDetailApiResponse) {
    this.updateUserAddressDetailApiResponse = updateUserAddressDetailApiResponse;
  }
}
