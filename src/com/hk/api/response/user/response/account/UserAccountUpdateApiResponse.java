package com.hk.api.response.user.response.account;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.response.AbstractBaseResponse;
import com.hk.api.response.user.response.UserApiResponse;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class UserAccountUpdateApiResponse extends AbstractBaseResponse {

  @JsonProperty(DtoJsonConstants.USER_DETAILS)
  private UserApiResponse userApiResponse;


  public UserApiResponse getUserApiResponse() {
    return userApiResponse;
  }

  public void setUserApiResponse(UserApiResponse userApiResponse) {
    this.userApiResponse = userApiResponse;
  }
}
