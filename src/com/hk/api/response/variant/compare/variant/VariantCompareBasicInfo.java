package com.hk.api.response.variant.compare.variant;

import com.hk.api.response.variant.response.StoreVariantApiResponse;

/**
 * @author Rimal
 */
public class VariantCompareBasicInfo {

  private Long id;
  private String name;
  private int offerPrice;
//  private long mrp;
    private Double mrp;
  //  private Double discount;
  private int discount;
  private String oldVariantId;

  private boolean oos;
  private boolean notifyMe;
  private boolean showNotifyMe;
  private Long minDispatchDays;
  private Long maxDispatchDays;
  private String urlFragment;
  private String navKey;
  private boolean jit;
  private String catPrefix;


  public VariantCompareBasicInfo(StoreVariantApiResponse storeVariant) {
    this.id = storeVariant.getId();
    this.name = storeVariant.getName();
    this.offerPrice = storeVariant.getOfferPrice();
    this.mrp = storeVariant.getMrp();
    this.discount = storeVariant.getDiscount();
    this.oos = storeVariant.isOos();
    this.minDispatchDays = storeVariant.getMinDispatchDays();
    this.maxDispatchDays = storeVariant.getMaxDispatchDays();
    this.urlFragment = storeVariant.getUrlFragment();
    this.navKey = storeVariant.getNavKey();
    this.oldVariantId = storeVariant.getOldVariantId();
    this.notifyMe = storeVariant.isNotifyMe();
    this.showNotifyMe = storeVariant.isShowNotifyMe();
    this.jit = storeVariant.isJit();
    this.catPrefix = storeVariant.getCatPrefix();
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getOfferPrice() {
    return offerPrice;
  }

  public void setOfferPrice(int offerPrice) {
    this.offerPrice = offerPrice;
  }

  public Double getMrp() {
    return mrp;
  }

  public void setMrp(Double mrp) {
    this.mrp = mrp;
  }

  /*public long getMrp() {
    return mrp;
  }

  public void setMrp(long mrp) {
    this.mrp = mrp;
  }*/

  /*public Double getDiscount() {
    return discount;
  }

  public void setDiscount(Double discount) {
    this.discount = discount;
  }*/

  public int getDiscount() {
    return discount;
  }

  public void setDiscount(int discount) {
    this.discount = discount;
  }

  public boolean isOos() {
    return oos;
  }

  public void setOos(boolean oos) {
    this.oos = oos;
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
    return showNotifyMe;
  }

  public void setShowNotifyMe(boolean showNotifyMe) {
    this.showNotifyMe = showNotifyMe;
  }

  public Long getMinDispatchDays() {
    return minDispatchDays;
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

  public String getUrlFragment() {
    return urlFragment;
  }

  public void setUrlFragment(String urlFragment) {
    this.urlFragment = urlFragment;
  }

  public String getNavKey() {
    return navKey;
  }

  public void setNavKey(String navKey) {
    this.navKey = navKey;
  }

  public String getOldVariantId() {
    return oldVariantId;
  }

  public void setOldVariantId(String oldVariantId) {
    this.oldVariantId = oldVariantId;
  }

  public boolean isJit() {
    return jit;
  }

  public void setJit(boolean jit) {
    this.jit = jit;
  }

  public boolean getDispatchDataAvail() {
    return (minDispatchDays == 0L || maxDispatchDays == 0L);
  }

    public String getCatPrefix() {
        return catPrefix;
    }

    public void setCatPrefix(String catPrefix) {
        this.catPrefix = catPrefix;
    }
}
