package com.hk.web.resource.ac;

import com.hk.api.response.autocompleter.wrapper.AutoCompleterResponseApiWrapper;
import com.hk.common.constants.RequestConstants;
import com.hk.common.constants.StoreConstants;
import com.hk.pact.service.ac.AutoCompleterService;
import com.hk.web.response.ac.AutoCompleterResponse;
import com.hk.constants.rest.HKWebMessageConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.*;

/**
 * @author Rimal
 */
@Component
@Path("/ac/")
public class AutoCompleterResource {

  public static final String DEFAULT_NO_OF_RESULTS_STR = "20";

  @Autowired
  private AutoCompleterService autoCompleterService;

  @GET
  @Path("/results")
  @Produces("application/json")
  public AutoCompleterResponse getAutoCompleteResults(@QueryParam(RequestConstants.QUERY) String query,
                                                      @QueryParam(RequestConstants.NO_OF_RESULTS) @DefaultValue(DEFAULT_NO_OF_RESULTS_STR) Long numberOfResults,
                                                      @QueryParam(RequestConstants.STORE_ID) @DefaultValue(StoreConstants.DEFAULT_STORE_ID_STR) Long storeId) {

    AutoCompleterResponse autoCompleterResponse = new AutoCompleterResponse();
    AutoCompleterResponseApiWrapper autoCompleterResponseApiWrapper = getAutoCompleterService().getAutoCompleterResponse(query, numberOfResults, storeId);

    if (autoCompleterResponseApiWrapper != null) {
      autoCompleterResponse = new AutoCompleterResponse(autoCompleterResponseApiWrapper.getAutoCompleterApiResponse());

    } else {
      autoCompleterResponse.setException(true).addMessage(HKWebMessageConstants.ERROR);
    }

    return autoCompleterResponse;

  }

  public AutoCompleterService getAutoCompleterService() {
    return autoCompleterService;
  }
}
