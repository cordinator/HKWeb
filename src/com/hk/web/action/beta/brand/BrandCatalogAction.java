package com.hk.web.action.beta.brand;

import com.hk.api.response.catalog.results.CatalogResults;
import com.hk.web.action.beta.catalog.CatalogBaseAction;
import net.sourceforge.stripes.action.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Component;
import com.hk.pact.service.ui.PageService;
import com.hk.api.response.brand.wrapper.BrandPageResponseApiWrapper;
import com.hk.api.response.ui.BrandPage;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Aug 20, 2013
 * Time: 3:02:50 PM
 */
@UrlBinding("/brand/{brandSlug}")
@Component
public class BrandCatalogAction extends CatalogBaseAction {

 private BrandPage brandPage;


  @DefaultHandler
  public Resolution renderCatalog() {

    if (StringUtils.isBlank(navKey)) {
      //return new ForwardResolution("/pages/404.jsp");
      return new ErrorResolution(404);
    }

    BrandPageResponseApiWrapper brandPageResponseApiWrapper = getPageService().getBrandResponseWrapperForCategory(navKey);
    CatalogResults catalogResults = null;
    brands = navKey.replace(PageService.BRAND_LP_IDENTIFIER,"");
    if (brandPageResponseApiWrapper != null && brandPageResponseApiWrapper.getBrandPageApiResponse() != null) {
      this.brandPage = brandPageResponseApiWrapper.getBrandPageApiResponse().getBrandPage();
      catalogResults = getCatalogService().getCatalogResultsForCategory(catPrefix, minPrice, maxPrice, brands, fl, pageNo, perPage, txtQ, sortBy, sortType, excludeOOS);
    } else {
      //return new ForwardResolution("/pages/404.jsp");
      return new ErrorResolution(404);
    }
    if (catalogResults != null) {
      setParamsForView(catalogResults);
    }

//    HKAnalyticsUtils.appendItrackerParam(this.brandPage, UrlIdentifierHelper.getBrandIdFromNavKey(this.navKey));
    //return new ForwardResolution("/pages/brand/brandCatalog_old.jsp");
    return new ForwardResolution("/pages/brand/brandCatalog.jsp");
  }


 public BrandPage getBrandPage() {
    return brandPage;
  }

  public void setBrandPage(BrandPage brandPage) {
    this.brandPage = brandPage;
  }


}
