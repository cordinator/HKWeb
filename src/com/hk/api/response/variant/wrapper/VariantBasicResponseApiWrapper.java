package com.hk.api.response.variant.wrapper;

import org.codehaus.jackson.annotate.JsonProperty;
import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.variant.response.StoreVariantBasicApiResponse;
import com.hk.common.constants.DtoJsonConstants;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 23, 2013
 * Time: 3:15:43 PM
 */
public class VariantBasicResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private StoreVariantBasicApiResponse storeVariantBasic;


  public StoreVariantBasicApiResponse getStoreVariantBasic() {
    return storeVariantBasic;
  }

  public void setStoreVariantBasic(StoreVariantBasicApiResponse storeVariantBasic) {
    this.storeVariantBasic = storeVariantBasic;
  }
}
