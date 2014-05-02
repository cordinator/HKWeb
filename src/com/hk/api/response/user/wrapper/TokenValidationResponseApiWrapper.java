package com.hk.api.response.user.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.user.response.TokenValidationApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class TokenValidationResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private TokenValidationApiResponse tokenValidationApiResponse;


  public TokenValidationApiResponse getTokenValidationApiResponse() {
    return tokenValidationApiResponse;
  }

  public void setTokenValidationApiResponse(TokenValidationApiResponse tokenValidationApiResponse) {
    this.tokenValidationApiResponse = tokenValidationApiResponse;
  }
}
