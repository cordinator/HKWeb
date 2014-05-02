package com.hk.exception;

import org.apache.commons.lang.StringUtils;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 24, 2013
 * Time: 7:09:34 PM
 */
public class LoginException extends HKRuntimeException {

  public LoginException(String messageKey, Object... params) {
    super(messageKey, params);
  }

  @Override
  public String getMessage() {
    String message = super.getMessage();

    if (StringUtils.isBlank(message)) {
      message = "Unable to login to admin!";
    }
    return message;
  }
}