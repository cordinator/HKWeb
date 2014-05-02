package com.hk.impl.service.variant;

import com.hk.api.response.variant.wrapper.StoreVariantToCompareResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.user.UserService;
import com.hk.pact.service.variant.StoreVariantCompareService;
import com.hk.web.response.variant.compare.StoreVariantToCompareResponse;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Oct 14, 2013
 * Time: 7:42:07 PM
 */
@Service
public class StoreVariantCompareServiceImpl implements StoreVariantCompareService {


  private static final String ADD_TO_COMPARE = "add/";
  private static final String REMOVE_FROM_COMPARE = "remove/";
  private static final String GET_ALL_COMPARE = "all/";
  private static final String REMOVE_ALL_COMPARE = "remove/all";


  @Autowired
  private UserService userService;

  @Override
  public StoreVariantToCompareResponse addVariantToCompare(Long storeVariantId, String sessionIdentifierId) {

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.STORE_VARIANT_COMPARE + ADD_TO_COMPARE);

    Map<String, String> params = getBaseParamsForCompareReq(sessionIdentifierId);

    if (storeVariantId != null) {
      params.put("storeVariantId", storeVariantId.toString());
    }

    StoreVariantToCompareResponseApiWrapper storeVariantToCompareResponseApiWrapper =
        (StoreVariantToCompareResponseApiWrapper) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), params, StoreVariantToCompareResponseApiWrapper.class);
    if (storeVariantToCompareResponseApiWrapper != null) {
      return storeVariantToCompareResponseApiWrapper.getStoreVariantToCompareResponse();
    }

    return null;
  }

  @Override
  public StoreVariantToCompareResponse removeVariantToCompare(Long storeVariantId, String sessionIdentifierId) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.STORE_VARIANT_COMPARE + REMOVE_FROM_COMPARE);

    Map<String, String> params = getBaseParamsForCompareReq(sessionIdentifierId);

    if (storeVariantId != null) {
      params.put("storeVariantId", storeVariantId.toString());
    }

    StoreVariantToCompareResponseApiWrapper storeVariantToCompareResponseApiWrapper =
        (StoreVariantToCompareResponseApiWrapper) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), params, StoreVariantToCompareResponseApiWrapper.class);
    if (storeVariantToCompareResponseApiWrapper != null) {
      return storeVariantToCompareResponseApiWrapper.getStoreVariantToCompareResponse();
    }

    return null;
  }

  @Override
  public StoreVariantToCompareResponse removeAllVariantsToCompare(String sessionIdentifierId) {
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.STORE_VARIANT_COMPARE + REMOVE_ALL_COMPARE);

    Map<String, String> params = getBaseParamsForCompareReq(sessionIdentifierId);
    StoreVariantToCompareResponseApiWrapper storeVariantToCompareResponseApiWrapper =
        (StoreVariantToCompareResponseApiWrapper) HkHttpClient.executePostForObject(builder.getWebServiceUrl(), params, StoreVariantToCompareResponseApiWrapper.class);
    if (storeVariantToCompareResponseApiWrapper != null) {
      return storeVariantToCompareResponseApiWrapper.getStoreVariantToCompareResponse();
    }

    return null;
  }

  @Override
  public StoreVariantToCompareResponse getAllVariantsToCompare(String sessionIdentifierId) {
    String tokenToAdd;
    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId != null) {
      tokenToAdd = loggedInUserId.toString();
    } else {
      tokenToAdd = sessionIdentifierId;
    }

    StoreVariantToCompareResponseApiWrapper storeVariantToCompareResponseApiWrapper = new StoreVariantToCompareResponseApiWrapper();

    if (StringUtils.isBlank(tokenToAdd)) {
      return storeVariantToCompareResponseApiWrapper.getStoreVariantToCompareResponse();
    }
    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.STORE_VARIANT_COMPARE + GET_ALL_COMPARE + StoreConstants.DEFAULT_STORE_ID_STR + URIBuilder.URL_TOKEN_SEP
        + tokenToAdd);

    storeVariantToCompareResponseApiWrapper = (StoreVariantToCompareResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), StoreVariantToCompareResponseApiWrapper.class);
    if (storeVariantToCompareResponseApiWrapper != null) {
      return storeVariantToCompareResponseApiWrapper.getStoreVariantToCompareResponse();
    }

    return null;
  }


  private Map<String, String> getBaseParamsForCompareReq(String sessionIdentifierId) {
    Map<String, String> params = new HashMap<String, String>();
    Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId != null) {
      params.put("compareUserId", loggedInUserId.toString());
    } else if (StringUtils.isNotBlank(sessionIdentifierId)) {
      params.put("compareUserId", sessionIdentifierId);
    }
    params.put("storeId", StoreConstants.DEFAULT_STORE_ID_STR);

    return params;
  }

  public UserService getUserService() {
    return userService;
  }
}
