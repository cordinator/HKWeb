package com.hk.pact.service.variant;

import com.hk.web.response.variant.compare.StoreVariantToCompareResponse;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Oct 14, 2013
 * Time: 7:40:26 PM
 */
public interface StoreVariantCompareService {


  public StoreVariantToCompareResponse addVariantToCompare(Long storeVariantId, String sessionIdentifierId);

  public StoreVariantToCompareResponse removeVariantToCompare(Long storeVariantId, String sessionIdentifierId);


  public StoreVariantToCompareResponse removeAllVariantsToCompare(String sessionIdentifierId);

  public StoreVariantToCompareResponse getAllVariantsToCompare(String sessionIdentifierId);


}
