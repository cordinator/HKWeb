package com.hk.impl.service.menu;

import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.api.response.menu.MenuNode;
import com.hk.api.response.menu.MenuNodeResponseApiWrapper;
import com.hk.pact.service.menu.MenuService;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * @author Rimal
 */
@Service
public class MenuServiceImpl implements MenuService {

  @Override
  @SuppressWarnings("unchecked")
  public List<MenuNode> getMenu() {

    Long storeId = StoreConstants.DEFAULT_STORE_ID;

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.STORE_MENU + storeId.toString());

    MenuNodeResponseApiWrapper menuNodeResponseWrapper = (MenuNodeResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), MenuNodeResponseApiWrapper.class);
    if (menuNodeResponseWrapper != null && menuNodeResponseWrapper.getMenuResponse() != null) {
      return menuNodeResponseWrapper.getMenuResponse().getMenuNodes();
    }
    return Collections.EMPTY_LIST;
  }
}