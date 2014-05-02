package com.hk.web.response.payment;

import com.hk.api.response.cart.ShoppingCartTrimmedVariant;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.response.GenericResponse;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;


public class PaymentSentResponse extends GenericResponse {

  private List<ShoppingCartTrimmedVariant> shoppingCartTrimmedVariants = new ArrayList<ShoppingCartTrimmedVariant>();

  private String paymentChecksum;

  private String gatewayOrderId;

  public List<ShoppingCartTrimmedVariant> getShoppingCartTrimmedVariants() {
    return shoppingCartTrimmedVariants;
  }

  public void setShoppingCartTrimmedVariants(List<ShoppingCartTrimmedVariant> shoppingCartTrimmedVariants) {
    this.shoppingCartTrimmedVariants = shoppingCartTrimmedVariants;
  }

  public String getPaymentChecksum() {
    return paymentChecksum;
  }

  public void setPaymentChecksum(String paymentChecksum) {
    this.paymentChecksum = paymentChecksum;
  }

  public String getGatewayOrderId() {
    return gatewayOrderId;
  }

  public void setGatewayOrderId(String gatewayOrderId) {
    this.gatewayOrderId = gatewayOrderId;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add("shoppingCartTrimmedVariants");
    keys.add("paymentChecksum");
    keys.add("gatewayOrderId");
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.shoppingCartTrimmedVariants);
    values.add(this.paymentChecksum);
    values.add(this.gatewayOrderId);
    return values;
  }
}
