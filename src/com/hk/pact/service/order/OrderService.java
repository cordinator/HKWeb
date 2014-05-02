package com.hk.pact.service.order;

import com.hk.api.response.order.response.RecentOrdersApiResponse;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Aug 2, 2013
 * Time: 1:53:31 PM
 */
public interface OrderService {

  public RecentOrdersApiResponse getRecentOrdersForUser(int pageNo, int perPage);
}
