package com.hk.api.response;

import org.codehaus.jackson.annotate.JsonProperty;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.common.json.JSONObject;

import java.util.List;
import java.util.ArrayList;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 5, 2013
 * Time: 7:24:12 PM
 */
public abstract class AbstractApiBaseResponse extends JSONObject {


  @JsonProperty(DtoJsonConstants.EXCEPTION)
  protected boolean exception = false;

  @JsonProperty(DtoJsonConstants.MESSAGES)
  protected List<String> messages = new ArrayList<String>();


  public boolean isException() {
    return exception;
  }

  public void setException(boolean exception) {
    this.exception = exception;
  }

  public List<String> getMessages() {
    return messages;
  }

  public void setMessages(List<String> messages) {
    this.messages = messages;
  }

  @Override
  protected List<String> getKeys() {
    return new ArrayList<String>(0);
  }

  @Override
  protected List<Object> getValues() {
    return new ArrayList<Object>(0);
  }
}
