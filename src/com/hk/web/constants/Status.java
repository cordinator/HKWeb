package com.hk.web.constants;

/**
 * @author Rimal
 */
public enum Status {

  OK(200),
  //BAD_REQUEST(400), 
  UNAUTHORIZED(401), FORBIDDEN(403), NOT_FOUND(404), GONE(410),
  INTERNAL_SERVER_ERROR(500), SERVICE_UNAVAILABLE(503);

  private int code;

  Status(int code) {
    this.code = code;
  }

  public int getStatusCode() {
    return code;
  }
}
