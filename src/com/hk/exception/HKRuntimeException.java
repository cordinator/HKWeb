package com.hk.exception;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 24, 2013
 * Time: 7:09:09 PM
 */
public class HKRuntimeException extends RuntimeException {

  private String messageKey;
  private Object[] params;


  public HKRuntimeException(String messageKey, Object... params) {
    super();
    this.params = params;
    this.messageKey = messageKey;
  }

  @Override
  public String getMessage() {
    return "Error: " + messageKey;
  }

  @Override
  public String toString() {

    return super.toString();
  }
}

