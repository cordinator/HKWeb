package com.hk.api.response.location.address.response;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractApiBaseResponse;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class CreateUpdateUserAddressApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.LAST_MODIFIED_ADDRESS_ID)
  private Long lastModifiedAddressId;


  public Long getLastModifiedAddressId() {
    return lastModifiedAddressId;
  }

  public void setLastModifiedAddressId(Long lastModifiedAddressId) {
    this.lastModifiedAddressId = lastModifiedAddressId;
  }
}