package com.hk.api.response.reward;


import com.hk.common.constants.DtoJsonConstants;
import com.hk.common.json.JSONObject;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RewardPointDTO  extends JSONObject{

  @JsonProperty(DtoJsonConstants.TXN_DATE)
  private Date txnDate;
  @JsonProperty(DtoJsonConstants.GATEWAY_ORDER_ID)
  private String gatewayOrderId;
  @JsonProperty(DtoJsonConstants.CREDIT_AMOUNT)
  private Double creditAmount;
  @JsonProperty(DtoJsonConstants.DEBIT_AMOUNT)
  private Double debitAmount;
  @JsonProperty(DtoJsonConstants.STATUS)
  private String status;

  public Date getTxnDate() {
    return txnDate;
  }

  public void setTxnDate(Date txnDate) {
    this.txnDate = txnDate;
  }

  public String getGatewayOrderId() {
    return gatewayOrderId;
  }

  public void setGatewayOrderId(String gatewayOrderId) {
    this.gatewayOrderId = gatewayOrderId;
  }

  public Double getCreditAmount() {
    return creditAmount;
  }

  public void setCreditAmount(Double creditAmount) {
    this.creditAmount = creditAmount;
  }

  public Double getDebitAmount() {
    return debitAmount;
  }

  public void setDebitAmount(Double debitAmount) {
    this.debitAmount = debitAmount;
  }

  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keys = new ArrayList<String>();
    keys.add(DtoJsonConstants.TXN_DATE);
    keys.add(DtoJsonConstants.GATEWAY_ORDER_ID);
    keys.add(DtoJsonConstants.CREDIT_AMOUNT);
    keys.add(DtoJsonConstants.DEBIT_AMOUNT);
    keys.add(DtoJsonConstants.STATUS);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = new ArrayList<Object>();
    values.add(this.txnDate);
    values.add(this.gatewayOrderId);
    values.add(this.creditAmount);
    values.add(this.debitAmount);
    values.add(this.status);
    return values;
  }
}
