package com.hk.web.response.location;

import com.hk.api.response.location.Pincode;
import com.hk.constants.rest.HKWebJsonConstants;
import com.hk.web.response.GenericResponse;

import java.util.List;

/**
 * @author Rimal
 */
public class PincodeResponse extends GenericResponse {

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
