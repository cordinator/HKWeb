package com.hk.web.response.variant.review;

import com.hk.constants.rest.HKWebJsonConstants;
import com.hk.web.response.GenericResponse;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Sachit
 * Date: 2/6/14
 * Time: 10:30 AM
 */
public class VariantReviewResponse extends AbstractVariantReviewResponse {

  private int numberOfCurrentResults;

  public int getNumberOfCurrentResults() {
    return numberOfCurrentResults;
  }

  public void setNumberOfCurrentResults(int numberOfCurrentResults) {
    this.numberOfCurrentResults = numberOfCurrentResults;
  }

  @Override
  protected List<String> getKeys() {
    List<String> keyList = super.getKeys();
    keyList.add(HKWebJsonConstants.TOTAL_REVIEWS_SENT);
    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> valueList = super.getValues();
    valueList.add(this.numberOfCurrentResults);
    return valueList;
  }
}
