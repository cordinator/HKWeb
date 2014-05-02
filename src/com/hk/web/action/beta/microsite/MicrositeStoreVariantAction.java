package com.hk.web.action.beta.microsite;

import com.hk.web.action.beta.BaseAction;
import com.hk.constants.email.Keys;
import com.hk.api.response.variant.response.StoreVariantDetailApiResponse;
import com.hk.api.response.ui.VariantPage;
import com.hk.api.response.ui.base.PageContent;
import com.hk.pact.service.variant.StoreVariantService;
import com.hk.pact.service.ui.PageService;
import com.hk.common.constants.RequestConstants;
import com.hk.common.constants.DtoJsonConstants;
import net.sourceforge.stripes.action.*;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.commons.lang.StringUtils;

import java.util.*;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Nov 7, 2013
 * Time: 6:53:58 PM
 */
@UrlBinding("/mcsv/{variantSlug}")
@Component
public class MicrositeStoreVariantAction extends BaseAction {

  private static Logger logger = LoggerFactory.getLogger(MicrositeStoreVariantAction.class);
  private static final String STORE_PRODUCT_KEY_PREFIX = "SP-";

  @Value("#{hkEnvProps['" + Keys.Env.SHIPPING_FREE_AFTER + "']}")
  private int shippingFreeAfter;

  @Value("#{hkEnvProps['" + Keys.Env.SHIPPING_CHARGES + "']}")
  private int shippingCharges;

  private String navKey;
  private String variantSlug;
  private String brandName;
  private String storeName;
  /*private Long storeVariantId;*/

  private StoreVariantDetailApiResponse storeVariantDetail;
  private Map<String, Long> attrDefaultVariantMap = new HashMap<String, Long>(0);

  private boolean displayNavBar;
  private VariantPage variantPage;

  private Map<String, PageContent> slotToContent = new LinkedHashMap<String, PageContent>();
  private Map<String, String> slotKeyToSlotName = new HashMap<String, String>();

  @Autowired
  private StoreVariantService storeVariantService;


  @DefaultHandler
  public Resolution pre() {
    storeName = getStoreNameFromVariantSlug(variantSlug);
    Long storeVariantId = getStoreVariantIdFromNavKey(navKey);
    if (storeVariantId != null) {
      storeVariantDetail = getStoreVariantService().getStoreVariantById(storeVariantId);
    } else {
      Long storeProductId = getStoreProductIdFromVariantSlug(variantSlug);
      if (storeProductId != null) {
        storeVariantDetail = getStoreVariantService().getDefaultStoreVariantForStoreProduct(storeProductId);
      }
    }

    if (storeVariantDetail != null) {
      if (storeVariantDetail.isSearchEnabled() || storeVariantDetail.isCatalogEnabled() || storeVariantDetail.isDirectLinkEnabled()) {
        variantPage = storeVariantDetail.getVariantPage();

        if (null != storeVariantDetail.getBrand()) {

          String bName = storeVariantDetail.getBrand().getName();
//          String bName = storeVariantDetail.getBrandName() == null ? storeVariantDetail.getBrand().getName() : storeVariantDetail.getBrandName();
          brandName = getSlotKey(bName);
          for (Map.Entry<String, String> availVariantEntry : storeVariantDetail.getAvailableVariants().entrySet()) {
            List<String> attrValues = Arrays.asList(StringUtils.split(availVariantEntry.getKey(), RequestConstants.FILTER_SEP));
            for (String attrValue : attrValues) {
              attrDefaultVariantMap.put(attrValue, Long.parseLong(StringUtils.substringBefore(availVariantEntry.getValue(), DtoJsonConstants.VARIANT_ID_STOCK_STATUS_SEP)));
            }
          }

          shouldDisplayNavBar();
          populateSlots();

          return new ForwardResolution("/store/msVariant.jsp");
          /*if (storeVariantDetail.isSearchEnabled() || storeVariantDetail.isCatalogEnabled() || storeVariantDetail.isDirectLinkEnabled()) {
            return new ForwardResolution("/store/msVariant.jsp");
          }*/
          /*else if (storeVariantDetail.isDirectLinkEnabled()) {
            return new ForwardResolution("/pages/variant/basicVariant.jsp");
          }*/
        }
      }
    }
    return new ErrorResolution(404);
  }

  private Long getStoreVariantIdFromNavKey(String navKey) {
    if (StringUtils.isNotBlank(navKey) && navKey.contains(PageService.VARIANT_LP_IDENTIFIER)) {
      try {
        Long storeVariantId = Long.parseLong(navKey.replaceAll(PageService.VARIANT_LP_IDENTIFIER, ""));
        return storeVariantId;
      } catch (NumberFormatException nfe) {
        logger.error("Error while extracting variant id from navKey:" + nfe.getMessage());
      }
    }

    return null;
  }

  private Long getStoreProductIdFromVariantSlug(String variantSlug) {
    if (StringUtils.isNotBlank(variantSlug)) {
      int indexForSpPrefix = variantSlug.lastIndexOf(STORE_PRODUCT_KEY_PREFIX);
      if (indexForSpPrefix != -1) {
        String storeProductIdentifier = variantSlug.substring(indexForSpPrefix);

        try {
          Long storeproductId = Long.parseLong(storeProductIdentifier.replaceAll(STORE_PRODUCT_KEY_PREFIX, ""));
          return storeproductId;
        } catch (NumberFormatException nfe) {
          logger.error("Error while extracting product id from variant slug:" + nfe.getMessage());
        }
      }
    }
    return null;
  }

  private String getStoreNameFromVariantSlug(String variantSlug) {
    String store = null;
    String reverseSlug = StringUtils.reverseDelimited(variantSlug, '/');

    int spIdx = reverseSlug.indexOf(STORE_PRODUCT_KEY_PREFIX);
    if (spIdx == -1) {
      return null;
    }
    int idx1 = StringUtils.indexOf(reverseSlug, '/', spIdx);
    String remainingSlug = reverseSlug.substring(idx1 + 1);
    int idx2 = StringUtils.indexOf(remainingSlug, '/');
    if (idx2 != -1) {
      store = remainingSlug.substring(idx2 + 1);
    }
    return store;
  }

  public static void main(String[] args) {
    String variantSlug1 = "onetouch-selectsimple-glucose-meter/SP-4310";
    String variantSlug2 = "gosf/onetouch-selectsimple-glucose-meter/SP-4310";
    MicrositeStoreVariantAction action = new MicrositeStoreVariantAction();
    System.out.println(action.getStoreNameFromVariantSlug(variantSlug1));
    System.out.println(action.getStoreNameFromVariantSlug(variantSlug2));
  }

  private void populateSlots() {
    if (variantPage != null && variantPage.getPageContents() != null && variantPage.getPageContents().size() > 0) {
      for (PageContent storePageContent : variantPage.getPageContents()) {
        String slotKey = getSlotKey(storePageContent.getSlot());
        slotToContent.put(slotKey, storePageContent);
        slotKeyToSlotName.put(slotKey, storePageContent.getSlot());
      }
    }
  }

  private String getSlotKey(String slot) {
    String slotKey = slot.toLowerCase();
    slotKey = slotKey.replaceAll("\\s", "");
    slotKey = slotKey.replaceAll("-", "");
    slotKey = slotKey.replaceAll("'", "");
    slotKey = slotKey.replaceAll("/", "");
    slotKey = slotKey.replaceAll("\\\\", "");
    slotKey = slotKey.replaceAll("&", "");
    slotKey = slotKey.replaceAll("\\+", "");

    return slotKey.trim();


  }

  private void shouldDisplayNavBar() {
    if (StringUtils.isNotBlank(storeVariantDetail.getDescription())) {
      displayNavBar = true;
    }

    if (!displayNavBar && storeVariantDetail.getGroups() != null) {
      displayNavBar = true;
    }
    if (!displayNavBar && variantPage != null && variantPage.getPageContents() != null && variantPage.getPageContents().size() > 0) {
      displayNavBar = true;
    }

    if (!displayNavBar && storeVariantDetail.getVariantReviewResponse() != null && storeVariantDetail.getVariantReviewResponse().getVariantReviews().size() > 0) {
      displayNavBar = true;
    }
  }

  /* public Long getStoreVariantId() {
    return storeVariantId;
  }

  public void setStoreVariantId(Long storeVariantId) {
    this.storeVariantId = storeVariantId;
  }*/

  public StoreVariantDetailApiResponse getStoreVariantDetail() {
    return storeVariantDetail;
  }

  public void setStoreVariantDetail(StoreVariantDetailApiResponse storeVariantDetail) {
    this.storeVariantDetail = storeVariantDetail;
  }

  public Map<String, Long> getAttrDefaultVariantMap() {
    return attrDefaultVariantMap;
  }

  public void setAttrDefaultVariantMap(Map<String, Long> attrDefaultVariantMap) {
    this.attrDefaultVariantMap = attrDefaultVariantMap;
  }


  public StoreVariantService getStoreVariantService() {
    return storeVariantService;
  }


  public boolean isDisplayNavBar() {
    return displayNavBar;
  }

  public void setDisplayNavBar(boolean displayNavBar) {
    this.displayNavBar = displayNavBar;
  }

  public VariantPage getVariantPage() {
    return variantPage;
  }

  public void setVariantPage(VariantPage variantPage) {
    this.variantPage = variantPage;
  }

  public Map<String, PageContent> getSlotToContent() {
    return slotToContent;
  }

  public void setSlotToContent(Map<String, PageContent> slotToContent) {
    this.slotToContent = slotToContent;
  }

  public Map<String, String> getSlotKeyToSlotName() {
    return slotKeyToSlotName;
  }

  public void setSlotKeyToSlotName(Map<String, String> slotKeyToSlotName) {
    this.slotKeyToSlotName = slotKeyToSlotName;
  }

  public String getNavKey() {
    return navKey;
  }

  public void setNavKey(String navKey) {
    this.navKey = navKey;
  }

  public String getVariantSlug() {
    return variantSlug;
  }

  public void setVariantSlug(String variantSlug) {
    this.variantSlug = variantSlug;
  }

  public int getShippingFreeAfter() {
    return shippingFreeAfter;
  }

  public int getShippingCharges() {
    return shippingCharges;
  }

  public void setShippingCharges(int shippingCharges) {
    this.shippingCharges = shippingCharges;
  }

  public void setShippingFreeAfter(int shippingFreeAfter) {
    this.shippingFreeAfter = shippingFreeAfter;
  }

  public String getBrandName() {
    return brandName;
  }

  public void setBrandName(String brandName) {
    this.brandName = brandName;
  }

  public String getStoreName() {
    return storeName;
  }

  public void setStoreName(String storeName) {
    this.storeName = storeName;
  }
}
