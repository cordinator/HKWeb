package com.hk.web.response.hkr.freebie;

import com.hk.constants.rest.HKWebJsonConstants;
import com.hk.web.response.GenericResponse;

import java.util.List;

/**
 * @author Rimal
 */
public class HkWebFreebieResponse extends GenericResponse {

  private String variantId;
  private String freebieOldProductId;
  private String freebieName;


  public String getVariantId() {
    return variantId;
  }

  public void setVariantId(String variantId) {
    this.variantId = variantId;
  }

  public String getFreebieOldProductId() {
    return freebieOldProductId;
  }

  public void setFreebieOldProductId(String freebieOldProductId) {
    this.freebieOldProductId = freebieOldProductId;
  }

  public String getFreebieName() {
    return freebieName;
  }

  public void setFreebieName(String freebieName) {
    this.freebieName = freebieName;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keyList = super.getKeys();
    keyList.add(HKWebJsonConstants.FREEBIE_OLD_PRODUCT_ID);
    keyList.add(HKWebJsonConstants.NAME);
    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> valueList = super.getValues();
    valueList.add(this.freebieOldProductId);
    valueList.add(this.freebieName);
    return valueList;
  }
}
