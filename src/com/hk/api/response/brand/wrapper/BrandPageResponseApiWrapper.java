package com.hk.api.response.brand.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.brand.response.BrandPageApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Sep 12, 2013
 * Time: 5:08:42 PM
 */
public class BrandPageResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private BrandPageApiResponse brandPageApiResponse;


  public BrandPageApiResponse getBrandPageApiResponse() {
    return brandPageApiResponse;
  }

  public void setBrandPageApiResponse(BrandPageApiResponse brandPageApiResponse) {
    this.brandPageApiResponse = brandPageApiResponse;
  }
}