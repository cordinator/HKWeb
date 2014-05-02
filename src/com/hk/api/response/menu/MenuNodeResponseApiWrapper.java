package com.hk.api.response.menu;

import com.hk.api.response.AbstractBaseResponseApiWrapper;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class MenuNodeResponseApiWrapper extends AbstractBaseResponseApiWrapper {

  @JsonProperty(DtoJsonConstants.RESULTS)
  private MenuResponse menuResponse;

  public MenuResponse getMenuResponse() {
    return menuResponse;
  }

  public void setMenuResponse(MenuResponse menuResponse) {
    this.menuResponse = menuResponse;
  }
}
