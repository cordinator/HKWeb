package com.hk.common.constants.payment;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 24, 2013
 * Time: 1:54:06 PM
 */
public enum EnumPaymentType {

  ONLINE_PAYMENT(1000L, "Online Payment"),
  FREE_CHECKOUT(5L, "Free"),
  NEFT(20L, "NEFT"),
  CHEQUE_DEPOSIT(25L, "Cheque Deposit"),
  CASH_DEPOSIT(30L, "Cash Deposit"),
  COD(40L, "COD"),
  COUNTER_CASH(50L, "Counter Cash"),
  SUBSCRIPTION_PAYMENT(95L, "Subscription Payment"),
  OFFLINE_CARD_PAYMENT(100L, "Offline Credit/Debit Card");


  private java.lang.String name;
  private java.lang.Long id;


  EnumPaymentType(java.lang.Long id, java.lang.String name) {
    this.name = name;
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public Long getId() {
    return id;
  }

  public static EnumPaymentType getById(Long id) {
    for (EnumPaymentType paymentType : values()) {
      if (paymentType.getId().equals(id)) return paymentType;
    }
    return null;
  }
}
