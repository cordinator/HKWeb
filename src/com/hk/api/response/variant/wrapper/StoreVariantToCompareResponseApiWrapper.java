package com.hk.api.response.variant.wrapper;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.response.variant.compare.StoreVariantToCompareResponse;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Oct 14, 2013
 * Time: 7:49:22 PM
 */
public class StoreVariantToCompareResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private StoreVariantToCompareResponse storeVariantToCompareResponse;


  public StoreVariantToCompareResponse getStoreVariantToCompareResponse() {
    return storeVariantToCompareResponse;
  }

  public void setStoreVariantToCompareResponse(StoreVariantToCompareResponse storeVariantToCompareResponse) {
    this.storeVariantToCompareResponse = storeVariantToCompareResponse;
  }
}
