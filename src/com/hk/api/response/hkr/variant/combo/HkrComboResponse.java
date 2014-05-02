package com.hk.api.response.hkr.variant.combo;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public class HkrComboResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.COMBO_LIST)
  private List<HkrCombo> comboList = new ArrayList<HkrCombo>();


  public List<HkrCombo> getComboList() {
    return comboList;
  }

  public void setComboList(List<HkrCombo> comboList) {
    this.comboList = comboList;
  }
}
