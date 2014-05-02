package com.hk.api.response.user.wrapper.account;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.user.response.account.UserEmailUpdateApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class UserEmailUpdateResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private UserEmailUpdateApiResponse userEmailUpdateApiResponse;


  public UserEmailUpdateApiResponse getUserEmailUpdateApiResponse() {
    return userEmailUpdateApiResponse;
  }

  public void setUserEmailUpdateApiResponse(UserEmailUpdateApiResponse userEmailUpdateApiResponse) {
    this.userEmailUpdateApiResponse = userEmailUpdateApiResponse;
  }
}
