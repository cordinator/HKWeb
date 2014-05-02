package com.hk.api.response.ui.base.tags;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class BrandTag extends AbstractTag {

  @JsonProperty(DtoJsonConstants.CAT_PREFIX)
  private String catPrefix;


  public String getCatPrefix() {
    return catPrefix;
  }

  public void setCatPrefix(String catPrefix) {
    this.catPrefix = catPrefix;
  }
}
