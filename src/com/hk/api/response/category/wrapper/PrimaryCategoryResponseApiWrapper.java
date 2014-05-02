package com.hk.api.response.category.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.category.response.PrimaryCategoryApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 3, 2013
 * Time: 11:40:32 AM
 */
public class PrimaryCategoryResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private PrimaryCategoryApiResponse primaryCategoryApiResponse;


  public PrimaryCategoryApiResponse getPrimaryCategoryApiResponse() {
    return primaryCategoryApiResponse;
  }

  public void setPrimaryCategoryApiResponse(PrimaryCategoryApiResponse primaryCategoryApiResponse) {
    this.primaryCategoryApiResponse = primaryCategoryApiResponse;
  }
}
