package com.hk.api.request.cart;

import com.hk.api.request.AbstractUserRequest;
import com.hk.util.HKCollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Set;
import java.util.HashSet;
import java.util.Map;
import java.util.HashMap;

/**
 * @author Rimal
 */
public class RemovePacksFromCartRequest extends AbstractUserRequest {

  private static Logger logger = LoggerFactory.getLogger(RemovePacksFromCartRequest.class);

  private Set<String> packSrcEntityIdToRemoveSet = new HashSet<String>(0);

  public RemovePacksFromCartRequest() {
  }

  public boolean validate() {
    return super.validate();
  }

  public Set<String> getPackSrcEntityIdToRemoveSet() {
    return packSrcEntityIdToRemoveSet;
  }

  public void setPackSrcEntityIdToRemoveSet(Set<String> packSrcEntityIdToRemoveSet) {
    this.packSrcEntityIdToRemoveSet = packSrcEntityIdToRemoveSet;
  }

  public Map<String, String> getParameters() {
    Map<String, String> params = new HashMap<String, String>();

    params.put("packSrcEntityIdToRemove", HKCollectionUtils.getCollectionAsString(packSrcEntityIdToRemoveSet));
    params.put("storeId", storeId.toString());
    params.put("userId", userId.toString());
    return params;
  }
}