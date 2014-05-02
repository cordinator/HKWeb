package com.hk.api.response.ui;

import com.hk.api.response.ui.base.AbstractPage;
import com.hk.api.response.ui.base.tags.BrandTag;
import com.hk.api.response.ui.base.url.UrlIdentifiers;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.manager.LinkManager;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Sep 12, 2013
 * Time: 5:10:35 PM
 */
public class BrandPage extends AbstractPage {

  @JsonProperty(DtoJsonConstants.BRAND_NAME)
  private String brandName;
  @JsonProperty(DtoJsonConstants.BRAND_TAGS)
  private BrandTag brandTag;


  public String getBrandName() {
    return brandName;
  }

  public void setBrandName(String brandName) {
    this.brandName = brandName;
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
      return LinkManager.getBrandPageUrl(canonicalUrlIdentifiers.getNavKey(), canonicalUrlIdentifiers.getUrlFragment());
    }
    return null;
  }
}
