package com.hk.web.action.beta.microsite;

import com.hk.api.response.variant.response.MultipleVariantApiResponse;
import com.hk.api.response.variant.response.StoreVariantApiResponse;
import com.hk.impl.service.ServiceLocatorFactory;
import com.hk.pact.service.variant.StoreVariantService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Nov 7, 2013
 * Time: 5:33:41 PM
 */
public class MicrositeCatalogBean {


  private String vid;

  private List<StoreVariantApiResponse> variants = new ArrayList<StoreVariantApiResponse>(0);


  public String getFunc() {
    System.out.println("----------------------------------------------------------------vid: **************************" + vid);

    MultipleVariantApiResponse multipleVariantApiResponse = getStoreVariantService().getStoreVariants(vid);

    if (multipleVariantApiResponse != null) {
      variants = multipleVariantApiResponse.getVariantApiResponses();
    }

    return "";
  }


  private StoreVariantService getStoreVariantService() {
    return ServiceLocatorFactory.getService(StoreVariantService.class);
  }


  /*public void setFunc(String func) {
   
  }*/

  public String getVid() {
    return vid;
  }

  public void setVid(String vid) {
    this.vid = vid;
  }

  public List<StoreVariantApiResponse> getVariants() {
    return variants;
  }

  public void setVariants(List<StoreVariantApiResponse> variants) {
    this.variants = variants;
  }
}
