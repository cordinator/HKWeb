package com.hk.api.response.ui.base;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 6:19:11 PM
 */
public class PageBanner {

  @JsonProperty(DtoJsonConstants.TYPE)
  private String type;
  @JsonProperty(DtoJsonConstants.PAGE_BANNER_SLOTS)
  private Map<String, PageBannerSlot> slotToBanner = new HashMap<String, PageBannerSlot>(0);


  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public Map<String, PageBannerSlot> getSlotToBanner() {
    return slotToBanner;
  }

  public void setSlotToBanner(Map<String, PageBannerSlot> slotToBanner) {
    this.slotToBanner = slotToBanner;
  }
}


