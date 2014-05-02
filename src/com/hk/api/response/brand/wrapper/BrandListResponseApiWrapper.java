package com.hk.api.response.brand.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.brand.response.BrandListApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class BrandListResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private BrandListApiResponse brandListApiResponse;


  public BrandListApiResponse getBrandListApiResponse() {
    return brandListApiResponse;
  }

  public void setBrandListApiResponse(BrandListApiResponse brandListApiResponse) {
    this.brandListApiResponse = brandListApiResponse;
  }
}
