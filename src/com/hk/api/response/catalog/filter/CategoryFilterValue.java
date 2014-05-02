package com.hk.api.response.catalog.filter;

import org.codehaus.jackson.annotate.JsonProperty;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import com.hk.common.constants.DtoJsonConstants;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 8, 2013
 * Time: 11:22:05 AM
 */
public class CategoryFilterValue {


  @JsonProperty(DtoJsonConstants.DISPLAY_VALUE)
  private String value;
  @JsonProperty(DtoJsonConstants.FILTER_VALUE)
  private String filterValue;     // this is the internal value to be used

  @JsonProperty(DtoJsonConstants.NO_PRODUCT)
  private int noOfVariants;

  @JsonProperty(DtoJsonConstants.SELECTED)
  private boolean selected;


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

  public int getNoOfVariants() {
    return noOfVariants;
  }

  public void setNoOfVariants(int noOfVariants) {
    this.noOfVariants = noOfVariants;
  }

  public boolean isSelected() {
    return selected;
  }

  public void setSelected(boolean selected) {
    this.selected = selected;
  }


  @Override
  public boolean equals(Object obj) {

    if (obj == null) {
      return false;
    }

    if (obj instanceof CategoryFilterValue == false) {
      return false;
    }

    if (this == obj)
      return true;

    CategoryFilterValue categoryFilterValue = (CategoryFilterValue) obj;

    if (StringUtils.isNotBlank(filterValue) && StringUtils.isNotBlank(categoryFilterValue.getFilterValue())) {
      return new EqualsBuilder().append(this.filterValue, categoryFilterValue.getFilterValue()).isEquals();
    }

    return false;

  }

  @Override
  public int hashCode() {
    return new HashCodeBuilder().append(this.filterValue).toHashCode();
  }
}
