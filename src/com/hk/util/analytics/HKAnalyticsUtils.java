package com.hk.util.analytics;

import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.api.response.catalog.results.CatalogStoreVariant;
import com.hk.api.response.menu.MenuNode;
import com.hk.api.response.ui.base.*;
import com.hk.api.response.ui.base.header.variant.PageVariantHeader;
import com.hk.api.response.ui.base.header.variant.PageVariantHeaderItem;
import com.hk.api.response.variant.boughtTogether.BoughtTogetherVariantData;
import com.hk.api.response.variant.response.StoreVariantBasicApiResponse;
import com.hk.common.builder.URIBuilder;
import com.hk.constants.ui.BannerTypeEnum;
import com.hk.impl.service.ui.UrlIdentifierHelper;
import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class HKAnalyticsUtils {

  public static final String WIDGET_VAR_VALUE_FOR_HOME = "home";

  private static final String ITRACKER_PARAM = "itracker";
  private static final String ITRACKER_VAR_SEP = ";";
  private static final String ITRACKER_VAR_AND_VAL_SEP = ":";
  private static final String ITRACKER_VAR_VALUES_SEP = "|";

  private static final String WIDGET_VAR = "w";
  private static final String POSITION_VAR = "p";
  private static final String CAMPAIGN_VAR = "c";
  private static final String EXTRA_VAR = "e";

  private static final String WIDGET_VAR_VALUE_FOR_BANNER = "bnr";
  private static final String WIDGET_VAR_VALUE_FOR_VARIANT_HEADER = "vhd";
  private static final String WIDGET_VAR_VALUE_FOR_BOUGHT_TOGETHER = "pab";
  private static final String WIDGET_VAR_VALUE_FOR_MENU_EXPANDED = "emenu";
  private static final String WIDGET_VAR_VALUE_FOR_MENU_COLLAPSED = "cmenu";
  private static final String WIDGET_VAR_VALUE_FOR_SEARCH_PAGE = "searchresults";


  public static void appendItrackerParam(AbstractPage page, String pageIdentifier) {
    if (null != page) {
      appendItrackerParamForBanner(page, pageIdentifier);

      if (page instanceof BaseHeaderPage) {
        appendItrackerParamForBaseHeaderPage((BaseHeaderPage) page, pageIdentifier);
      }
    }
  }

  public static void appendItrackerParam(MenuNode menuNode, boolean expandedMenu) {
    if (null != menuNode) {
      String menuNodeUrl = menuNode.getUrl();

      List<String> widgetVarValues = new ArrayList<String>();
      if (expandedMenu) {
        widgetVarValues.add(WIDGET_VAR_VALUE_FOR_MENU_EXPANDED);
      } else {
        widgetVarValues.add(WIDGET_VAR_VALUE_FOR_MENU_COLLAPSED);
      }

      List<String> positionVarValues = new ArrayList<String>();
      positionVarValues.add(((Integer) menuNode.getDepth()).toString());

      List<String> campaignVarValues = new ArrayList<String>();
      campaignVarValues.add(UrlIdentifierHelper.normalizeString(menuNode.getName()));

      String itrackerParam = getItrackerParam(menuNodeUrl, widgetVarValues, positionVarValues, campaignVarValues, null);
      menuNode.setUrl(menuNodeUrl + itrackerParam);
    }
  }

  public static void appendItrackerParam(BoughtTogetherVariantData boughtTogetherVariantData) {
    if (null != boughtTogetherVariantData) {
      StoreVariantBasicApiResponse storeVariant = boughtTogetherVariantData.getBoughtTogetherVariant();
      String variantUrl = storeVariant.getUrl();
      List<String> widgetVarValues = new ArrayList<String>();
      widgetVarValues.add(WIDGET_VAR_VALUE_FOR_BOUGHT_TOGETHER);
      widgetVarValues.add(boughtTogetherVariantData.getStoreVariantId().toString());

      List<String> positionVarValues = new ArrayList<String>();
      positionVarValues.add(((Integer) boughtTogetherVariantData.getDisplayOrder()).toString());

      List<String> campaignVarValues = new ArrayList<String>();
      campaignVarValues.add(storeVariant.getId().toString());

      String itrackerParam = getItrackerParam(variantUrl, widgetVarValues, positionVarValues, campaignVarValues, null);
      storeVariant.setUrl(variantUrl + itrackerParam);
    }
  }

  /*
   params to be appended with banner landing page, if any
   syntax: &itracker=w:bnr|home;p:slotnumber|bannerposition;c-caption
  */
  private static void appendItrackerParamForBanner(AbstractPage page, String pageIdentifier) {
    /*List<String> widgetVarValues = new ArrayList<String>();
    widgetVarValues.add(WIDGET_VAR_VALUE_FOR_BANNER);
    widgetVarValues.add(pageIdentifier);*/

    for (PageBanner pageBanner : page.getPageBannerList()) {
      for (PageBannerSlot pageBannerSlot : pageBanner.getSlotToBanner().values()) {
        List<String> widgetVarValues = new ArrayList<String>();
        widgetVarValues.add(WIDGET_VAR_VALUE_FOR_BANNER);
        widgetVarValues.add(pageIdentifier);
        widgetVarValues.add(pageBanner.getType().equalsIgnoreCase(BannerTypeEnum.StripBanner.getName()) ? pageBanner.getType() : pageBannerSlot.getSlot());

        for (PageBannerSlotImage pageBannerSlotImage : pageBannerSlot.getBannerSlotImages()) {
          if (StringUtils.isNotBlank(pageBannerSlotImage.getLandingPage())) {
            List<String> positionVarValues = new ArrayList<String>();
            List<String> campaignVarValues = new ArrayList<String>();
            String landingPageUrl = pageBannerSlotImage.getLandingPage();
            String bannerImageLocation = pageBannerSlotImage.getDisplayOrder() != null ? pageBannerSlotImage.getDisplayOrder().toString() : "";

//            positionVarValues.add(pageBanner.getType().equalsIgnoreCase(BannerTypeEnum.StripBanner.getName()) ? pageBanner.getType() : pageBannerSlot.getSlot());
            positionVarValues.add(bannerImageLocation);

            campaignVarValues.add(StringUtils.isNotBlank(pageBannerSlotImage.getCaption()) ? UrlIdentifierHelper.normalizeString(pageBannerSlotImage.getCaption()) : "");

            String itrackerParam = getItrackerParam(landingPageUrl, widgetVarValues, positionVarValues, campaignVarValues, null);
            pageBannerSlotImage.setLandingPage(landingPageUrl + itrackerParam);
          }
        }
      }
    }
  }

  private static void appendItrackerParamForBaseHeaderPage(BaseHeaderPage baseHeaderPage, String pageIdentifier) {
    List<PageVariantHeader> pageVariantHeaderList = baseHeaderPage.getVariantHeaders();
    for (PageVariantHeader pageVariantHeader : pageVariantHeaderList) {
      List<String> widgetVarValues = new ArrayList<String>();
      widgetVarValues.add(WIDGET_VAR_VALUE_FOR_VARIANT_HEADER);
      widgetVarValues.add(pageIdentifier);
      widgetVarValues.add(pageVariantHeader.getDisplayOrder() != null ? pageVariantHeader.getDisplayOrder().toString() : "");

      for (PageVariantHeaderItem pageVariantHeaderItem : pageVariantHeader.getItems()) {
        List<String> positionVarValues = new ArrayList<String>();
        positionVarValues.add(pageVariantHeaderItem.getDisplayOrder() != null ? pageVariantHeaderItem.getDisplayOrder().toString() : "");

        StoreVariantBasicApiResponse variant = pageVariantHeaderItem.getVariantBasicResponse();
        List<String> campaignVarValues = new ArrayList<String>();
        campaignVarValues.add(variant.getId().toString());

        String variantUrl = variant.getUrl();

        String itrackerParam = getItrackerParam(variantUrl, widgetVarValues, positionVarValues, campaignVarValues, null);
        variant.setUrl(variantUrl + itrackerParam);
      }
    }
  }

  public static void appendItrackerForSearch(CatalogResults catalogResults) {
    if (null != catalogResults) {
      int perPage = catalogResults.getPerPage();
      int pageNo = catalogResults.getPageNo();
      int initialPosition = (perPage * (pageNo - 1)) + 1; //calculate position for first element
      List<String> campaignVarValues = new ArrayList<String>();
      List<String> widgetVarValues = new ArrayList<String>();
      List<CatalogStoreVariant> catalogVariants = catalogResults.getVariants();


      //set up values for itracker string
      campaignVarValues.add(catalogResults.getTextQuery());
      widgetVarValues.add(WIDGET_VAR_VALUE_FOR_SEARCH_PAGE);

      for (CatalogStoreVariant catalogVariant : catalogVariants) {
        Boolean isOos = catalogVariant.isOos() || !catalogVariant.isOrderEnabled();
        String variantUrl = catalogVariant.getUrl();
        String itrackerParam = null;
        List<String> positionVarValues = new ArrayList<String>(); //positionVarValues is local because its value changes
        List<String> extraValues = new ArrayList<String>();

        positionVarValues.add(initialPosition + "");
        extraValues.add(perPage + "");
        extraValues.add("" + catalogVariant.isOos());

        itrackerParam = getItrackerParam(variantUrl, widgetVarValues, positionVarValues, campaignVarValues, extraValues);
        catalogVariant.setUrl(variantUrl + itrackerParam);
        initialPosition++;
      }
    }
  }

  private static String getItrackerParam(String baseUrl, List<String> widgetValues, List<String> positionValues, List<String> campaignValues, List<String> extraValues) {
    StringBuilder itrackerParam = new StringBuilder();
    if (baseUrl.indexOf(URIBuilder.URL_FIRST_PARAM_SEP) != -1) {
      itrackerParam.append(URIBuilder.URL_PARAM_SEP);
    } else {
      itrackerParam.append(URIBuilder.URL_FIRST_PARAM_SEP);
    }

    itrackerParam.append(ITRACKER_PARAM).append("=");

    //widget var
    itrackerParam.append(WIDGET_VAR).append(ITRACKER_VAR_AND_VAL_SEP);
    for (String widgetValue : widgetValues) {
      itrackerParam.append(widgetValue).append(ITRACKER_VAR_VALUES_SEP);
    }
    itrackerParam.append(ITRACKER_VAR_SEP);

    //position var
    itrackerParam.append(POSITION_VAR).append(ITRACKER_VAR_AND_VAL_SEP);
    for (String positionValue : positionValues) {
      itrackerParam.append(positionValue).append(ITRACKER_VAR_VALUES_SEP);
    }
    itrackerParam.append(ITRACKER_VAR_SEP);

    //campaign var
    itrackerParam.append(CAMPAIGN_VAR).append(ITRACKER_VAR_AND_VAL_SEP);
    for (String campaignValue : campaignValues) {
      itrackerParam.append(campaignValue).append(ITRACKER_VAR_VALUES_SEP);
    }
    itrackerParam.append(ITRACKER_VAR_SEP);

    //extra var

    if (null != extraValues) {
      itrackerParam.append(EXTRA_VAR).append(ITRACKER_VAR_AND_VAL_SEP);
      for (String extraValue : extraValues) {
        itrackerParam.append(extraValue).append(ITRACKER_VAR_VALUES_SEP);
      }
      itrackerParam.append(ITRACKER_VAR_SEP);
    }


    return itrackerParam.toString();
  }
}
