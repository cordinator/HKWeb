package com.hk.api.response.user.wrapper.account;

import com.hk.api.response.user.response.account.UserAccountApiResponse;
import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class UserAccountResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private UserAccountApiResponse userAccountResponse;


  public UserAccountApiResponse getUserAccountResponse() {
    return userAccountResponse;
  }

  public void setUserAccountResponse(UserAccountApiResponse userAccountResponse) {
    this.userAccountResponse = userAccountResponse;
  }
}
