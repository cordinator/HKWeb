package com.hk.constants.payment;

/**
 * Created with IntelliJ IDEA.
 * User: Shrey
 * Date: 6/25/13
 * Time: 7:10 PM
 * To change this template use File | Settings | File Templates.
 */
public class PaymentGatewayParameters {

  //request parameters
  public static final String SECURE_HASH = "secure_hash";
  public static final String ACCOUNT_ID = "account_id";
  public static final String ADDRESS = "address";
  public static final String CITY = "city";
  public static final String STATE = "state";
  public static final String PHONE = "phone";
  public static final String POSTAL_CODE = "postal_code";
  public static final String NAME = "name";
  public static final String EMAIL = "email";
  public static final String RETURN_URL = "return_url";
  public static final String AMOUNT = "amount";
  public static final String COUNTRY = "country";
  public static final String PAYMENT_OPTION = "payment_option";
  public static final String DESCRIPTION = "description";
  public static final String GATEWAY_ORDER_ID = "reference_no";


  public static final String hk_accountId = "10258";


  //response parameters
  public static final String GATEWAYORDER_ID = "gatewayOrderId";
  public static final String ACCOUNTID = "accountId";
  public static final String CHECKSUM = "checksum";
  public static final String TRANSACTIONSTATUS = "transactionStatus";
}
