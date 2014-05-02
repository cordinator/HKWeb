package com.hk.pact.service.ac;

import com.hk.api.response.autocompleter.wrapper.AutoCompleterResponseApiWrapper;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 2, 2013
 * Time: 5:32:03 PM
 */
public interface AutoCompleterService {

  public static final int BRAND_RESULT_TYPE = 1;
  public static final int CAT_RESULT_TYPE = 2;
  public static final int BRAND_CAT_RESULT_TYPE = 3;
  public static final int VARIANT_NM_TERM_RESULT_TYPE = 4;
  public static final int VARIANT_NM_PREFIX_TYPE = 5;
  public static final int VARIANT_NM_FUZZY_TYPE = 6;
  public static final int TERM_DESC_TYPE = 7;

  public AutoCompleterResponseApiWrapper getAutoCompleterResponse(String input, Long noOfResults, Long storeId);
}
