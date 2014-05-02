package com.hk.web.action.beta.menu;

import com.hk.api.response.menu.MenuNode;
import com.hk.pact.service.menu.MenuService;
import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
@Component
public class StoreMenuAction extends BaseAction {

  private List<MenuNode> menuNodes = new ArrayList<MenuNode>(0);

  @Autowired
  private MenuService menuService;


  @DefaultHandler
  public Resolution pre() {
    menuNodes = getMenuService().getMenu();
    return new ForwardResolution("/includes/menuInclude.jsp");
  }


  /* public Resolution clickMenuItem() {
if (pageTypeId.equals(PageTypeEnum.MENU_LANDING.getId())) {

  // return new RedirectResolution(CatalogActionNew.class).addParameter("menuNodeId", menuNodeId);
  return LinkManager.getRedirectResolutionForMenuLandingPage(navKey);

} else if (pageTypeId.equals(PageTypeEnum.CATEGORY.getId())) {
  Long categoryId = Long.parseLong(pageTypeValue);
  return LinkManager.getRedirectResolutionForCategoryPage(categoryId);

  *//* return new RedirectResolution(CategoryAction.class)
     .addParameter("pageTypeValue", pageTypeValue);*//*
    }


    //TODO: 404 page
    return null;
  }*/


  public List<MenuNode> getMenuNodes() {
    return menuNodes;
  }

  public void setMenuNodes(List<MenuNode> menuNodes) {
    this.menuNodes = menuNodes;
  }


  public MenuService getMenuService() {
    return menuService;
  }

  /*public String getPageTypeValue() {
    return pageTypeValue;
  }

  public void setPageTypeValue(String pageTypeValue) {
    this.pageTypeValue = pageTypeValue;
  }*/
}
