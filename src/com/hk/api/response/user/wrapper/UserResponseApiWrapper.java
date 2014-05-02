package com.hk.api.response.user.wrapper;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.user.response.UserApiResponse;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 25, 2013
 * Time: 7:43:18 PM
 */
public class UserResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private UserApiResponse userResponse;

  public UserApiResponse getUserResponse() {
    return userResponse;
  }

  public void setUserResponse(UserApiResponse userResponse) {
    this.userResponse = userResponse;
  }
}
