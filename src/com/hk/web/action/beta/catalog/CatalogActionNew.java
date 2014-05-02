package com.hk.web.action.beta.catalog;

import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.api.response.category.wrapper.CatalogPageResponseApiWrapper;
import com.hk.common.constants.RequestConstants;
import com.hk.impl.service.ui.UrlIdentifierHelper;
import com.hk.pact.service.ui.PageService;
import com.hk.util.analytics.HKAnalyticsUtils;
import com.hk.web.action.beta.category.CategoryAction;
import net.sourceforge.stripes.action.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 10, 2013
 * Time: 3:36:31 PM
 */
@Component
@UrlBinding("/{rootSlug}/{firstLvlSlug}/{secondLvlSlug}/{thirdLvlSlug}")
public class CatalogActionNew extends CatalogBaseAction {


  @DefaultHandler
  public Resolution renderCatalog() {

    if (StringUtils.isBlank(navKey)) {
      //return new ForwardResolution("/pages/404.jsp");
      return new ErrorResolution(404);
    }
    /*if (StringUtils.isBlank(navKey) && StringUtils.isBlank(clickCatPrefix)) {
      return null; //TODO: 404
    }*/

    if (navKey.contains(PageService.CATEGORY_LP_IDENTIFIER)) {
      return new ForwardResolution(CategoryAction.class).addParameter("navKey", navKey);
    }


    boolean isMenuLanding = navKey.contains(PageService.CATALOG_LP_IDENTIFIER);

    CatalogPageResponseApiWrapper catalogPageResponseApiWrapper = null;
    CatalogResults catalogResults = null;

    if (isMenuLanding && StringUtils.isBlank(catPrefix)) {
      //catalogPageResponseApiWrapper = getPageService().getCatalogResponseWrapper(PageTypeEnum.MENU_LANDING.getId(), menuNodeId.toString());
      catalogPageResponseApiWrapper = getPageService().getCatalogResponseWrapper(navKey);
      catalogResults = getCatalogService().getCatalogResults(navKey, pageNo, perPage);
    } else if (navKey.contains(PageService.SUB_CATEGORY_LP_IDENTIFIER)) {
      catalogPageResponseApiWrapper = getPageService().getCatalogResponseWrapperForCategory(navKey);
      String clickCatPrefix = navKey.replaceAll(PageService.SUB_CATEGORY_LP_IDENTIFIER, "");
      catalogResults = getCatalogService().getCatalogResultsForCategory(clickCatPrefix, minPrice, maxPrice, brands, fl, pageNo, perPage, txtQ, sortBy, sortType, excludeOOS);
    } else {

      catalogPageResponseApiWrapper = getPageService().getCatalogResponseWrapperForCategory(navKey);
      /*String brandFilterStr = "";
      for (Long brandId : selectedBrands) {
        brandFilterStr += brandId.toString().concat(RequestConstants.BRAND_SEP);
      }*/

      catalogResults = getCatalogService().getCatalogResultsForCategory(catPrefix, minPrice, maxPrice, brands, fl, pageNo, perPage, txtQ, sortBy, sortType, excludeOOS);
//      catalogResults = getCatalogService().getCatalogResultsForCategory(catPrefix, minPrice, maxPrice, brandFilterStr, fl, pageNo, perPage, txtQ);
    }

    if (catalogPageResponseApiWrapper != null && catalogPageResponseApiWrapper.getCatalogPageApiResponse() != null) {
      this.catalogPage = catalogPageResponseApiWrapper.getCatalogPageApiResponse().getCatalogPage();
      if (this.catalogPage != null) {
        if (this.catalogPage.getCategoryBrowseNodeList() != null) {
          this.categoryBrowseNodeList = this.catalogPage.getCategoryBrowseNodeList();
        }

        if (isMenuLanding) {
          HKAnalyticsUtils.appendItrackerParam(catalogPage, UrlIdentifierHelper.getMenuNodeIdFromNavKey(this.navKey));
        } else if (this.navKey.contains(PageService.SUB_CATEGORY_LP_IDENTIFIER)) {
          HKAnalyticsUtils.appendItrackerParam(catalogPage, UrlIdentifierHelper.getSubCategoryPrefixFromNavKey(this.navKey));
        }
      }
    } else {
      //return new ForwardResolution("/pages/404.jsp");
      return new ErrorResolution(404);
    }

    if (catalogResults != null) {
      setParamsForView(catalogResults);
    }
    //return new ForwardResolution("/pages/catalog/catalog1.jsp");
    return new ForwardResolution("/pages/catalog/catalog1.jsp");
  }

  public Resolution filterByBrand() {
    if (currBrandId != null) {
      /*if (selectedBrands.contains(currBrandId)) {
        selectedBrands.remove(currBrandId);
      } else {
        selectedBrands.add(currBrandId);
      }*/
      if (StringUtils.isNotBlank(brands) && brands.contains(currBrandId.toString())) {
        brands = brands.replace(currBrandId.toString(), "");
      } else {
        brands = brands == null ? "" : brands;
        brands = brands + RequestConstants.BRAND_SEP + currBrandId;
      }
    }
//    brands = HKCollectionUtils.getListAsString(new ArrayList<Long>(selectedBrands), RequestConstants.BRAND_SEP);

    return new RedirectResolution(CatalogActionNew.class).addParameter("navKey", navKey)
        .addParameter("rootSlug", rootSlug)
        .addParameter("firstLvlSlug", firstLvlSlug)
        .addParameter("secondLvlSlug", secondLvlSlug)
        .addParameter("thirdLvlSlug", thirdLvlSlug)
//        .addParameter("selectedBrands", selectedBrands)
        .addParameter("brands", brands)
        .addParameter("catPrefix", catPrefix)
        .addParameter("fl", fl);

  }

  public Resolution filterByAttr() {

    if (StringUtils.isNotBlank(currFilterKey) && StringUtils.isNotBlank(currFilterVal)) {
      Map<String, Set<String>> selectedFilters = getFiltersFromUri(fl);
      if (selectedFilters == null) {
        selectedFilters = new HashMap<String, Set<String>>();
      }
      Set<String> selectedValues;
      if (selectedFilters.get(currFilterKey) != null) {
        selectedValues = selectedFilters.get(currFilterKey);
      } else {
        selectedValues = new HashSet<String>();
        selectedFilters.put(currFilterKey, selectedValues);
      }

      if (selectedValues.contains(currFilterVal)) {
        selectedValues.remove(currFilterVal);
      } else {
        selectedValues.add(currFilterVal);
      }
      this.fl = getStringFromSelectedFilters(selectedFilters);
    }


    return new RedirectResolution(CatalogActionNew.class).addParameter("navKey", navKey)
        .addParameter("rootSlug", rootSlug)
        .addParameter("firstLvlSlug", firstLvlSlug)
        .addParameter("secondLvlSlug", secondLvlSlug)
        .addParameter("thirdLvlSlug", thirdLvlSlug)
//        .addParameter("selectedBrands", selectedBrands)
        .addParameter("brands", brands)
        .addParameter("catPrefix", catPrefix)
        .addParameter("fl", fl);

    /*return new RedirectResolution(CatalogActionNew.class)
        .addParameter("navKey", navKey)
        .addParameter("catPrefix", catPrefix)
            *//*.addParameter("clickCatPrefix", clickCatPrefix)*//*
//        .addParameter("selectedBrands", selectedBrands)
        .addParameter("brands", brands)
        .addParameter("fl", fl);*/

  }


}
