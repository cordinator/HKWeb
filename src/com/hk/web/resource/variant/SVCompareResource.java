package com.hk.web.resource.variant;

import com.hk.api.response.variant.compare.StoreVariantToCompare;
import com.hk.common.http.HKSessionHelper;
import com.hk.pact.service.variant.StoreVariantCompareService;
import com.hk.web.response.variant.compare.StoreVariantToCompareResponse;
import org.jboss.resteasy.annotations.cache.NoCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.core.Context;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 23, 2013
 * Time: 1:59:48 PM
 */
@Component
@Path("/variant/compare")
public class SVCompareResource {

  /*private static final int MAX_VARIANTS_FOR_COMPARISON = 4;
  public static final String COMPARISON_SET = "storeVariantCompareSet";*/

  @Autowired
  private StoreVariantCompareService storeVariantCompareService;


  /*private String getSessionIdentifierId(HttpServletRequest httpServletRequest) {
    return httpServletRequest.getSession(false).getId();
  }*/

  @POST
  @Path("/add/")
  @SuppressWarnings("unchecked")
  @NoCache
  public StoreVariantToCompareResponse addVariantToCompare(StoreVariantToCompare storeVariantToCompare, @Context HttpServletRequest httpServletRequest) {
    return getStoreVariantCompareService().addVariantToCompare(storeVariantToCompare.getStoreVariantId(), HKSessionHelper.getSessionIdentifierId(httpServletRequest));
  }


  @POST
  @Path("/remove/")
  @SuppressWarnings("unchecked")
  @NoCache
  public StoreVariantToCompareResponse removeVariantToCompare(StoreVariantToCompare storeVariantToCompare, @Context HttpServletRequest httpServletRequest) {
    return getStoreVariantCompareService().removeVariantToCompare(storeVariantToCompare.getStoreVariantId(), HKSessionHelper.getSessionIdentifierId(httpServletRequest));
  }

  @POST
  @Path("/remove/all/")
  @SuppressWarnings("unchecked")
  @NoCache
  public StoreVariantToCompareResponse removeAllVariantsToCompare(@Context HttpServletRequest httpServletRequest) {
    return getStoreVariantCompareService().removeAllVariantsToCompare(HKSessionHelper.getSessionIdentifierId(httpServletRequest));
  }

  @GET
  @Path("/all/")
  @SuppressWarnings("unchecked")
  @NoCache
  public StoreVariantToCompareResponse getAllVariantsToCompare(@Context HttpServletRequest httpServletRequest) {
    return getStoreVariantCompareService().getAllVariantsToCompare(HKSessionHelper.getSessionIdentifierId(httpServletRequest));
  }


  public StoreVariantCompareService getStoreVariantCompareService() {
    return storeVariantCompareService;
  }
}
