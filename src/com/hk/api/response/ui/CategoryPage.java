package com.hk.api.response.ui;

import com.hk.api.response.menu.MenuNode;
import com.hk.api.response.ui.base.BaseHeaderPage;
import com.hk.api.response.ui.base.tags.CategoryTag;
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
 * Time: 6:28:44 PM
 */
public class CategoryPage extends BaseHeaderPage {


  /*@JsonProperty(DtoJsonConstants.CAT_HEADERS)
  private List<PageCategoryHeader> categoryHeaders = new ArrayList<PageCategoryHeader>();
  @JsonProperty(DtoJsonConstants.VARIANT_HEADERS)
  private List<PageVariantHeader> variantHeaders = new ArrayList<PageVariantHeader>();*/
  @JsonProperty(DtoJsonConstants.MENU_NODES)
  private List<MenuNode> categoryMenuNodes = new ArrayList<MenuNode>(0);
  @JsonProperty(DtoJsonConstants.CATEGORY_TAGS)
  private CategoryTag categoryTag;


  public List<MenuNode> getCategoryMenuNodes() {
    return categoryMenuNodes;
  }

  public void setCategoryMenuNodes(List<MenuNode> categoryMenuNodes) {
    this.categoryMenuNodes = categoryMenuNodes;
  }

  public CategoryTag getCategoryTag() {
    return categoryTag;
  }

  public void setCategoryTag(CategoryTag categoryTag) {
    this.categoryTag = categoryTag;
  }

  public String getCanonicalUrl() {
    UrlIdentifiers canonicalUrlIdentifiers = this.canonicalUrlIdentifiers;
    if (canonicalUrlIdentifiers != null) {
      return LinkManager.getGenericLandingPageUrl(canonicalUrlIdentifiers.getUrlFragment(), canonicalUrlIdentifiers.getNavKey());
    }
    return null;
  }
}
