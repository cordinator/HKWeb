package com.hk.api.response.user.wrapper.account;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.user.response.account.UserAccountUpdateApiResponse;
import com.hk.api.response.AbstractBaseResponseApiWrapper;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class UserAccountUpdateResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private UserAccountUpdateApiResponse userAccountUpdateResponse;


  public UserAccountUpdateApiResponse getUserAccountUpdateResponse() {
    return userAccountUpdateResponse;
  }

  public void setUserAccountUpdateResponse(UserAccountUpdateApiResponse userAccountUpdateResponse) {
    this.userAccountUpdateResponse = userAccountUpdateResponse;
  }
}
