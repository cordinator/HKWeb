package com.hk.api.response.ui.base;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 6:19:19 PM
 */
public class PageContent {


  @JsonProperty(DtoJsonConstants.CONTENT_TYPE)
  private String contentType;
  @JsonProperty(DtoJsonConstants.VALUE)
  private String value;
  @JsonProperty(DtoJsonConstants.SLOT)
  private String slot;
  @JsonProperty(DtoJsonConstants.IDENTIFIER)
  private String identifier;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private int displayOrder;


  public String getContentType() {
    return contentType;
  }

  public void setContentType(String contentType) {
    this.contentType = contentType;
  }

  public String getValue() {
    return value;
  }

  public void setValue(String value) {
    this.value = value;
  }

  public String getSlot() {
    return slot;
  }

  public void setSlot(String slot) {
    this.slot = slot;
  }

  public String getIdentifier() {
    return identifier;
  }

  public void setIdentifier(String identifier) {
    this.identifier = identifier;
  }

  public int getDisplayOrder() {
    return displayOrder;
  }

  public void setDisplayOrder(int displayOrder) {
    this.displayOrder = displayOrder;
  }
}
