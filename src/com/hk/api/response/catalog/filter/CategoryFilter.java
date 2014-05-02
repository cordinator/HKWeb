package com.hk.api.response.catalog.filter;

import com.hk.common.constants.DtoJsonConstants;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 5, 2013
 * Time: 7:31:41 PM
 */
public class CategoryFilter {

  @JsonProperty(DtoJsonConstants.NAME)
  private String name;    //internal name
  @JsonProperty(DtoJsonConstants.FILTER_NAME)
  private String filterName;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private int displayOrder;

  @JsonProperty(DtoJsonConstants.FILTER_VALUES)
  private List<CategoryFilterValue> filterValues = new ArrayList<CategoryFilterValue>();


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getFilterName() {
    return filterName;
  }

  public void setFilterName(String filterName) {
    this.filterName = filterName;
  }

  public int getDisplayOrder() {
    return displayOrder;
  }

  public void setDisplayOrder(int displayOrder) {
    this.displayOrder = displayOrder;
  }

  public List<CategoryFilterValue> getFilterValues() {
    return filterValues;
  }

  public void setFilterValues(List<CategoryFilterValue> filterValues) {
    this.filterValues = filterValues;
  }

  @Override
  public boolean equals(Object obj) {

    if (obj == null) {
      return false;
    }

    if (obj instanceof CategoryFilter == false) {
      return false;
    }

    if (this == obj)
      return true;

    CategoryFilter browseNodeFilter = (CategoryFilter) obj;

    if (StringUtils.isNotBlank(name) && StringUtils.isNotBlank(browseNodeFilter.getName())) {
      return new EqualsBuilder().append(this.name, browseNodeFilter.getName()).isEquals();
    }

    return false;

  }

  @Override
  public int hashCode() {
    return new HashCodeBuilder().append(this.name).toHashCode();
  }

}
