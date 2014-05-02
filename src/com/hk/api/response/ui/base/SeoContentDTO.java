package com.hk.api.response.ui.base;

import org.codehaus.jackson.annotate.JsonProperty;
import com.hk.common.constants.DtoJsonConstants;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jul 24, 2013
 * Time: 3:57:42 AM
 */
public class SeoContentDTO {

  @JsonProperty(DtoJsonConstants.H1)
  private String h1;
  @JsonProperty(DtoJsonConstants.TITLE)
  private String title;
  @JsonProperty(DtoJsonConstants.META_KEYWORD)
  private String metaKeyword;
  @JsonProperty(DtoJsonConstants.META_DESCRIPTION)
  private String metaDescription;
  @JsonProperty(DtoJsonConstants.DESCRIPTION)
  private String description;
  @JsonProperty(DtoJsonConstants.DESCRIPTION_TITLE)
  private String descriptionTitle;


  public SeoContentDTO() {
  }

  public String getH1() {
    return h1;
  }

  public void setH1(String h1) {
    this.h1 = h1;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getMetaKeyword() {
    return metaKeyword;
  }

  public void setMetaKeyword(String metaKeyword) {
    this.metaKeyword = metaKeyword;
  }

  public String getMetaDescription() {
    return metaDescription;
  }

  public void setMetaDescription(String metaDescription) {
    this.metaDescription = metaDescription;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getDescriptionTitle() {
    return descriptionTitle;
  }

  public void setDescriptionTitle(String descriptionTitle) {
    this.descriptionTitle = descriptionTitle;
  }
}
