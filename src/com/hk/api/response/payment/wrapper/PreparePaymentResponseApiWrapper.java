package com.hk.api.response.payment.wrapper;

import com.hk.api.response.payment.response.PreparePaymentResponse;
import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 24, 2013
 * Time: 2:25:14 PM
 */
public class PreparePaymentResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private PreparePaymentResponse preparePaymentResponse;


  public PreparePaymentResponse getOrderPreparedForPurchaseResponse() {
    return preparePaymentResponse;
  }

  public void setOrderPreparedForPurchaseResponse(PreparePaymentResponse preparePaymentResponse) {
    this.preparePaymentResponse = preparePaymentResponse;
  }
}
