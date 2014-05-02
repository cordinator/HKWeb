package com.hk.api.response.ui.base;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 6:19:05 PM
 */
public class PageBannerSlotImage {

  @JsonProperty(DtoJsonConstants.CAPTION)
  private String caption;
  @JsonProperty(DtoJsonConstants.ALT_TEXT)
  private String altText;
  @JsonProperty(DtoJsonConstants.WIDTH)
  private Long width;
  @JsonProperty(DtoJsonConstants.HEIGHT)
  private Long height;
  @JsonProperty(DtoJsonConstants.IMG_O_LINK)
  private String olink;
  @JsonProperty(DtoJsonConstants.LANDING_PAGE)
  private String landingPage;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private Long displayOrder;


  public String getCaption() {
    return caption;
  }

  public void setCaption(String caption) {
    this.caption = caption;
  }

  public String getAltText() {
    return altText;
  }

  public void setAltText(String altText) {
    this.altText = altText;
  }

  public Long getWidth() {
    return width;
  }

  public void setWidth(Long width) {
    this.width = width;
  }

  public Long getHeight() {
    return height;
  }

  public void setHeight(Long height) {
    this.height = height;
  }

  public String getLandingPage() {
    return landingPage;
  }

  public void setLandingPage(String landingPage) {
    this.landingPage = landingPage;
  }

  public Long getDisplayOrder() {
    return displayOrder;
  }

  public void setDisplayOrder(Long displayOrder) {
    this.displayOrder = displayOrder;
  }

  public String getOlink() {
    return olink;
  }

  public void setOlink(String olink) {
    this.olink = olink;
  }
}
