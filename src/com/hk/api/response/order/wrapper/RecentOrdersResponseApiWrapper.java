package com.hk.api.response.order.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.order.response.RecentOrdersApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Aug 2, 2013
 * Time: 1:46:01 PM
 */
public class RecentOrdersResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private RecentOrdersApiResponse recentOrdersApiResponse;


  public RecentOrdersApiResponse getRecentOrdersApiResponse() {
    return recentOrdersApiResponse;
  }

  public void setRecentOrdersApiResponse(RecentOrdersApiResponse recentOrdersApiResponse) {
    this.recentOrdersApiResponse = recentOrdersApiResponse;
  }
}
