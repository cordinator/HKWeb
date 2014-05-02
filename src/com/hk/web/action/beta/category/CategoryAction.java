package com.hk.web.action.beta.category;

import com.hk.api.response.category.wrapper.CategoryPageResponseApiWrapper;
import com.hk.api.response.ui.CategoryPage;
import com.hk.impl.service.ui.UrlIdentifierHelper;
import com.hk.pact.service.ui.PageService;
import com.hk.util.analytics.HKAnalyticsUtils;
import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ErrorResolution;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 10, 2013
 * Time: 3:36:54 PM
 */
@Component
public class CategoryAction extends BaseAction {

  private String navKey;
  private CategoryPage categoryPage;

  @Autowired
  private PageService pageService;


  @DefaultHandler
  public Resolution renderCategoryPage() {

    CategoryPageResponseApiWrapper categoryPageResponseWrapper = getPageService().getCategoryPageResponseWrapper(this.navKey);
    if (null != categoryPageResponseWrapper && null != categoryPageResponseWrapper.getCategoryPageApiResponse()) {
      categoryPage = categoryPageResponseWrapper.getCategoryPageApiResponse().getCategoryPage();
    } else {
      //return new ForwardResolution("/pages/404.jsp");
      return new ErrorResolution(404);
    }

    HKAnalyticsUtils.appendItrackerParam(categoryPage, UrlIdentifierHelper.getCategoryPrefixFromNavKey(this.navKey));
/*
    Map<String, PageBanner> apiSlots = categoryPage.getSlotToBanner();
    Map<String, PageBanner> finalSlots = new LinkedHashMap<String, PageBanner>();

    finalSlots.put("one", apiSlots.get("one"));
    finalSlots.put("two", apiSlots.get("two"));
    finalSlots.put("three", apiSlots.get("three"));

    for (Map.Entry<String, PageBanner> finalSlotEntry : finalSlots.entrySet()) {
      PageBanner pageBanner = finalSlotEntry.getValue();

      if (pageBanner != null) {
        for (PageBannerImage pageBannerImage : pageBanner.getBannerImages()) {
          String mLink = pageBannerImage.getMlink();
          mLink = mLink.replace("prod", "stag");
          pageBannerImage.setMlink(mLink);
        }
      }
    }

    categoryPage.setSlotToBanner(finalSlots);
    */
/*for (PageCategoryHeader pageCategoryHeader : categoryPage.getCategoryHeaders()) {
      PageCategoryHeaderImage pageCategoryHeaderImage = pageCategoryHeader.getHeaderImage();

      String mLink = pageCategoryHeaderImage.getMlink();
      mLink = mLink.replace("prod", "stag");
      pageCategoryHeaderImage.setMlink(mLink);
    }*/
/*
*/

    return new ForwardResolution("/pages/category.jsp");
  }

  public PageService getPageService() {
    return pageService;
  }

  public String getNavKey() {
    return navKey;
  }

  public void setNavKey(String navKey) {
    this.navKey = navKey;
  }


  /* public String getPageTypeValue() {
    return pageTypeValue;
  }

  public void setPageTypeValue(String pageTypeValue) {
    this.pageTypeValue = pageTypeValue;
  }*/

  public CategoryPage getCategoryPage() {
    return categoryPage;
  }

  public void setCategoryPage(CategoryPage categoryPage) {
    this.categoryPage = categoryPage;
  }
}
