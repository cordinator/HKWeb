package com.hk.api.response.variant.attribute;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Sep 24, 2013
 * Time: 3:43:51 PM
 */
public class VariantDetailGroupValueImageDTO {


  @JsonProperty(DtoJsonConstants.ALT_TEXT)
  private String altText;
  @JsonProperty(DtoJsonConstants.CAPTION)
  private String caption;
  @JsonProperty(DtoJsonConstants.IMG_O_LINK)
  private String olink;


  public VariantDetailGroupValueImageDTO() {
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

    public String getOlink() {
        return olink;
    }

    public void setOlink(String olink) {
        this.olink = olink;
    }
}
