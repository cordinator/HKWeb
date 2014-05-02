package com.hk.api.response.variant.response;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.ui.base.tags.StoreVariantTag;
import com.hk.api.response.ui.base.tags.CategoryTag;
import com.hk.api.response.ui.base.tags.BrandTag;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: May 22, 2013
 * Time: 5:59:19 PM
 */
public class StoreVariantBasicApiResponse extends AbstractStoreVariantApiResponse {

  @JsonProperty(DtoJsonConstants.COD_ALLOWED)
  private boolean codAllowed;
  @JsonProperty(DtoJsonConstants.OOS)
  private boolean oos;

  @JsonProperty(DtoJsonConstants.MIN_DISPATCH_DAYS)
  private Long minDispatchDays;
  @JsonProperty(DtoJsonConstants.MAX_DISPATCH_DAYS)
  private Long maxDispatchDays;
  @JsonProperty(DtoJsonConstants.FREEBIE_NAME)
  private String freebieName;
  @JsonProperty(DtoJsonConstants.NOTIFY_ME_ENABLED)
  private boolean notifyMe;
  @JsonProperty(DtoJsonConstants.DIRECT_LINK_ENABLED)
  private boolean directLinkEnabled;
  @JsonProperty(DtoJsonConstants.CATALOG_ENABLED)
  private boolean catalogEnabled;
  @JsonProperty(DtoJsonConstants.SEARCH_ENABLED)
  private boolean searchEnabled;
  @JsonProperty(DtoJsonConstants.ORDER_ENABLED)
  private boolean orderEnabled;

  @JsonProperty(DtoJsonConstants.JIT)
  private boolean jit;

  @JsonProperty(DtoJsonConstants.VARIANT_TAGS)
  private StoreVariantTag storeVariantTag;
  @JsonProperty(DtoJsonConstants.CATEGORY_TAGS)
  private CategoryTag categoryTag;
  @JsonProperty(DtoJsonConstants.BRAND_TAGS)
  private BrandTag brandTag;


  public boolean isCodAllowed() {
    return codAllowed;
  }

  public void setCodAllowed(boolean codAllowed) {
    this.codAllowed = codAllowed;
  }

  public boolean isOos() {
    return oos;
  }

  public void setOos(boolean oos) {
    this.oos = oos;
  }

  public Long getMinDispatchDays() {
    return minDispatchDays;
  }

  public boolean getDispatchDataAvail() {
    return (minDispatchDays == 0L || maxDispatchDays == 0L);
  }

  public void setMinDispatchDays(Long minDispatchDays) {
    this.minDispatchDays = minDispatchDays;
  }

  public Long getMaxDispatchDays() {
    return maxDispatchDays;
  }

  public void setMaxDispatchDays(Long maxDispatchDays) {
    this.maxDispatchDays = maxDispatchDays;
  }

  public String getFreebieName() {
    return freebieName;
  }

  public void setFreebieName(String freebieName) {
    this.freebieName = freebieName;
  }

  public boolean isNotifyMe() {
    return notifyMe;
  }

  public boolean getNotifyMe() {
    return notifyMe;
  }

  public void setNotifyMe(boolean notifyMe) {
    this.notifyMe = notifyMe;
  }

  public boolean isShowNotifyMe() {
    boolean showNotifyMe = false;

    if (!orderEnabled) {
      showNotifyMe = true;
    } else {
      showNotifyMe = oos && notifyMe;
    }
    return showNotifyMe;
  }

  public boolean isDirectLinkEnabled() {
    return directLinkEnabled;
  }

  public void setDirectLinkEnabled(boolean directLinkEnabled) {
    this.directLinkEnabled = directLinkEnabled;
  }

  public boolean isCatalogEnabled() {
    return catalogEnabled;
  }

  public void setCatalogEnabled(boolean catalogEnabled) {
    this.catalogEnabled = catalogEnabled;
  }

  public boolean isSearchEnabled() {
    return searchEnabled;
  }

  public void setSearchEnabled(boolean searchEnabled) {
    this.searchEnabled = searchEnabled;
  }

  public boolean isJit() {
    return jit;
  }

  public boolean getJit() {
    return jit;
  }

  public void setJit(boolean jit) {
    this.jit = jit;
  }

  public boolean isOrderEnabled() {
    return orderEnabled;
  }

  public void setOrderEnabled(boolean orderEnabled) {
    this.orderEnabled = orderEnabled;
  }

  public StoreVariantTag getStoreVariantTag() {
    return storeVariantTag;
  }

  public void setStoreVariantTag(StoreVariantTag storeVariantTag) {
    this.storeVariantTag = storeVariantTag;
  }

  public CategoryTag getCategoryTag() {
    return categoryTag;
  }

  public void setCategoryTag(CategoryTag categoryTag) {
    this.categoryTag = categoryTag;
  }

  public BrandTag getBrandTag() {
    return brandTag;
  }

  public void setBrandTag(BrandTag brandTag) {
    this.brandTag = brandTag;
  }


  @Override
  protected List<String> getKeys() {
    List<String> keyList = super.getKeys();
    keyList.add(DtoJsonConstants.OOS);
    keyList.add(DtoJsonConstants.COD_ALLOWED);
    keyList.add(DtoJsonConstants.MIN_DISPATCH_DAYS);
    keyList.add(DtoJsonConstants.MAX_DISPATCH_DAYS);
    keyList.add(DtoJsonConstants.FREEBIE_NAME);
    keyList.add(DtoJsonConstants.DIRECT_LINK_ENABLED);
    keyList.add(DtoJsonConstants.NOTIFY_ME_ENABLED);
    keyList.add(DtoJsonConstants.CATALOG_ENABLED);
    keyList.add(DtoJsonConstants.SEARCH_ENABLED);
    keyList.add(DtoJsonConstants.ORDER_ENABLED);
    keyList.add(DtoJsonConstants.JIT);
    keyList.add(DtoJsonConstants.VARIANT_TAGS);
    keyList.add(DtoJsonConstants.CATEGORY_TAGS);
    keyList.add(DtoJsonConstants.BRAND_TAGS);

    return keyList;
  }

  @Override
  protected List<Object> getValues() {
    List<Object> valueList = super.getValues();
    valueList.add(this.oos);
    valueList.add(this.codAllowed);
    valueList.add(this.minDispatchDays);
    valueList.add(this.maxDispatchDays);
    valueList.add(this.freebieName);
    valueList.add(this.directLinkEnabled);
    valueList.add(this.notifyMe);
    valueList.add(this.catalogEnabled);
    valueList.add(this.searchEnabled);
    valueList.add(this.orderEnabled);
    valueList.add(this.jit);
    valueList.add(storeVariantTag);
    valueList.add(categoryTag);
    valueList.add(brandTag);

    return valueList;
  }
}
