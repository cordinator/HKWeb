package com.hk.web.action.beta.home;

import com.hk.api.response.home.wrapper.HomePageResponseApiWrapper;
import com.hk.api.response.ui.HomePage;
import com.hk.api.response.user.response.UserApiResponse;
import com.hk.pact.service.ui.PageService;
import com.hk.pact.service.user.UserService;
import com.hk.util.analytics.HKAnalyticsUtils;
import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 15, 2013
 * Time: 11:58:32 AM
 */
@Component
public class HomeAction extends BaseAction {

  private HomePage homePage;

  @Autowired
  private PageService pageService;
  @Autowired
  private UserService userService;

  @DefaultHandler
  public Resolution pre() {
    Long loggedInUserId = userService.getLoggedInUserId();
    System.out.println(loggedInUserId);
    if (loggedInUserId != null) {
      UserApiResponse userApiResponse = userService.getUserResponseById(loggedInUserId);
      if (userApiResponse != null) {
        System.out.println(userApiResponse.getLogin());
        System.out.println(userApiResponse.getName());
        System.out.println(userApiResponse.getRoles());
      }
    }
//    System.out.println(getPrincipal().getFirstName());
    HomePageResponseApiWrapper homePageResponseApiWrapper = getPageService().getHomePageResponseApiWrapper();
    if (null != homePageResponseApiWrapper && null != homePageResponseApiWrapper.getHomePageApiResponse()) {
      homePage = homePageResponseApiWrapper.getHomePageApiResponse().getHomePage();
      HKAnalyticsUtils.appendItrackerParam(homePage, HKAnalyticsUtils.WIDGET_VAR_VALUE_FOR_HOME);
    }


/*
    //tODO: hack here for stag
    Map<String, PageBanner> apiSlots = homePage.getSlotToBanner();
    Map<String, PageBanner> finalSlots = new LinkedHashMap<String, PageBanner>();

    finalSlots.put("one", apiSlots.get("one"));
    finalSlots.put("two", apiSlots.get("two"));
    finalSlots.put("three", apiSlots.get("three"));

    for (Map.Entry<String, PageBanner> finalSlotEntry : finalSlots.entrySet()) {
      PageBanner pageBanner = finalSlotEntry.getValue();

      if (pageBanner != null) {
        */
/*for (PageBannerImage pageBannerImage : pageBanner.getBannerImages()) {
          String mLink = pageBannerImage.getMlink();
          mLink = mLink.replace("prod", "stag");
          pageBannerImage.setMlink(mLink);
        }*/
/*
      }
    }

    homePage.setSlotToBanner(finalSlots);
*/

    return new ForwardResolution("/pages/home/home.jsp");
  }

  public HomePage getHomePage() {
    return homePage;
  }

  public void setHomePage(HomePage homePage) {
    this.homePage = homePage;
  }

  public PageService getPageService() {
    return pageService;
  }
}
