package com.hk.api.response.url;


import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

public class UrlRedirectionDTO {

  @JsonProperty(DtoJsonConstants.ID)
  private Long id;
  @JsonProperty(DtoJsonConstants.OLD_URL)
  private String oldUrl;
  @JsonProperty(DtoJsonConstants.NEW_URL)
  private String newUrl;
  @JsonProperty(DtoJsonConstants.REDIRECT_STATUS_CODE)
  private Long redirectStatusCode;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getOldUrl() {
    return oldUrl;
  }

  public void setOldUrl(String oldUrl) {
    this.oldUrl = oldUrl;
  }

  public String getNewUrl() {
    return newUrl;
  }

  public void setNewUrl(String newUrl) {
    this.newUrl = newUrl;
  }

  public Long getRedirectStatusCode() {
    return redirectStatusCode;
  }

  public void setRedirectStatusCode(Long redirectStatusCode) {
    this.redirectStatusCode = redirectStatusCode;
  }
}
