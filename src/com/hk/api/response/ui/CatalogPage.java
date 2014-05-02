package com.hk.api.response.ui;

import com.hk.api.response.catalog.browse.CategoryBrowseNode;
import com.hk.api.response.ui.base.AbstractPage;
import com.hk.api.response.ui.base.tags.BrandTag;
import com.hk.api.response.ui.base.tags.CategoryTag;
import com.hk.api.response.ui.base.url.UrlIdentifiers;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.manager.LinkManager;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 6:28:33 PM
 */
public class CatalogPage extends AbstractPage {


  @JsonProperty(DtoJsonConstants.CAT_BROWSE_NODE)
  private Set<CategoryBrowseNode> categoryBrowseNodeList;
  @JsonProperty(DtoJsonConstants.BRAND_TAGS)
  private List<BrandTag> brandTagList = new ArrayList<BrandTag>();
  @JsonProperty(DtoJsonConstants.CATEGORY_TAGS)
  private List<CategoryTag> categoryTagList = new ArrayList<CategoryTag>();


  public Set<CategoryBrowseNode> getCategoryBrowseNodeList() {
    return categoryBrowseNodeList;
  }

  public void setCategoryBrowseNodeList(Set<CategoryBrowseNode> categoryBrowseNodeList) {
    this.categoryBrowseNodeList = categoryBrowseNodeList;
  }

  public List<BrandTag> getBrandTagList() {
    return brandTagList;
  }

  public void setBrandTagList(List<BrandTag> brandTagList) {
    this.brandTagList = brandTagList;
  }

  public List<CategoryTag> getCategoryTagList() {
    return categoryTagList;
  }

  public void setCategoryTagList(List<CategoryTag> categoryTagList) {
    this.categoryTagList = categoryTagList;
  }

  public String getCanonicalUrl() {
    UrlIdentifiers canonicalUrlIdentifiers = this.canonicalUrlIdentifiers;
    if (canonicalUrlIdentifiers != null) {
      /*String navKey = canonicalUrlIdentifiers.getNavKey();
      if (StringUtils.isNotBlank(navKey)) {
        if (navKey.contains(PageService.SUB_CATEGORY_LP_IDENTIFIER) || navKey.contains(PageService.CATEGORY_LP_IDENTIFIER)) {
          return LinkManager.getGenericLandingPageUrl(canonicalUrlIdentifiers.getUrlFragment(), navKey);
        }
      }*/
      return LinkManager.getGenericLandingPageUrl(canonicalUrlIdentifiers.getUrlFragment(), canonicalUrlIdentifiers.getNavKey());
    }
    return null;
  }

}
