package com.hk.api.response.user.wrapper.url;


import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.api.response.user.response.url.UrlRedirectionApiResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

public class UrlRedirectionResponseWrapper extends AbstractBaseResponseApiWrapper{

  @JsonProperty(DtoJsonConstants.RESULTS)
  private UrlRedirectionApiResponse urlRedirectionApiResponse;

  public UrlRedirectionApiResponse getUrlRedirectionApiResponse() {
    return urlRedirectionApiResponse;
  }

  public void setUrlRedirectionApiResponse(UrlRedirectionApiResponse urlRedirectionApiResponse) {
    this.urlRedirectionApiResponse = urlRedirectionApiResponse;
  }
}
