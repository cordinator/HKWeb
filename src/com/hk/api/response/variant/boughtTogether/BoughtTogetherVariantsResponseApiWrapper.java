package com.hk.api.response.variant.boughtTogether;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class BoughtTogetherVariantsResponseApiWrapper extends AbstractBaseResponseApiWrapper{

  @JsonProperty(DtoJsonConstants.RESULTS)
  private BoughtTogetherVariantsApiResponse boughtTogetherVariantsApiResponse;


  public BoughtTogetherVariantsApiResponse getBoughtTogetherVariantsApiResponse() {
    return boughtTogetherVariantsApiResponse;
  }

  public void setBoughtTogetherVariantsApiResponse(BoughtTogetherVariantsApiResponse boughtTogetherVariantsApiResponse) {
    this.boughtTogetherVariantsApiResponse = boughtTogetherVariantsApiResponse;
  }
}
