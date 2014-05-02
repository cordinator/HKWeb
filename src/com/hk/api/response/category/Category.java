package com.hk.api.response.category;

import org.codehaus.jackson.annotate.JsonProperty;
import com.hk.common.constants.DtoJsonConstants;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Jun 3, 2013
 * Time: 11:39:59 AM
 */
public class Category {

  @JsonProperty(DtoJsonConstants.ID)
  private Long id;
  @JsonProperty(DtoJsonConstants.CAT_PREFIX)
  private String prefix;
  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.STORE_ID)
  private Long storeId;
  @JsonProperty(DtoJsonConstants.IS_PRODUCT_NODE)
  private boolean productNode;


  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getPrefix() {
    return prefix;
  }

  public void setPrefix(String prefix) {
    this.prefix = prefix;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Long getStoreId() {
    return storeId;
  }

  public void setStoreId(Long storeId) {
    this.storeId = storeId;
  }

  public boolean isProductNode() {
    return productNode;
  }

  public void setProductNode(boolean productNode) {
    this.productNode = productNode;
  }
}
