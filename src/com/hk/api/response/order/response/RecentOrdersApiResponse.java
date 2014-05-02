package com.hk.api.response.order.response;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.api.response.order.BaseOrderDto;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Aug 2, 2013
 * Time: 1:26:15 PM
 */
public class RecentOrdersApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.ORDERS)
  private List<BaseOrderDto> orders = new ArrayList<BaseOrderDto>();

  @JsonProperty(DtoJsonConstants.PAGE_NO)
  private int pageNo;
  @JsonProperty(DtoJsonConstants.PER_PAGE)
  private int perPage;


  public List<BaseOrderDto> getOrders() {
    return orders;
  }

  public void setOrders(List<BaseOrderDto> orders) {
    this.orders = orders;
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
}
