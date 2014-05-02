package com.hk.api.response.user.response.url;


import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.url.UrlRedirectionDTO;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UrlRedirectionApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.URL_REDIRECTION_LIST)
  private List<UrlRedirectionDTO> urlRedirectionDTOList = new ArrayList<UrlRedirectionDTO>();

  @JsonProperty(DtoJsonConstants.URL_REDIRECTION_BY_PID_LIST)
  private Map<String, UrlRedirectionDTO> urlRedirectionVOListByProductId = new HashMap<String, UrlRedirectionDTO>();

  public List<UrlRedirectionDTO> getUrlRedirectionDTOList() {
    return urlRedirectionDTOList;
  }

  public void setUrlRedirectionDTOList(List<UrlRedirectionDTO> urlRedirectionDTOList) {
    this.urlRedirectionDTOList = urlRedirectionDTOList;
  }

  public Map<String, UrlRedirectionDTO> getUrlRedirectionVOListByProductId() {
    return urlRedirectionVOListByProductId;
  }

  public void setUrlRedirectionVOListByProductId(Map<String, UrlRedirectionDTO> urlRedirectionVOListByProductId) {
    this.urlRedirectionVOListByProductId = urlRedirectionVOListByProductId;
  }
}
