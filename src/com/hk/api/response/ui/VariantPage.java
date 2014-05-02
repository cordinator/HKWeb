package com.hk.api.response.ui;

import com.hk.api.response.ui.base.AbstractPage;
import com.hk.api.response.ui.base.PageContent;
import com.hk.api.response.ui.base.tags.BrandTag;
import com.hk.api.response.ui.base.tags.CategoryTag;
import com.hk.api.response.ui.base.tags.StoreVariantTag;
import com.hk.api.response.ui.base.url.UrlIdentifiers;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.manager.LinkManager;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 6:29:01 PM
 */
public class VariantPage extends AbstractPage {

  @JsonProperty(DtoJsonConstants.PAGE_CONTENT)
  private List<PageContent> pageContents = new ArrayList<PageContent>();
  @JsonProperty(DtoJsonConstants.VARIANT_TAGS)
  private StoreVariantTag storeVariantTag;
  @JsonProperty(DtoJsonConstants.CATEGORY_TAGS)
  private CategoryTag categoryTag;
  @JsonProperty(DtoJsonConstants.BRAND_TAGS)
  private BrandTag brandTag;


  public List<PageContent> getPageContents() {
    return pageContents;
  }

  public void setPageContents(List<PageContent> pageContents) {
    this.pageContents = pageContents;
  }

  public StoreVariantTag getStoreVariantTag() {
    return storeVariantTag;
  }

  public void setStoreVariantTag(StoreVariantTag storeVariantTag) {
    this.storeVariantTag = storeVariantTag;
  }

  public CategoryTag getCategoryTag() {
    return categoryTag;
  }

  public void setCategoryTag(CategoryTag categoryTag) {
    this.categoryTag = categoryTag;
  }

  public BrandTag getBrandTag() {
    return brandTag;
  }

  public void setBrandTag(BrandTag brandTag) {
    this.brandTag = brandTag;
  }

  public String getCanonicalUrl() {
    UrlIdentifiers canonicalUrlIdentifiers = this.canonicalUrlIdentifiers;
    if (canonicalUrlIdentifiers != null) {
      return LinkManager.getVariantLandingPageUrl(canonicalUrlIdentifiers.getNavKey(), canonicalUrlIdentifiers.getUrlFragment());
    }
    return null;
  }
}
