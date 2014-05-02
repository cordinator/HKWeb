package com.hk.web.response.variant.boughtTogether;

import com.hk.api.response.variant.boughtTogether.BoughtTogetherVariantData;
import com.hk.constants.rest.HKWebJsonConstants;
import com.hk.web.response.GenericResponse;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class BoughtTogetherVariantsResponse extends GenericResponse {

  private List<BoughtTogetherVariantData> boughtTogetherVariantDataList = new ArrayList<BoughtTogetherVariantData>(0);
  private int numberOfCurrentResults;


  public List<BoughtTogetherVariantData> getBoughtTogetherVariantDataList() {
    return boughtTogetherVariantDataList;
  }

  public void setBoughtTogetherVariantDataList(List<BoughtTogetherVariantData> boughtTogetherVariantDataList) {
    this.boughtTogetherVariantDataList = boughtTogetherVariantDataList;
  }

  public int getNumberOfCurrentResults() {
    return numberOfCurrentResults;
  }

  public void setNumberOfCurrentResults(int numberOfCurrentResults) {
    this.numberOfCurrentResults = numberOfCurrentResults;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keyList = super.getKeys();
    keyList.add(HKWebJsonConstants.BOUGHT_TOGETHER_VARIANTS);
    keyList.add(HKWebJsonConstants.TOTAL_BOUGHT_TOGETHER_VARIANTS_SENT);
    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> valueList = super.getValues();
    valueList.add(this.boughtTogetherVariantDataList);
    valueList.add(this.numberOfCurrentResults);
    return valueList;
  }
}
