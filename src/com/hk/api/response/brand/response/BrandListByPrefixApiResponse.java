package com.hk.api.response.brand.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.brand.BrandListByPrefix;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class BrandListByPrefixApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.BRANDS_BY_PREFIXES)
  private List<BrandListByPrefix> brandListByPrefixList = new ArrayList<BrandListByPrefix>(0);


  public List<BrandListByPrefix> getBrandListByPrefixList() {

    return brandListByPrefixList;
  }

  public void setBrandListByPrefixList(List<BrandListByPrefix> brandListByPrefixList) {
    this.brandListByPrefixList = brandListByPrefixList;
  }
}
