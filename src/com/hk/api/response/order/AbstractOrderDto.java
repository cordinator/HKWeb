package com.hk.api.response.order;

import com.hk.api.response.cart.ShoppingCartPack;
import com.hk.api.response.cart.ShoppingCartVariant;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Aug 2, 2013
 * Time: 1:40:54 PM
 */
public class AbstractOrderDto {

  @JsonProperty(DtoJsonConstants.ORDER_VARIANTS)
  protected List<ShoppingCartVariant> shoppingCartVariants = new ArrayList<ShoppingCartVariant>();

  @JsonProperty(DtoJsonConstants.ORDER_PACKS)
  protected List<ShoppingCartPack> shoppingCartPacks = new ArrayList<ShoppingCartPack>();

  @JsonProperty(DtoJsonConstants.GATEWAY_ORDER_ID)
  protected String gatewayOrderId;

  @JsonProperty(DtoJsonConstants.ORDER_DATE)
  protected String orderDate;

  @JsonProperty(DtoJsonConstants.ORDER_STATUS)
  protected String status;

  @JsonProperty(DtoJsonConstants.TOTAL_MRP)
  protected double totalMrp;
  @JsonProperty(DtoJsonConstants.TOTAL_OFFER_PRICE)
  protected double totalOfferPrice;
  @JsonProperty(DtoJsonConstants.TOTAL_PAYABLE)
  protected double totalPayable;
  @JsonProperty(DtoJsonConstants.TOTAL_SHIPPING_CHARGES)
  protected double shippingCharges;


  public List<ShoppingCartVariant> getShoppingCartVariants() {
    return shoppingCartVariants;
  }

  public void setShoppingCartVariants(List<ShoppingCartVariant> shoppingCartVariants) {
    this.shoppingCartVariants = shoppingCartVariants;
  }

  public List<ShoppingCartPack> getShoppingCartPacks() {
    return shoppingCartPacks;
  }

  public void setShoppingCartPacks(List<ShoppingCartPack> shoppingCartPacks) {
    this.shoppingCartPacks = shoppingCartPacks;
  }

  public String getGatewayOrderId() {
    return gatewayOrderId;
  }

  public void setGatewayOrderId(String gatewayOrderId) {
    this.gatewayOrderId = gatewayOrderId;
  }

  public String getOrderDate() {
    return orderDate;
  }

  public void setOrderDate(String orderDate) {
    this.orderDate = orderDate;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  public double getTotalMrp() {
    return totalMrp;
  }

  public void setTotalMrp(double totalMrp) {
    this.totalMrp = totalMrp;
  }

  public double getTotalOfferPrice() {
    return totalOfferPrice;
  }

  public void setTotalOfferPrice(double totalOfferPrice) {
    this.totalOfferPrice = totalOfferPrice;
  }

  public double getTotalPayable() {
    return totalPayable;
  }

  public void setTotalPayable(double totalPayable) {
    this.totalPayable = totalPayable;
  }

  public double getShippingCharges() {
    return shippingCharges;
  }

  public void setShippingCharges(double shippingCharges) {
    this.shippingCharges = shippingCharges;
  }
}
