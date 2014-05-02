package com.hk.api.response.catalog.browse;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.manager.LinkManager;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class CategoryBrowseNode {

  @JsonProperty(DtoJsonConstants.CAT_PREFIX)
  private String categoryPrefix;
  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.NO_PRODUCT)
  private int noOfVariants;
  @JsonProperty(DtoJsonConstants.PRODUCT_NODE)
  private boolean productNode;

  @JsonProperty(DtoJsonConstants.PAGE_ID)
  private Long pageId;
  /*@JsonProperty(DtoJsonConstants.PAGE_TYPE)
  private Long pageTypeId;
  @JsonProperty(DtoJsonConstants.PAGE_TYPE_VAL)
  private String pageTypeValue;*/


  @JsonProperty(DtoJsonConstants.NAV_KEY)
  private String navKey;

  @JsonProperty(DtoJsonConstants.URL_FRAGMENT)
  private String urlFragment;

  @JsonProperty(DtoJsonConstants.CHILDREN)
  private List<CategoryBrowseNode> children = new ArrayList<CategoryBrowseNode>(0);


  public String getCategoryPrefix() {
    return categoryPrefix;
  }

  public void setCategoryPrefix(String categoryPrefix) {
    this.categoryPrefix = categoryPrefix;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getNoOfVariants() {
    return noOfVariants;
  }

  public void setNoOfVariants(int noOfVariants) {
    this.noOfVariants = noOfVariants;
  }

  public boolean isProductNode() {
    return productNode;
  }

  public void setProductNode(boolean productNode) {
    this.productNode = productNode;
  }

  public List<CategoryBrowseNode> getChildren() {
    return children;
  }

  public void setChildren(List<CategoryBrowseNode> children) {
    this.children = children;
  }

  public Long getPageId() {
    return pageId;
  }

  public void setPageId(Long pageId) {
    this.pageId = pageId;
  }

  public String getNavKey() {
    return navKey;
  }

  public void setNavKey(String navKey) {
    this.navKey = navKey;
  }

  public String getUrlFragment() {
    return urlFragment;
  }

  public void setUrlFragment(String urlFragment) {
    this.urlFragment = urlFragment;
  }

  public String getUrl() {
    return LinkManager.getCategoryBrowseNodeUrl(this);
  }

  /*public Long getPageTypeId() {
    return pageTypeId;
  }

  public void setPageTypeId(Long pageTypeId) {
    this.pageTypeId = pageTypeId;
  }

  public String getPageTypeValue() {
    return pageTypeValue;
  }

  public void setPageTypeValue(String pageTypeValue) {
    this.pageTypeValue = pageTypeValue;
  }*/
}
