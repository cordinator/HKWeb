package com.hk.impl.service.order;

import com.hk.api.response.order.response.RecentOrdersApiResponse;
import com.hk.api.response.order.wrapper.RecentOrdersResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.RequestConstants;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.pact.service.order.OrderService;
import com.hk.pact.service.user.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Aug 2, 2013
 * Time: 1:55:11 PM
 */
@Service
public class OrderServiceImpl implements OrderService {

  private static final String RECENT = "recent/";
  private static final int DEFAULT_PAGE_NO = 1;
  private static final int DEFAULT_PER_PAGE = 10;

  @Autowired
  private UserService userService;

  @Override
  public RecentOrdersApiResponse getRecentOrdersForUser(int pageNo, int perPage) {
   Long loggedInUserId = getUserService().getLoggedInUserId();
    if (loggedInUserId == null) {
      return null;
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.ORDER + RECENT + StoreConstants.DEFAULT_STORE_ID.toString() + URIBuilder.URL_TOKEN_SEP + loggedInUserId.toString());

    if (pageNo == 0) {
      pageNo = DEFAULT_PAGE_NO;
    }
    if (perPage == 0) {
      pageNo = DEFAULT_PER_PAGE;
    }

    builder.queryParameter(RequestConstants.PAGE_NO, Integer.valueOf(pageNo).toString());
    builder.queryParameter(RequestConstants.PER_PAGE, Integer.valueOf(perPage).toString());


    RecentOrdersResponseApiWrapper recentOrdersResponseApiWrapper = (RecentOrdersResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), RecentOrdersResponseApiWrapper.class);

    if (recentOrdersResponseApiWrapper != null) {
      return recentOrdersResponseApiWrapper.getRecentOrdersApiResponse();
    }
    return null;
  }

  public UserService getUserService() {
    return userService;
  }
}
