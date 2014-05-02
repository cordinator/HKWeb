package com.hk.pact.service.payment;

import com.hk.api.response.payment.response.SelectPaymentModeResponse;

import java.util.List;


public interface HKPayPaymentService {

  public List<SelectPaymentModeResponse> getSelectPaymentModeResponseWrapper();

  public String getAmountStr(Double amount);
}
