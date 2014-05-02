package com.hk.common.constants.payment;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 24, 2013
 * Time: 6:44:38 PM
 */
public enum EnumPaymentStatus {

  REQUEST(1L, "Requested"),

  AUTHORIZATION_PENDING(2L, "Authorization Pending"),

  SUCCESS(3L, "Success"),

  FAIL(4L,"fail"),

  ON_DELIVERY(7L, "On delivery");


  private java.lang.String name;
  private java.lang.Long id;

  EnumPaymentStatus(java.lang.Long id, java.lang.String name) {
    this.name = name;
    this.id = id;
  }

  public java.lang.String getName() {
    return name;
  }

  public java.lang.Long getId() {
    return id;
  }


  public static EnumPaymentStatus getById(Long id) {
    for (EnumPaymentStatus paymentStatus : values()) {
      if (paymentStatus.getId().equals(id)) return paymentStatus;
    }
    return null;
  }
}
