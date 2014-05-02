package com.hk.web.action.beta.variant;

import com.hk.api.response.category.CategoryGroup;
import com.hk.api.response.variant.compare.StoreVariantComparison;
import com.hk.api.response.variant.compare.StoreVariantToCompare;
import com.hk.api.response.variant.response.MultipleVariantApiResponse;
import com.hk.api.response.variant.response.StoreVariantApiResponse;
import com.hk.common.http.HKSessionHelper;
import com.hk.pact.service.category.CategoryService;
import com.hk.pact.service.variant.StoreVariantCompareService;
import com.hk.pact.service.variant.StoreVariantService;
import com.hk.web.action.beta.BaseAction;
import com.hk.web.response.variant.compare.StoreVariantToCompareResponse;
import net.sourceforge.stripes.action.*;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * @author Rimal
 */
@Component
public class StoreVariantCompareAction extends BaseAction {
  private StoreVariantComparison storeVariantComparison;
  private Long storeVariantId;
  private String variantIds;
  private static final int VARIANTS_LENGTH = 4;
  private static final String VARIANTS_DELIMITER =",";
  private Set<StoreVariantToCompare> storeVariantCompareSet = new HashSet<StoreVariantToCompare>(0);

  @Autowired
  private CategoryService categoryService;
  @Autowired
  private StoreVariantService storeVariantService;
  @Autowired
  private StoreVariantCompareService storeVariantCompareService;

  @DefaultHandler
  @SuppressWarnings("unchecked")
  public Resolution compareVariants() {
    HttpServletRequest httpServletRequest = getContext().getRequest();
    String sessionIdentifierId = HKSessionHelper.getSessionIdentifierId(httpServletRequest);
    getStoreVariantCompareService().removeAllVariantsToCompare(sessionIdentifierId);

    if (variantIds != null && !variantIds.isEmpty()) {
      String[] variants = variantIds.split(VARIANTS_DELIMITER);
      Set<String> uniqueVariants = new LinkedHashSet<String>(Arrays.asList(variants));

      StringBuilder builder = new StringBuilder();
        Iterator<String> iterator = uniqueVariants.iterator();
      for (int i = 0; i < VARIANTS_LENGTH; i++) {
        if (iterator.hasNext())
          builder.append(iterator.next()).append(VARIANTS_DELIMITER);
      }
        variantIds = builder.toString();

      for (String svId : uniqueVariants) {
        if (NumberUtils.isNumber(svId)) {
          getStoreVariantCompareService().addVariantToCompare(Long.parseLong(svId), sessionIdentifierId);
        }
      }
      MultipleVariantApiResponse multipleVariantApiResponse = getStoreVariantService().getStoreVariants(variantIds);
      if (multipleVariantApiResponse != null) {
        List<StoreVariantApiResponse> storeVariantApiResponseList = multipleVariantApiResponse.getVariantApiResponses();

        String comparisonCategoryPrefix = null;
        if (!storeVariantApiResponseList.isEmpty()) {
          comparisonCategoryPrefix = storeVariantApiResponseList.get(0).getCatPrefix();
          for (Iterator<StoreVariantApiResponse> iteratorApiResponse = storeVariantApiResponseList.iterator(); iteratorApiResponse.hasNext(); ) {
            StoreVariantApiResponse apiResponse = iteratorApiResponse.next();
            if (!comparisonCategoryPrefix.equals(apiResponse.getCatPrefix())) {
              iteratorApiResponse.remove();
            }
          }
          List<CategoryGroup> categoryGroupList = getCategoryService().getSpecGroupsForCategory(comparisonCategoryPrefix);
          storeVariantComparison = new StoreVariantComparison(storeVariantApiResponseList, categoryGroupList);
        }
      } else {
        //return new ForwardResolution("/pages/404.jsp");
        return new ErrorResolution(404);
      }
    } else {
      //TODO: message for no variants selected for comparison
    }

    return new ForwardResolution("/pages/variant/variantCompare.jsp");
  }

  @SuppressWarnings("unchecked")
  public Resolution removeVariantsToCompare() {
    HttpServletRequest httpServletRequest = getContext().getRequest();
    StoreVariantToCompareResponse storeVariantToCompareResponse = getStoreVariantCompareService().removeVariantToCompare(storeVariantId, HKSessionHelper.getSessionIdentifierId(httpServletRequest));
    if (storeVariantToCompareResponse != null) {
      storeVariantCompareSet = storeVariantToCompareResponse.getStoreVariantListToCompare();
    }
    //storeVariantCompareSet = (Set<StoreVariantToCompare>) getContext().getRequest().getSession(false).getAttribute(SVCompareResource.COMPARISON_SET);
    /*if (storeVariantId == null) {
      //TODO: error for bad request
    } else if (storeVariantCompareSet != null && !storeVariantCompareSet.isEmpty()) {
      StoreVariantToCompare storeVariantToCompare = new StoreVariantToCompare();
      storeVariantToCompare.setStoreVariantId(storeVariantId);
      storeVariantCompareSet.remove(storeVariantToCompare);
    }*/
    StringBuilder params = new StringBuilder();
    for(StoreVariantToCompare storeVariantToCompare : storeVariantCompareSet){
      params.append(storeVariantToCompare.getStoreVariantId()).append(",");
    }
    return new RedirectResolution(StoreVariantCompareAction.class, "compareVariants")
        .addParameter("variantIds", params);
  }


  public Long getStoreVariantId() {
    return storeVariantId;
  }

  public void setStoreVariantId(Long storeVariantId) {
    this.storeVariantId = storeVariantId;
  }

  public StoreVariantComparison getStoreVariantComparison() {
    return storeVariantComparison;
  }

  public void setStoreVariantComparison(StoreVariantComparison storeVariantComparison) {
    this.storeVariantComparison = storeVariantComparison;
  }


  public Set<StoreVariantToCompare> getStoreVariantCompareSet() {
    return storeVariantCompareSet;
  }

  public void setStoreVariantCompareSet(Set<StoreVariantToCompare> storeVariantCompareSet) {
    this.storeVariantCompareSet = storeVariantCompareSet;
  }

    public String getVariantIds() {
        return variantIds;
    }

    public void setVariantIds(String variantIds) {
        this.variantIds = variantIds;
    }

  public CategoryService getCategoryService() {
    return categoryService;
  }

  public StoreVariantService getStoreVariantService() {
    return storeVariantService;
  }

  public StoreVariantCompareService getStoreVariantCompareService() {
    return storeVariantCompareService;
  }
}