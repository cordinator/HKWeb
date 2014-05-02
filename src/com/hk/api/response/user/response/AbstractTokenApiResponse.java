package com.hk.api.response.user.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public abstract class AbstractTokenApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.TOKEN)
  protected String token;



  public String getToken() {
    return token;
  }

  public void setToken(String token) {
    this.token = token;
  }
}
