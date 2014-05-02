package com.hk.api.response.category.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.ui.base.url.UrlIdentifiers;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;


public class CategoryLinksApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.CAT_LINKS)
  private List<UrlIdentifiers> categoryLinks = new ArrayList<UrlIdentifiers>();

  public List<UrlIdentifiers> getCategoryLinks() {
    return categoryLinks;
  }

  public void setCategoryLinks(List<UrlIdentifiers> categoryLinks) {
    this.categoryLinks = categoryLinks;
  }
}
