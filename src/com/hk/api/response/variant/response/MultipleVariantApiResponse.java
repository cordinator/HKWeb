package com.hk.api.response.variant.response;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 20, 2013
 * Time: 2:16:10 PM
 */
public class MultipleVariantApiResponse {

  @JsonProperty(DtoJsonConstants.VARIANTS)
  private List<StoreVariantApiResponse> variantApiResponses = new ArrayList<StoreVariantApiResponse>(0);


  public List<StoreVariantApiResponse> getVariantApiResponses() {
    return variantApiResponses;
  }

  public void setVariantApiResponses(List<StoreVariantApiResponse> variantApiResponses) {
    this.variantApiResponses = variantApiResponses;
  }
}
