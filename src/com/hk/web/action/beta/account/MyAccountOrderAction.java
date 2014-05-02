package com.hk.web.action.beta.account;

import com.hk.api.response.order.response.RecentOrdersApiResponse;
import com.hk.pact.service.order.OrderService;
import com.hk.web.action.beta.BaseAction;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Aug 2, 2013
 * Time: 1:48:49 PM
 */

public abstract class MyAccountOrderAction extends BaseAction {


  @Autowired
  private OrderService orderService;


  private RecentOrdersApiResponse recentOrdersApiResponse;
  private int pageNo;
  private int perPage;

  protected void fetchRecentOrdersForUser() {

    recentOrdersApiResponse = getOrderService().getRecentOrdersForUser(pageNo, perPage);
  }

  public boolean getRecentOrdersAvailable() {

    if (recentOrdersApiResponse != null && recentOrdersApiResponse.getOrders().size() > 0) {
      return true;
    }

    return false;
  }


  public RecentOrdersApiResponse getRecentOrdersApiResponse() {
    return recentOrdersApiResponse;
  }

  public void setRecentOrdersApiResponse(RecentOrdersApiResponse recentOrdersApiResponse) {
    this.recentOrdersApiResponse = recentOrdersApiResponse;
  }

  public int getPageNo() {
    return pageNo;
  }

  public void setPageNo(int pageNo) {
    this.pageNo = pageNo;
  }

  public int getPerPage() {
    return perPage;
  }

  public void setPerPage(int perPage) {
    this.perPage = perPage;
  }

  public OrderService getOrderService() {
    return orderService;
  }
}
