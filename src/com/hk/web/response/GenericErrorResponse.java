package com.hk.web.response;

import com.hk.common.constants.DtoJsonConstants;

import java.util.Arrays;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 18, 2013
 * Time: 3:53:03 PM
 */
public class GenericErrorResponse extends AbstractGenericResponse {

  @Override
  protected List<String> getKeys() {
    List<String> keys = super.getKeys();
    String[] currKeys = new String[]{DtoJsonConstants.EXCEPTION, DtoJsonConstants.MESSAGES};
    keys.addAll(Arrays.asList(currKeys));
    return keys;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> values = super.getValues();
    Object[] currValues = new Object[]{this.exception, this.messages};
    values.addAll(Arrays.asList(currValues));
    return values;
  }
}

