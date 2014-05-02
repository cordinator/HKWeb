package com.hk.api.response.variant.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.variant.response.MultipleVariantApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class MultipleVariantResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private MultipleVariantApiResponse multipleVariantApiResponse;


  public MultipleVariantApiResponse getMultipleVariantApiResponse() {
    return multipleVariantApiResponse;
  }

  public void setMultipleVariantApiResponse(MultipleVariantApiResponse multipleVariantApiResponse) {
    this.multipleVariantApiResponse = multipleVariantApiResponse;
  }
}
