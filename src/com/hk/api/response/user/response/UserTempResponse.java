package com.hk.api.response.user.response;


import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

public class UserTempResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.TEMP_USER)
  private boolean isTempUser;

  public boolean isTempUser() {
    return isTempUser;
  }

  public void setTempUser(boolean tempUser) {
    isTempUser = tempUser;
  }
}
