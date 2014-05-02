package com.hk.api.response.pack;

import com.hk.api.response.variant.response.StoreVariantLightApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Rimal
 */
public class PackStoreProduct {

  @JsonProperty(DtoJsonConstants.ALLOWED_VARIANTS)
  private Map<Long, StoreVariantLightApiResponse> allowedVariants = new HashMap<Long, StoreVariantLightApiResponse>(0);

  //TODO: support availVariants in string,string format: flavour:whey:123~false
  @JsonProperty(DtoJsonConstants.AVAILABLE_VARIANTS)
  private Map<String, Long> availableVariants = new HashMap<String, Long>(0);
  @JsonProperty(DtoJsonConstants.PACK_STORE_PRODUCT_OPTIONS)
  private List<PackStoreProductOption> packStoreProductOptions = new ArrayList<PackStoreProductOption>(0);

//  private Map<String, Long> attrDefaultVariantMap = null;


  public Map<Long, StoreVariantLightApiResponse> getAllowedVariants() {
    return allowedVariants;
  }

  public void setAllowedVariants(Map<Long, StoreVariantLightApiResponse> allowedVariants) {
    this.allowedVariants = allowedVariants;
  }

  public Map<String, Long> getAvailableVariants() {
    return availableVariants;
  }

  public void setAvailableVariants(Map<String, Long> availableVariants) {
    this.availableVariants = availableVariants;
  }

  public List<PackStoreProductOption> getPackStoreProductOptions() {
    return packStoreProductOptions;
  }

  public void setPackStoreProductOptions(List<PackStoreProductOption> packStoreProductOptions) {
    this.packStoreProductOptions = packStoreProductOptions;
  }

  /*public Map<String, Long> getAttrDefaultVariantMap() {
    if (attrDefaultVariantMap == null) {
      attrDefaultVariantMap = new HashMap<String, Long>(0);
      for (Map.Entry<String, Long> availVariantEntry : this.availableVariants.entrySet()) {
        List<String> attrValues = Arrays.asList(StringUtils.split(availVariantEntry.getKey(), RequestConstants.FILTER_SEP));
        for (String attrValue : attrValues) {
          attrDefaultVariantMap.put(attrValue, availVariantEntry.getValue());
        }
      }
    }
    return attrDefaultVariantMap;
  }*/
}