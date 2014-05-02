package com.hk.api.request.cart;


public class AddVariantWithExtraOptions extends AddSingleVariantToCartRequest {

  private String leftExtOpt;
  private String rightExtOpt;

  public String getLeftExtOpt() {
    return leftExtOpt;
  }

  public void setLeftExtOpt(String leftExtOpt) {
    this.leftExtOpt = leftExtOpt;
  }

  public String getRightExtOpt() {
    return rightExtOpt;
  }

  public void setRightExtOpt(String rightExtOpt) {
    this.rightExtOpt = rightExtOpt;
  }
}
