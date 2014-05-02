package com.hk.api.response.variant.boughtTogether;

import com.hk.api.response.variant.response.StoreVariantBasicApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.common.json.JSONObject;
import com.hk.constants.rest.HKWebJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;
import java.util.ArrayList;

/**
 * @author Rimal
 */
public class BoughtTogetherVariantData extends JSONObject {

  @JsonProperty(DtoJsonConstants.STORE_VARIANT_ID)
  private Long storeVariantId;
  @JsonProperty(DtoJsonConstants.BOUGHT_TOGETHER_VARIANT)
  private StoreVariantBasicApiResponse boughtTogetherVariant;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private int displayOrder;


  public Long getStoreVariantId() {
    return storeVariantId;
  }

  public void setStoreVariantId(Long storeVariantId) {
    this.storeVariantId = storeVariantId;
  }

  public StoreVariantBasicApiResponse getBoughtTogetherVariant() {
    return boughtTogetherVariant;
  }

  public void setBoughtTogetherVariant(StoreVariantBasicApiResponse boughtTogetherVariant) {
    this.boughtTogetherVariant = boughtTogetherVariant;
  }

  public int getDisplayOrder() {
    return displayOrder;
  }

  public void setDisplayOrder(int displayOrder) {
    this.displayOrder = displayOrder;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keyList = new ArrayList<String>(0);

    keyList.add(HKWebJsonConstants.STORE_VARIANT_ID);
    keyList.add(HKWebJsonConstants.BOUGHT_TOGETHER_VARIANT);
    keyList.add(HKWebJsonConstants.DISPLAY_ORDER);
    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> valueList = new ArrayList<Object>(0);

    valueList.add(this.storeVariantId);
    valueList.add(this.boughtTogetherVariant);
    valueList.add(this.displayOrder);
    return valueList;
  }
}