package com.hk.api.response.payment.response;

import org.codehaus.jackson.annotate.JsonProperty;
import com.hk.common.constants.DtoJsonConstants;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 15, 2013
 * Time: 4:26:00 PM
 */
public class CreatePaymentResponse extends PreparePaymentResponse {

  @JsonProperty(DtoJsonConstants.GATEWAY_ORDER_ID)
  private String gatewayOrderId;

  @JsonProperty(DtoJsonConstants.CHECKSUM)
  private String checkSum;


  public String getGatewayOrderId() {
    return gatewayOrderId;
  }

  public void setGatewayOrderId(String gatewayOrderId) {
    this.gatewayOrderId = gatewayOrderId;
  }

  public String getCheckSum() {
    return checkSum;
  }

  public void setCheckSum(String checkSum) {
    this.checkSum = checkSum;
  }
}
