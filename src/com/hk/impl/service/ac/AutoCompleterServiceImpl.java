package com.hk.impl.service.ac;

import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.RequestConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.http.HkHttpClient;
import com.hk.api.response.autocompleter.wrapper.AutoCompleterResponseApiWrapper;
import com.hk.pact.service.ac.AutoCompleterService;
import org.springframework.stereotype.Service;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 2, 2013
 * Time: 5:32:27 PM
 */
@Service
public class AutoCompleterServiceImpl implements AutoCompleterService {

  @Override
  public AutoCompleterResponseApiWrapper getAutoCompleterResponse(String input, Long noOfResults, Long storeId) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.AUTO_COMPLETER)
        .queryParameter(RequestConstants.QUERY, input)
        .queryParameter(RequestConstants.NO_OF_RESULTS, noOfResults.toString());


    return (AutoCompleterResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), AutoCompleterResponseApiWrapper.class);
  }
}
