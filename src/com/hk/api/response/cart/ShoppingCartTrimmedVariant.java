package com.hk.api.response.cart;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 10, 2013
 * Time: 2:54:52 PM
 */
public class ShoppingCartTrimmedVariant extends ShoppingCartVariant {

  private Long trimTypeId;
  private String trimReason;

  private boolean isTrimmedAlready;


  public Long getTrimTypeId() {
    return trimTypeId;
  }

  public void setTrimTypeId(Long trimTypeId) {
    this.trimTypeId = trimTypeId;
  }

  public String getTrimReason() {
    return trimReason;
  }

  public void setTrimReason(String trimReason) {
    this.trimReason = trimReason;
  }

  public boolean isTrimmedAlready() {
    return isTrimmedAlready;
  }

  public void setTrimmedAlready(boolean trimmedAlready) {
    isTrimmedAlready = trimmedAlready;
  }
}
