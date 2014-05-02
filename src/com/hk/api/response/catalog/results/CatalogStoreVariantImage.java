package com.hk.api.response.catalog.results;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 11:59:19 PM
 */
public class CatalogStoreVariantImage {


  @JsonProperty(com.hk.common.constants.DtoJsonConstants.ALT_TEXT)
  private String altText;
  @JsonProperty(com.hk.common.constants.DtoJsonConstants.CAPTION)
  private String caption;
  @JsonProperty(com.hk.common.constants.DtoJsonConstants.IMG_XXT_LINK)
  private String xxtLink;
  @JsonProperty(com.hk.common.constants.DtoJsonConstants.IMG_S_LINK)
  private String slink;

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

  public String getSlink() {
    return slink;
  }

  public void setSlink(String slink) {
    this.slink = slink;
  }

  public String getXxtLink() {
    return xxtLink;
  }

  public void setXxtLink(String xxtLink) {
    this.xxtLink = xxtLink;
  }
}
