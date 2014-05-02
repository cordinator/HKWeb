package com.hk.api.response;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 6, 2013
 * Time: 2:37:11 PM
 */
public abstract class AbstractBaseResponseApiWrapper {

  private int statusCode;


  public int getStatusCode() {
    return statusCode;
  }

  public void setStatusCode(int statusCode) {
    this.statusCode = statusCode;
  }
}
