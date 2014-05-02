package com.hk.api.response.home;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.ui.HomePage;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 24, 2013
 * Time: 3:49:52 AM
 */
public class HomePageApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.PAGE)
  private HomePage homePage;


  public HomePage getHomePage() {
    return homePage;
  }

  public void setHomePage(HomePage homePage) {
    this.homePage = homePage;
  }
}
