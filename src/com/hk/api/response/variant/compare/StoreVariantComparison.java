package com.hk.api.response.variant.compare;

import com.hk.api.response.category.CategoryGroup;
import com.hk.api.response.category.CategoryGroupValue;
import com.hk.api.response.variant.compare.group.VariantCompareGroup;
import com.hk.api.response.variant.compare.group.VariantCompareGroupValue;
import com.hk.api.response.variant.compare.image.VariantCompareImage;
import com.hk.api.response.variant.compare.variant.VariantCompareBasicInfo;
import com.hk.api.response.variant.group.VariantGroup;
import com.hk.api.response.variant.response.StoreVariantApiResponse;
import com.hk.exception.InvalidInputException;

import java.util.LinkedList;
import java.util.List;

/**
 * @author Rimal
 */
public class StoreVariantComparison {

  private List<VariantCompareBasicInfo> variantCompareBasicInfoList = new LinkedList<VariantCompareBasicInfo>();
  private List<VariantCompareImage> primaryImageList = new LinkedList<VariantCompareImage>();
  private List<VariantCompareGroup> variantGroups = new LinkedList<VariantCompareGroup>();


  public List<VariantCompareBasicInfo> getVariantCompareBasicInfoList() {
    return variantCompareBasicInfoList;
  }

  public void setVariantCompareBasicInfoList(List<VariantCompareBasicInfo> variantCompareBasicInfoList) {
    this.variantCompareBasicInfoList = variantCompareBasicInfoList;
  }

  public List<VariantCompareImage> getPrimaryImageList() {
    return primaryImageList;
  }

  public void setPrimaryImageList(List<VariantCompareImage> primaryImageList) {
    this.primaryImageList = primaryImageList;
  }

  public List<VariantCompareGroup> getVariantGroups() {
    return variantGroups;
  }

  public void setVariantGroups(List<VariantCompareGroup> variantGroups) {
    this.variantGroups = variantGroups;
  }


  public StoreVariantComparison(List<StoreVariantApiResponse> storeVariants, List<CategoryGroup> categoryGroupList) {
    if (storeVariants == null || storeVariants.size() == 0) {
      throw new InvalidInputException("STORE_VARIANTS_TO_COMPARE_CANNOT_BE_EMPTY");
    }

    if (categoryGroupList == null) {
      throw new InvalidInputException("CATEGORY_GROUPS_CANNOT_BE_BLANK");
    }

    for (StoreVariantApiResponse storeVariant : storeVariants) {
      VariantCompareBasicInfo variantCompareBasicInfo = new VariantCompareBasicInfo(storeVariant);
      this.variantCompareBasicInfoList.add(variantCompareBasicInfo);

      VariantCompareImage variantCompareImage = new VariantCompareImage(storeVariant.getPrimaryImage());
      this.primaryImageList.add(variantCompareImage);
    }

    buildVariantCompareGroups(storeVariants, categoryGroupList);
  }

  private void buildVariantCompareGroups(List<StoreVariantApiResponse> storeVariants, List<CategoryGroup> categoryGroupList) {
    for (CategoryGroup categoryGroup : categoryGroupList) {
      String currGroupName = categoryGroup.getName();

      VariantCompareGroup variantCompareGroup = new VariantCompareGroup();
      variantCompareGroup.setName(currGroupName);
      variantCompareGroup.setDisplayName(categoryGroup.getDisplayName());
      variantCompareGroup.setDisplayOrder(categoryGroup.getDisplayOrder());

      for (CategoryGroupValue categoryGroupValue : categoryGroup.getCategoryGroupValueList()) {
        String currGroupValueName = categoryGroupValue.getName();

        VariantCompareGroupValue variantCompareGroupValue = new VariantCompareGroupValue();
        variantCompareGroupValue.setName(currGroupValueName);
        variantCompareGroupValue.setDisplayName(categoryGroupValue.getDisplayName());
        variantCompareGroupValue.setDisplayOrder(categoryGroupValue.getDisplayOrder());

        //add values corresponding to all the variants available
        boolean addGroupValue = false;
        for (StoreVariantApiResponse storeVariant : storeVariants) {
          VariantGroup groupForCurrVariant = storeVariant.getVariantGroup(currGroupName);
          if (groupForCurrVariant != null && groupForCurrVariant.getGroupValue(currGroupValueName) != null) {
            String value = groupForCurrVariant.getGroupValue(currGroupValueName).getValue();
            variantCompareGroupValue.getValues().add(value);
            addGroupValue = true;
          } else {
            variantCompareGroupValue.getValues().add("");
          }
        }

        if (addGroupValue) {
          variantCompareGroup.getGroupValues().add(variantCompareGroupValue);
        }
      }

      if (!variantCompareGroup.getGroupValues().isEmpty()) {
        this.getVariantGroups().add(variantCompareGroup);
      }
    }
  }
}