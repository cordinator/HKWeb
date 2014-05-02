package com.hk.api.response.home.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.home.HomePageApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 24, 2013
 * Time: 3:51:14 AM
 */
public class HomePageResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private HomePageApiResponse homePageApiResponse;


  public HomePageApiResponse getHomePageApiResponse() {
    return homePageApiResponse;
  }

  public void setHomePageApiResponse(HomePageApiResponse homePageApiResponse) {
    this.homePageApiResponse = homePageApiResponse;
  }
}