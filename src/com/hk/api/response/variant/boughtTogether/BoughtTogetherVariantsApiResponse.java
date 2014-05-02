package com.hk.api.response.variant.boughtTogether;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class BoughtTogetherVariantsApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.BOUGHT_TOGETHER_VARIANTS)
  private List<BoughtTogetherVariantData> boughtTogetherVariantDataList = new ArrayList<BoughtTogetherVariantData>(0);
  @JsonProperty(DtoJsonConstants.TOTAL_BOUGHT_TOGETHER_VARIANTS_SENT)
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
}