package com.hk.api.request.cart;

import com.hk.api.request.AbstractUserRequest;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 16, 2013
 * Time: 5:10:45 PM
 */
public class AddPackToCartRequest extends AbstractUserRequest {

  private static Logger logger = LoggerFactory.getLogger(AddPackToCartRequest.class);

  private Long packId;
  private Set<Long> storeVariantIds = new HashSet<Long>(0);

  private String storeVariantIdsInPackStr;
  private Long qty;

  public AddPackToCartRequest() {

  }


  public boolean validate() {
    boolean valid = super.validate();
    if (valid) {
      if (packId == null) {
        logger.error("Error validating" + this.getClass().getSimpleName() + " packId cannot be null");
        valid = false;
      }

      if (valid && StringUtils.isBlank(storeVariantIdsInPackStr)) {
        logger.error("Error validating" + this.getClass().getSimpleName() + " storeVariantIdsInPackStr cannot be null");
        valid = false;
      }

      if (valid && qty < 0) {
        logger.error("Error validating" + this.getClass().getSimpleName() + " qty cannot be less than 0");
        valid = false;
      }
    }

    return valid;
  }

  public Long getPackId() {
    return packId;
  }

  public void setPackId(Long packId) {
    this.packId = packId;
  }

  public Set<Long> getStoreVariantIds() {
    return storeVariantIds;
  }

  public void setStoreVariantIds(Set<Long> storeVariantIds) {
    this.storeVariantIds = storeVariantIds;
  }

  public Long getQty() {
    return qty;
  }

  public void setQty(Long qty) {
    this.qty = qty;
  }

  public String getStoreVariantIdsInPackStr() {
    return storeVariantIdsInPackStr;
  }

  public void setStoreVariantIdsInPackStr(String storeVariantIdsInPackStr) {
    this.storeVariantIdsInPackStr = storeVariantIdsInPackStr;
  }

  public Map<String, String> getParameters() {
    Map<String, String> params = new HashMap<String, String>();
    params.put("packId", packId.toString());
    params.put("storeVariantIdsInPackStr", storeVariantIdsInPackStr);
    params.put("quantity", qty.toString());
    params.put("storeId", storeId.toString());
    params.put("userId", userId.toString());
    return params;
  }
}
