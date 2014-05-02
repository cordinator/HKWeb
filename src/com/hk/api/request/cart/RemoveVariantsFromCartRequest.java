package com.hk.api.request.cart;

import com.hk.api.request.AbstractUserRequest;
import com.hk.util.HKCollectionUtils;

import java.util.Set;
import java.util.Map;
import java.util.HashMap;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 17, 2013
 * Time: 1:40:50 PM
 */
public class RemoveVariantsFromCartRequest extends AbstractUserRequest {

  private Set<Long> storeVariantsToRemove;

  public RemoveVariantsFromCartRequest() {

  }

  public boolean validate() {
    return super.validate();
  }

  public Set<Long> getStoreVariantsToRemove() {
    return storeVariantsToRemove;
  }

  public void setStoreVariantsToRemove(Set<Long> storeVariantsToRemove) {
    this.storeVariantsToRemove = storeVariantsToRemove;
  }

  public Map<String, String> getParameters() {
    Map<String, String> params = new HashMap<String, String>();
    params.put("storeVariantsToRemove", HKCollectionUtils.getCollectionAsString(storeVariantsToRemove));

    params.put("storeId", storeId.toString());
    params.put("userId", userId.toString());
    return params;
  }
}
