package com.hk.web.response;

import com.hk.common.json.JSONObject;
import com.hk.common.constants.DtoJsonConstants;

import java.util.ArrayList;
import java.util.List;

import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 18, 2013
 * Time: 3:24:39 PM
 */
public abstract class AbstractGenericResponse extends JSONObject {

  @JsonProperty(DtoJsonConstants.EXCEPTION)
  protected boolean exception = false;
  @JsonProperty(DtoJsonConstants.MESSAGES)
  protected List<String> messages = new ArrayList<String>();

  public boolean isException() {
    return exception;
  }

  public AbstractGenericResponse setException(boolean exception) {
    this.exception = exception;
    return this;
  }

  public AbstractGenericResponse addMessage(String message) {
    this.messages.add(message);
    return this;
  }


  public List<String> getMessages() {
    return messages;
  }

  public void setMessages(List<String> messages) {
    this.messages = messages;
  }


  @Override
  protected List<String> getKeys() {
    /* List<String> keys = new ArrayList<String>();
   keys.add(DtoJsonConstants.MESSAGES);
   keys.add(DtoJsonConstants.EXCEPTION);

   return keys;*/

    return new ArrayList<String>(0);
  }

  @Override
  protected List<Object> getValues() {
    /* List<Object> values = new ArrayList<Object>();
   values.add(this.messages);
   values.add(this.exception);
   return values;*/

    return new ArrayList<Object>(0);
  }
}


