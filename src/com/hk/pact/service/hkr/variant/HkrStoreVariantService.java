package com.hk.pact.service.hkr.variant;

import com.hk.api.response.hkr.deliveryDate.HkrDeliveryDateResponse;
import com.hk.api.response.hkr.variant.freebie.HkrFreeVariantResponse;
import com.hk.api.response.hkr.variant.combo.HkrComboResponse;

import java.util.Date;

/**
 * @author Rimal
 */
public interface HkrStoreVariantService {

  public HkrFreeVariantResponse getFreeVariantForStoreVariant(String oldVariantId);

  public HkrComboResponse getCombosForStoreVariant(String oldVariantId, Long numberOfResults);

  public HkrDeliveryDateResponse getEstimatedDeliveryDate(String pincode,String oldVariantId);
}