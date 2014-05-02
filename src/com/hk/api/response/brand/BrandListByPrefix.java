package com.hk.api.response.brand;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;

/**
 * @author Rimal
 */
public class BrandListByPrefix {

  @JsonProperty(DtoJsonConstants.PREFIX)
  private String prefix;
  @JsonProperty(DtoJsonConstants.BRAND_LIST)
  private List<Brand> brandDTOList;


  public String getPrefix() {
    return prefix;
  }

  public void setPrefix(String prefix) {
    this.prefix = prefix;
  }

  public List<Brand> getBrandDTOList() {
    return brandDTOList;
  }

  public void setBrandDTOList(List<Brand> brandDTOList) {
    this.brandDTOList = brandDTOList;
  }
}
