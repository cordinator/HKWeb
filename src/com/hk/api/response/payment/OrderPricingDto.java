package com.hk.api.response.payment;

import com.hk.api.response.cart.PricingDto;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 24, 2013
 * Time: 2:25:57 PM
 */
public class OrderPricingDto extends PricingDto {

  private double codCharges;

  public double getCodCharges() {
    return codCharges;
  }

  public void setCodCharges(double codCharges) {
    this.codCharges = codCharges;
  }


  @Override
  protected List<String> getKeys() {
    return super.getKeys();
  }

  @Override
  protected List<Object> getValues() {
    return super.getValues();
  }
}
