package com.hk.api.response.ui.base;

import com.hk.api.response.ui.base.breadcrumb.BreadCrumb;
import com.hk.api.response.ui.base.url.UrlIdentifiers;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 6:16:59 PM
 */
public class AbstractPage {


  /*@JsonProperty(DtoJsonConstants.PAGE_ID)
  protected Long id;

  @JsonProperty(DtoJsonConstants.PAGE_TYPE)
  protected Long pageTypeId;
*/
  @JsonProperty(DtoJsonConstants.PAGE_BANNERS)
  protected List<PageBanner> pageBannerList = new ArrayList<PageBanner>(0);
  @JsonProperty(DtoJsonConstants.PAGE_SEO)
  protected SeoContentDTO seoContent;
  @JsonProperty(DtoJsonConstants.PAGE_BREADCRUMBS)
  protected List<BreadCrumb> breadCrumbs = new LinkedList<BreadCrumb>();
  @JsonProperty(DtoJsonConstants.PAGE_CANONICAL_URL)
  protected UrlIdentifiers canonicalUrlIdentifiers;


  /* public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }


  public Long getPageTypeId() {
    return pageTypeId;
  }

  public void setPageTypeId(Long pageTypeId) {
    this.pageTypeId = pageTypeId;
  }*/

  public List<PageBanner> getPageBannerList() {
    return pageBannerList;
  }

  public void setPageBannerList(List<PageBanner> pageBannerList) {
    this.pageBannerList = pageBannerList;
  }

  public SeoContentDTO getSeoContent() {
    return seoContent;
  }

  public void setSeoContent(SeoContentDTO seoContent) {
    this.seoContent = seoContent;
  }

  public List<BreadCrumb> getBreadCrumbs() {
    return breadCrumbs;
  }

  public void setBreadCrumbs(List<BreadCrumb> breadCrumbs) {
    this.breadCrumbs = breadCrumbs;
  }

  public UrlIdentifiers getCanonicalUrlIdentifiers() {
    return canonicalUrlIdentifiers;
  }

  public void setCanonicalUrlIdentifiers(UrlIdentifiers canonicalUrlIdentifiers) {
    this.canonicalUrlIdentifiers = canonicalUrlIdentifiers;
  }
}
