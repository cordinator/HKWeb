package com.hk.api.response.payment;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.common.json.JSONObject;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Shrey
 * Date: 7/2/13
 * Time: 5:17 PM
 * To change this template use File | Settings | File Templates.
 */
public class IssuerDto{

  @JsonProperty(DtoJsonConstants.ISSUER_NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.PRIORITY)
  private long priority;
  @JsonProperty(DtoJsonConstants.ISSUER_IDENTIFIER)
  private String issuerIdentifier;
  @JsonProperty(DtoJsonConstants.TAG_LINE)
  private String tagLine;
  @JsonProperty(DtoJsonConstants.IMAGE_URL)
  private String imageUrl;


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public long getPriority() {
    return priority;
  }

  public void setPriority(long priority) {
    this.priority = priority;
  }

  public String getIssuerIdentifier() {
    return issuerIdentifier;
  }

  public void setIssuerIdentifier(String issuerIdentifier) {
    this.issuerIdentifier = issuerIdentifier;
  }

  public String getTagLine() {
    return tagLine;
  }

  public void setTagLine(String tagLine) {
    this.tagLine = tagLine;
  }

  public String getImageUrl() {
    return imageUrl;
  }

  public void setImageUrl(String imageUrl) {
    this.imageUrl = imageUrl;
  }
}
