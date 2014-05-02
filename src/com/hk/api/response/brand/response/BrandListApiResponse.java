package com.hk.api.response.brand.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.brand.Brand;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class BrandListApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.BRAND_LIST)
  private List<Brand> brandList = new ArrayList<Brand>(0);


  public List<Brand> getBrandList() {
    return brandList;
  }

  public void setBrandList(List<Brand> brandList) {
    this.brandList = brandList;
  }
}
