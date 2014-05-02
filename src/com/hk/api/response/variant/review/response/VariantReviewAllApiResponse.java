package com.hk.api.response.variant.review.response;

import com.hk.api.response.variant.response.StoreVariantBasicApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class VariantReviewAllApiResponse extends AbstractVariantReviewApiResponse {

  @JsonProperty(DtoJsonConstants.PAGE_NO)
  private int pageNo;

  @JsonProperty(DtoJsonConstants.PER_PAGE)
  private int perPage;

  @JsonProperty(DtoJsonConstants.STORE_VARIANT_BASIC_DETAILS)
  private StoreVariantBasicApiResponse storeVariantBasic;



  public int getPageNo() {
    return pageNo;
  }

  public void setPageNo(int pageNo) {
    this.pageNo = pageNo;
  }

  public int getPerPage() {
    return perPage;
  }

  public void setPerPage(int perPage) {
    this.perPage = perPage;
  }

  public StoreVariantBasicApiResponse getStoreVariantBasic() {
    return storeVariantBasic;
  }

  public void setStoreVariantBasic(StoreVariantBasicApiResponse storeVariantBasic) {
    this.storeVariantBasic = storeVariantBasic;
  }
}
