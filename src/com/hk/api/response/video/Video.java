package com.hk.api.response.video;

import org.codehaus.jackson.annotate.JsonProperty;
import com.hk.common.constants.DtoJsonConstants;

/**
 * @author Rimal
 */
public class Video {

  @JsonProperty(DtoJsonConstants.URL)
  private String url;
  @JsonProperty(DtoJsonConstants.DESCRIPTION)
  private String description;
  @JsonProperty(DtoJsonConstants.ALT_TEXT)
  private String altText;

  @JsonProperty(DtoJsonConstants.HEIGHT)
  private Long height;
  @JsonProperty(DtoJsonConstants.WIDTH)
  private Long width;


  public String getUrl() {
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getAltText() {
    return altText;
  }

  public void setAltText(String altText) {
    this.altText = altText;
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
}
