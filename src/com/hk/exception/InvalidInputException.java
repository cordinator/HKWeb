package com.hk.exception;

import org.apache.commons.lang.StringUtils;

/**
 * @author adlakha.vaibhav
 */
public class InvalidInputException  extends HKRuntimeException {

  public InvalidInputException(String messageKey, Object... params) {
    super(messageKey, params);
  }

  @Override
  public String getMessage() {
    String message = super.getMessage();

    if (StringUtils.isBlank(message)) {
      message = "Input provided is not valid";
    }
    return message;
  }
}