package com.hk.impl.service.payment;

import com.hk.api.response.payment.response.SelectPaymentModeResponse;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.EnvConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.constants.payment.PaymentGatewayParameters;
import com.hk.pact.service.payment.HKPayPaymentService;
import com.hk.pact.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.NumberFormat;
import java.util.List;

@Service
public class HKPayPaymentServiceImpl implements HKPayPaymentService {

  @Autowired
  private UserService userService;

  public String getAmountStr(Double amount) {
    NumberFormat decimalFormat = NumberFormat.getInstance();
    decimalFormat.setMinimumFractionDigits(2);
    decimalFormat.setMaximumFractionDigits(2);
    decimalFormat.setGroupingUsed(false);
    return decimalFormat.format(amount);
  }

  @Override
  @SuppressWarnings("unchecked")
  public List<SelectPaymentModeResponse> getSelectPaymentModeResponseWrapper() {
    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId == null) {
      //TODO: error page/ login page ??
      return null;
    }
    URIBuilder builder = new URIBuilder().fromURI(EnvConstants.HK_PAY_SERVER_URL, ServiceEndPoints.PAYMENT_MODES + PaymentGatewayParameters.hk_accountId);
    return (List<SelectPaymentModeResponse>) HkHttpClient.executePostForObject(builder.getHKPayWebServiceUrl(), null, List.class);
  }

  public UserService getUserService() {
    return userService;
  }
}
