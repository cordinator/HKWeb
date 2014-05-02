package com.hk.api.response.brand.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.brand.response.BrandListByPrefixApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class BrandListByPrefixResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private BrandListByPrefixApiResponse brandListByPrefixApiResponse;


  public BrandListByPrefixApiResponse getBrandListByPrefixApiResponse() {
    return brandListByPrefixApiResponse;
  }

  public void setBrandListByPrefixApiResponse(BrandListByPrefixApiResponse brandListByPrefixApiResponse) {
    this.brandListByPrefixApiResponse = brandListByPrefixApiResponse;
  }
}
