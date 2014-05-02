package com.hk.api.response.ui.base;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.*;

/**
 * @author Rimal
 */
public class PageBannerSlot {

  @JsonProperty(DtoJsonConstants.VIEW)
  private String view;
  @JsonProperty(DtoJsonConstants.SLOT)
  private String slot;
  @JsonProperty(DtoJsonConstants.HEIGHT)
  private Long height;
  @JsonProperty(DtoJsonConstants.WIDTH)
  private Long width;

  @JsonProperty(DtoJsonConstants.IMAGES)
  private List<PageBannerSlotImage> bannerSlotImages = new LinkedList<PageBannerSlotImage>();


  public String getView() {
    return view;
  }

  public void setView(String view) {
    this.view = view;
  }

  public String getSlot() {
    return slot;
  }

  public void setSlot(String slot) {
    this.slot = slot;
  }

  public Long getHeight() {
    return height;
  }

  public void setHeight(Long height) {
    this.height = height;
  }

  public Long getWidth() {
    return width;
  }

  public void setWidth(Long width) {
    this.width = width;
  }

  public List<PageBannerSlotImage> getBannerSlotImages() {
    return bannerSlotImages;
  }

  public void setBannerSlotImages(List<PageBannerSlotImage> bannerSlotImages) {
    this.bannerSlotImages = bannerSlotImages;
  }
}
