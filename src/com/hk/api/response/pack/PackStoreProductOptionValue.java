package com.hk.api.response.pack;

import org.codehaus.jackson.annotate.JsonProperty;
import com.hk.common.constants.DtoJsonConstants;

/**
 * @author Rimal
 */
public class PackStoreProductOptionValue {

  @JsonProperty(DtoJsonConstants.VALUE)
  private String value;
  @JsonProperty(DtoJsonConstants.FILTER_VALUE)
  private String filterValue;


  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }

  public String getFilterValue() {
    return filterValue;
  }

  public void setFilterValue(String filterValue) {
    this.filterValue = filterValue;
  }
}
