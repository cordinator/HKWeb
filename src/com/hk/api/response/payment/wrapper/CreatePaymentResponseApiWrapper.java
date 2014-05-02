package com.hk.api.response.payment.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.payment.response.CreatePaymentResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 15, 2013
 * Time: 4:29:48 PM
 */
public class CreatePaymentResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private CreatePaymentResponse createPaymentResponse;


  public CreatePaymentResponse getCreatePaymentResponse() {
    return createPaymentResponse;
  }

  public void setCreatePaymentResponse(CreatePaymentResponse createPaymentResponse) {
    this.createPaymentResponse = createPaymentResponse;
  }
}
