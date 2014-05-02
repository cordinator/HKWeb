package com.hk.api.response.hkr.speakTo;


import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.response.GenericResponse;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

public class HkrSpeakToResponse extends GenericResponse {

  @JsonProperty(DtoJsonConstants.SUCCESS)
  private boolean success;

  public boolean isSuccess() {
    return success;
  }

  public void setSuccess(boolean success) {
    this.success = success;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys = new ArrayList<String>();
    keys.add(DtoJsonConstants.SUCCESS);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = new ArrayList<Object>();
    values.add(this.success);
    return values;
  }
}
