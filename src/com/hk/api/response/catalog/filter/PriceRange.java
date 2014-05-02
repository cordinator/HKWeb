package com.hk.api.response.catalog.filter;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 5, 2013
 * Time: 7:31:17 PM
 * 
 */
public class PriceRange {

  private double minPrice;
  private double maxPrice;


  public double getMinPrice() {
    return minPrice;
  }

  public void setMinPrice(double minPrice) {
    this.minPrice = minPrice;
  }

  public double getMaxPrice() {
    return maxPrice;
  }

  public void setMaxPrice(double maxPrice) {
    this.maxPrice = maxPrice;
  }
}
