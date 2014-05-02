package com.hk.api.response.menu;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 18, 2013
 * Time: 3:42:29 PM
 */
public class MenuResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.TOP_LEVEL_MENU_NODES)
  private List<MenuNode> menuNodes;

  public List<MenuNode> getMenuNodes() {
    return menuNodes;
  }

  public void setMenuNodes(List<MenuNode> menuNodes) {
    this.menuNodes = menuNodes;
  }
}
