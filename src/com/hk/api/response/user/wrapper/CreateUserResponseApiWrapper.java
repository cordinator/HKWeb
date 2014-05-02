package com.hk.api.response.user.wrapper;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.user.response.CreateUserApiResponse;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 31, 2013
 * Time: 4:12:13 PM
 */
public class CreateUserResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private CreateUserApiResponse createUserResponse;

  public CreateUserApiResponse getCreateUserResponse() {
    return createUserResponse;
  }

  public void setCreateUserResponse(CreateUserApiResponse createUserResponse) {
    this.createUserResponse = createUserResponse;
  }
}