package com.hk.web.response.variant.compare;

import com.hk.api.response.variant.compare.StoreVariantToCompare;
import com.hk.constants.rest.HKWebJsonConstants;
import com.hk.web.response.GenericResponse;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 18, 2013
 * Time: 9:59:34 PM
 */
public class StoreVariantToCompareResponse extends GenericResponse {

  @JsonProperty(com.hk.common.constants.DtoJsonConstants.SV_TO_COMP)
  private Set<StoreVariantToCompare> storeVariantListToCompare = new HashSet<StoreVariantToCompare>();


  public Set<StoreVariantToCompare> getStoreVariantListToCompare() {
    return storeVariantListToCompare;
  }

  public void setStoreVariantListToCompare(Set<StoreVariantToCompare> storeVariantListToCompare) {
    this.storeVariantListToCompare = storeVariantListToCompare;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(HKWebJsonConstants.SV_TO_COMP);
    keys.add(HKWebJsonConstants.SV_TO_COMP_SIZE);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.storeVariantListToCompare);
    if (this.storeVariantListToCompare == null) {
      values.add(0);
    } else {
      values.add(this.storeVariantListToCompare.size());
    }
    return values;
  }
}
