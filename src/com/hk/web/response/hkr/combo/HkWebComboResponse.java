package com.hk.web.response.hkr.combo;

import com.hk.constants.rest.HKWebJsonConstants;
import com.hk.web.response.GenericResponse;
import com.hk.api.response.hkr.variant.combo.HkrCombo;

import java.util.List;
import java.util.ArrayList;

/**
 * @author Rimal
 */
public class HkWebComboResponse extends GenericResponse {

 private List<HkrCombo> comboList = new ArrayList<HkrCombo>();


  public List<HkrCombo> getComboList() {
    return comboList;
  }

  public void setComboList(List<HkrCombo> comboList) {
    this.comboList = comboList;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keyList = super.getKeys();
    keyList.add(HKWebJsonConstants.COMBO_LIST);
    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> valueList = super.getValues();
    valueList.add(this.comboList);
    return valueList;
  }
}
