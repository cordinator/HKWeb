package com.hk.api.response.menu;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.web.manager.LinkManager;
import org.apache.commons.lang.StringUtils;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class MenuNode {

  /* @JsonProperty(DtoJsonConstants.ID)
private long id;*/
  @JsonProperty(DtoJsonConstants.NAV_KEY)
  private String navKey;

  @JsonProperty(DtoJsonConstants.URL_FRAGMENT)
  private String urlFragment;
  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.DISPLAY_ORDER)
  private int displayOrder;
  @JsonProperty(DtoJsonConstants.DEPTH)
  private int depth;
  @JsonProperty(DtoJsonConstants.HIGHLIGHTER)
  private String higlighter;

  @JsonProperty(DtoJsonConstants.CHILDREN)
  private List<MenuNode> childNodes = new ArrayList<MenuNode>();

  private String url;

  /*public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }*/

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getDisplayOrder() {
    return displayOrder;
  }

  public void setDisplayOrder(int displayOrder) {
    this.displayOrder = displayOrder;
  }

  public int getDepth() {
    return depth;
  }

  public void setDepth(int depth) {
    this.depth = depth;
  }

  public String getHiglighter() {
    return higlighter;
  }

  public void setHiglighter(String higlighter) {
    this.higlighter = higlighter;
  }

  public List<MenuNode> getChildNodes() {
    return childNodes;
  }

  public void setChildNodes(List<MenuNode> childNodes) {
    this.childNodes = childNodes;
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
    if (StringUtils.isBlank(this.url)) {
      return LinkManager.getMenuNodeUrl(this);
    }
    return url;
  }

  public void setUrl(String url) {
    this.url = url;
  }
}