package com.hk.api.response.ui.base.header.category;

import org.codehaus.jackson.annotate.JsonProperty;
import com.hk.common.constants.DtoJsonConstants;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 6:17:34 PM
 */
public class PageCategoryHeaderImage {


  @JsonProperty(DtoJsonConstants.ALT_TEXT)
  private String altText;
  @JsonProperty(DtoJsonConstants.CAPTION)
  private String caption;
  @JsonProperty(DtoJsonConstants.IMG_O_LINK)
  private String olink;


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
