package com.hk.api.response.variant.image;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class VariantImage {

  @JsonProperty(DtoJsonConstants.ALT_TEXT)
  private String altText;
  @JsonProperty(DtoJsonConstants.CAPTION)
  private String caption;
  @JsonProperty(DtoJsonConstants.IMG_T_LINK)
  private String tlink;
  @JsonProperty(DtoJsonConstants.IMG_XT_LINK)
  private String xtlink;
  @JsonProperty(DtoJsonConstants.IMG_XXT_LINK)
  private String xxtlink;
  @JsonProperty(DtoJsonConstants.IMG_S_LINK)
  private String slink;
  @JsonProperty(DtoJsonConstants.IMG_L_LINK)
  private String llink;
  @JsonProperty(DtoJsonConstants.IMG_XXL_LINK)
  private String xxlink;

  @JsonProperty(DtoJsonConstants.FALLBACK)
  private boolean fallbackImage;


  public String getAltText() {
    return altText;
  }

  public void setAltText(String altText) {
    this.altText = altText;
  }

  public String getCaption() {
    return caption;
  }

  public void setCaption(String caption) {
    this.caption = caption;
  }

  public String getLlink() {
    return llink;
  }

  public void setLlink(String llink) {
    this.llink = llink;
  }

  public String getXxlink() {
    return xxlink;
  }

  public void setXxlink(String xxlink) {
    this.xxlink = xxlink;
  }

  public boolean isFallbackImage() {
    return fallbackImage;
  }

  public void setFallbackImage(boolean fallbackImage) {
    this.fallbackImage = fallbackImage;
  }

  public String getXxtlink() {
    return xxtlink;
  }

  public void setXxtlink(String xxtlink) {
    this.xxtlink = xxtlink;
  }

  public String getSlink() {
    return slink;
  }

  public void setSlink(String slink) {
    this.slink = slink;
  }

  public String getTlink() {
    return tlink;
  }

  public void setTlink(String tlink) {
    this.tlink = tlink;
  }

  public String getXtlink() {
    return xtlink;
  }

  public void setXtlink(String xtlink) {
    this.xtlink = xtlink;
  }
}
