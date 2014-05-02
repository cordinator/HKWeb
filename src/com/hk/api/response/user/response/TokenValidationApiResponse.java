package com.hk.api.response.user.response;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class TokenValidationApiResponse extends AbstractTokenApiResponse {

  @JsonProperty(DtoJsonConstants.VALID)
  private boolean valid;


  public boolean isValid() {
    return valid;
  }

  public void setValid(boolean valid) {
    this.valid = valid;
  }
}
