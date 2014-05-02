package com.hk.api.response.variant.compare.image;

import com.hk.api.response.variant.image.VariantImage;

/**
 * @author Rimal
 */
public class VariantCompareImage {

  private String altText;
  private String caption;
  private String xxtlink;
  private String slink;
  private String llink;


  public VariantCompareImage(VariantImage variantImage) {
    if (variantImage != null) {
      this.altText = variantImage.getAltText();
      this.caption = variantImage.getCaption();
      this.xxtlink = variantImage.getXxtlink();
      this.slink= variantImage.getSlink();
      this.llink = variantImage.getLlink();
    }
  }


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
}
