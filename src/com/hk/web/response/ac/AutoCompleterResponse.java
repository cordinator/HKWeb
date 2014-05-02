package com.hk.web.response.ac;

import com.hk.api.response.autocompleter.response.AutoCompleterApiResponse;
import com.hk.api.response.autocompleter.response.AutoCompleterResponseItem;
import com.hk.api.response.autocompleter.response.AutoCompleterVariantResponseItem;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.response.GenericResponse;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 17, 2013
 * Time: 9:20:21 PM
 */
public class AutoCompleterResponse extends GenericResponse {

  private List<AutoCompleterResponseItem> autoCompleterResponseItems = new ArrayList<AutoCompleterResponseItem>();

  private List<AutoCompleterVariantResponseItem> variantResponseItems = new ArrayList<AutoCompleterVariantResponseItem>();

  public AutoCompleterResponse() {

  }

  public AutoCompleterResponse(AutoCompleterApiResponse autoCompleterApiResponse) {
    if (autoCompleterApiResponse != null) {
      this.autoCompleterResponseItems.addAll(autoCompleterApiResponse.getAutoCompleterResponseItems());
      this.variantResponseItems.addAll(autoCompleterApiResponse.getVariantResponseItems());
    }
  }

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

  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(DtoJsonConstants.AC_ITEMS);
    keys.add(DtoJsonConstants.AC_VARIANTS);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();

    values.add(autoCompleterResponseItems);
    values.add(variantResponseItems);
    return values;
  }
}
