package com.hk.impl.service.hkr.variant;

import com.hk.api.response.hkr.deliveryDate.HkrDeliveryDateResponse;
import com.hk.api.response.hkr.deliveryDate.HkrDeliveryDateWrapper;
import com.hk.api.response.hkr.variant.combo.HkrComboResponse;
import com.hk.api.response.hkr.variant.combo.HkrComboResponseWrapper;
import com.hk.api.response.hkr.variant.freebie.HkrFreeVariantResponse;
import com.hk.api.response.hkr.variant.freebie.HkrFreeVariantResponseWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.EnvConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.RequestConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.hkr.variant.HkrStoreVariantService;
import com.hk.pact.service.variant.StoreVariantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author Rimal
 */
@Service
public class HkrStoreVariantServiceImpl implements HkrStoreVariantService {

  private static final String FREE_VARIANT = "/freeVariant";
  private static final String COMBOS = "/combos";
  private static final String VARIANT = "/variant/";

  @Autowired
  private StoreVariantService storeVariantService;


  public HkrFreeVariantResponse getFreeVariantForStoreVariant(String oldVariantId) {
    URIBuilder uriBuilder = new URIBuilder().fromURI(EnvConstants.HKR_SERVER_URL, ServiceEndPoints.STORE_VARIANT + oldVariantId + FREE_VARIANT);
    HkrFreeVariantResponseWrapper hkrFreeVariantResponseWrapper = (HkrFreeVariantResponseWrapper) HkHttpClient.executeGet(uriBuilder.getWebServiceUrl(), HkrFreeVariantResponseWrapper.class);

    if (hkrFreeVariantResponseWrapper != null) {
      return hkrFreeVariantResponseWrapper.getHkrFreeVariantResponse();
    }
    return null;
  }

  public HkrComboResponse getCombosForStoreVariant(String oldVariantId, Long numberOfResults) {
    URIBuilder uriBuilder = new URIBuilder().fromURI(EnvConstants.HKR_SERVER_URL, ServiceEndPoints.STORE_VARIANT + oldVariantId + COMBOS);
     if (numberOfResults != null) {
      uriBuilder.queryParameter(RequestConstants.NO_OF_RESULTS, numberOfResults.toString());
    }

    HkrComboResponseWrapper hkrComboResponseWrapper = (HkrComboResponseWrapper) HkHttpClient.executeGet(uriBuilder.getWebServiceUrl(), HkrComboResponseWrapper.class);

    if (hkrComboResponseWrapper != null) {
      return hkrComboResponseWrapper.getHkrComboResponse();
    }
    return null;
  }

    @Override
    public HkrDeliveryDateResponse getEstimatedDeliveryDate(String pincode,String oldVariantId) {
        URIBuilder uriBuilder = new URIBuilder().fromURI(EnvConstants.HKR_SERVER_URL, ServiceEndPoints.PINCODE + pincode + VARIANT + oldVariantId);
        HkrDeliveryDateWrapper hkrDeliveryDateWrapper = (HkrDeliveryDateWrapper) HkHttpClient.executeGet(uriBuilder.getWebServiceUrl(),HkrDeliveryDateWrapper.class);
        if (hkrDeliveryDateWrapper != null) {
            return hkrDeliveryDateWrapper.getHkrDeliveryDateResponse();
        }
        return null;
    }

    public StoreVariantService getStoreVariantService() {
    return storeVariantService;
  }
}