package com.hk.api.request.cart;

import com.hk.api.request.AbstractUserRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 25, 2013
 * Time: 10:45:03 PM
 */
public class AddSingleVariantToCartRequest extends AbstractUserRequest {

  private static Logger logger = LoggerFactory.getLogger(AddSingleVariantToCartRequest.class);

  private Long variantId;
  private Long qty;

  private String oldVariantId;

  public AddSingleVariantToCartRequest() {

  }


  public boolean validate() {
    boolean valid = super.validate();
    if (valid) {
      if (variantId == null) {
        logger.error("Error validating" + this.getClass().getSimpleName() + " storeVariantId cannot be null");
        valid = false;
      }

      if (valid && qty <= 0) {
        logger.error("Error validating" + this.getClass().getSimpleName() + " qty cannot be less than 0");
        valid = false;
      }
    }

    return valid;
  }

  public Long getVariantId() {
    return variantId;
  }

  public void setVariantId(Long variantId) {
    this.variantId = variantId;
  }

  public Long getQty() {
    return qty;
  }

  public void setQty(Long qty) {
    this.qty = qty;
  }

  public String getOldVariantId() {
    return oldVariantId;
  }

  public void setOldVariantId(String oldVariantId) {
    this.oldVariantId = oldVariantId;
  }

  public Map<String, String> getParameters() {
    Map<String, String> params = new HashMap<String, String>();
    params.put("storeVariantId", variantId.toString());
    params.put("quantity", qty.toString());
    params.put("storeId", storeId.toString());
    params.put("userId", userId.toString());
    return params;
  }
}
