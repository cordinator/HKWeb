package com.hk.api.response.autocompleter.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 17, 2013
 * Time: 9:04:59 PM
 */
public class AutoCompleterApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.AC_ITEMS)
  private List<AutoCompleterResponseItem> autoCompleterResponseItems = new ArrayList<AutoCompleterResponseItem>();
  @JsonProperty(DtoJsonConstants.AC_VARIANTS)
  private List<AutoCompleterVariantResponseItem> variantResponseItems = new ArrayList<AutoCompleterVariantResponseItem>();


  public List<AutoCompleterResponseItem> getAutoCompleterResponseItems() {
    return autoCompleterResponseItems;
  }

  public void setAutoCompleterResponseItems(List<AutoCompleterResponseItem> autoCompleterResponseItems) {
    this.autoCompleterResponseItems = autoCompleterResponseItems;
  }

  public List<AutoCompleterVariantResponseItem> getVariantResponseItems() {
    return variantResponseItems;
  }

  public void setVariantResponseItems(List<AutoCompleterVariantResponseItem> variantResponseItems) {
    this.variantResponseItems = variantResponseItems;
  }
}
