package com.hk.api.response.ui.base;

import com.hk.api.response.ui.base.header.category.PageCategoryHeader;
import com.hk.api.response.ui.base.header.variant.PageVariantHeader;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class BaseHeaderPage extends AbstractPage {

  @JsonProperty(DtoJsonConstants.CAT_HEADERS)
  private List<PageCategoryHeader> categoryHeaders = new ArrayList<PageCategoryHeader>(0);
  @JsonProperty(DtoJsonConstants.VARIANT_HEADERS)
  private List<PageVariantHeader> variantHeaders = new ArrayList<PageVariantHeader>(0);


  public List<PageCategoryHeader> getCategoryHeaders() {
    return categoryHeaders;
  }

  public void setCategoryHeaders(List<PageCategoryHeader> categoryHeaders) {
    this.categoryHeaders = categoryHeaders;
  }

  public List<PageVariantHeader> getVariantHeaders() {
    return variantHeaders;
  }

  public void setVariantHeaders(List<PageVariantHeader> variantHeaders) {
    this.variantHeaders = variantHeaders;
  }
}
