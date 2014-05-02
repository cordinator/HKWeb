package com.hk.api.response.hkr.variant.combo;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class HkrComboResponseWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private HkrComboResponse hkrComboResponse;


  public HkrComboResponse getHkrComboResponse() {
    return hkrComboResponse;
  }

  public void setHkrComboResponse(HkrComboResponse hkrComboResponse) {
    this.hkrComboResponse = hkrComboResponse;
  }
}