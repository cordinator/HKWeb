package com.hk.api.response.brand.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.ui.BrandPage;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Sep 12, 2013
 * Time: 5:09:41 PM
 */
public class BrandPageApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.PAGE)
  private BrandPage brandPage;


  public BrandPage getBrandPage() {
    return brandPage;
  }

  public void setBrandPage(BrandPage brandPage) {
    this.brandPage = brandPage;
  }
}