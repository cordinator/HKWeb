package com.hk.common.json;

import com.hk.web.constants.Status;
import com.hk.web.constants.WebResponseConstants;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * @author adlakha.vaibhav
 */
public class JSONResponseBuilder {

  private Map<String, Object> params;
  private Status status = Status.OK;

  public JSONResponseBuilder addField(String fieldName, Object fieldValue) {
    if (params == null) {
      params = new LinkedHashMap<String, Object>();
    }

    params.put(fieldName, fieldValue);

    return this;
  }


  public JSONResponseBuilder setStatus(Status status) {
    this.status = status;
    return this;
  }

  public JSONResponseBuilder addMap(Map<String, Object> data) {
    if (params == null) {
      params = new HashMap<String, Object>();
    }

    params.putAll(data);

    return this;
  }


  public Object getParam(String fieldName) {
    return params.get(fieldName);
  }

  public String buildAsString() {
    StringBuilder sb = new StringBuilder();
    params.put(WebResponseConstants.STATUS_CODE, status.getStatusCode());
    JSONObject.appendJSONMap(params, sb);
    return sb.toString();
  }

}