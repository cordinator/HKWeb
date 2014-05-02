package com.hk.api.response.location;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.constants.rest.HKWebJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;

/**
 * @author Rimal
 */
public class Place extends Location {

  @JsonProperty(DtoJsonConstants.PINCODE)
  private Pincode pincode;


  public Pincode getPincode() {
    return pincode;
  }

  public void setPincode(Pincode pincode) {
    this.pincode = pincode;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    keys.add(HKWebJsonConstants.PINCODE);
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    values.add(this.pincode);
    return values;
  }
}