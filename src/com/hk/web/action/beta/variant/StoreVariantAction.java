package com.hk.web.action.beta.variant;

import com.hk.api.response.ui.VariantPage;
import com.hk.api.response.ui.base.PageContent;
import com.hk.api.response.variant.response.StoreVariantDetailApiResponse;
import com.hk.common.constants.RequestConstants;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.constants.email.Keys;
import com.hk.pact.service.ui.PageService;
import com.hk.pact.service.variant.StoreVariantService;
import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.*;

/**
 * @author Rimal
 */
@UrlBinding("/sv/{variantSlug}")
@Component
public class StoreVariantAction extends BaseAction {

  private static Logger logger = LoggerFactory.getLogger(StoreVariantAction.class);
  private static final String STORE_PRODUCT_KEY_PREFIX = "SP-";

  @Value("#{hkEnvProps['" + Keys.Env.SHIPPING_FREE_AFTER + "']}")
  private int shippingFreeAfter;

  @Value("#{hkEnvProps['" + Keys.Env.SHIPPING_CHARGES + "']}")
  private int shippingCharges;

  private String navKey;
  private String variantSlug;
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
    Long storeVariantId = getStoreVariantIdFromNavKey();
    if (storeVariantId != null) {
      storeVariantDetail = getStoreVariantService().getStoreVariantById(storeVariantId);
    } else {
      Long storeProductId = getStoreProductIdFromVariantSlug();
      if (storeProductId != null) {
        storeVariantDetail = getStoreVariantService().getDefaultStoreVariantForStoreProduct(storeProductId);
      }
    }

    if (storeVariantDetail != null) {
      variantPage = storeVariantDetail.getVariantPage();
//      for (Map.Entry<String, Long> availVariantEntry : storeVariantDetail.getAvailableVariants().entrySet()) {
      for (Map.Entry<String, String> availVariantEntry : storeVariantDetail.getAvailableVariants().entrySet()) {
        List<String> attrValues = Arrays.asList(StringUtils.split(availVariantEntry.getKey(), RequestConstants.FILTER_SEP));
        for (String attrValue : attrValues) {
          attrDefaultVariantMap.put(attrValue, Long.parseLong(StringUtils.substringBefore( availVariantEntry.getValue(), DtoJsonConstants.VARIANT_ID_STOCK_STATUS_SEP)));
        }
      }

      shouldDisplayNavBar();
      populateSlots();

      if (storeVariantDetail.isSearchEnabled() || storeVariantDetail.isCatalogEnabled()) {
        return new ForwardResolution("/pages/variant/variantNew.jsp");
      } else if (storeVariantDetail.isDirectLinkEnabled()) {
        return new ForwardResolution("/pages/variant/basicVariant.jsp");
      } else {
        //return new ForwardResolution("/pages/404.jsp");
        return new ErrorResolution(404);
      }
    }
    //return new ForwardResolution("/pages/404.jsp");
    return new ErrorResolution(404);
  }

  private Long getStoreVariantIdFromNavKey() {
    if (StringUtils.isNotBlank(this.navKey)) {
      String navKey = this.navKey.toLowerCase();
      String variantLPIdentifier = PageService.VARIANT_LP_IDENTIFIER.toLowerCase();

      if (navKey.contains(variantLPIdentifier)) {
        try {
          Long storeVariantId = Long.parseLong(navKey.replaceAll(variantLPIdentifier, ""));
          return storeVariantId;
        } catch (NumberFormatException nfe) {
          logger.error("Error while extracting variant id from navKey:" + nfe.getMessage());
        }
      }
    }

    return null;
  }

  private Long getStoreProductIdFromVariantSlug() {
    if (StringUtils.isNotBlank(variantSlug)) {
      String variantSlug = this.variantSlug.toLowerCase();
      String spKeyPrefix = STORE_PRODUCT_KEY_PREFIX.toLowerCase();

      int indexForSpPrefix = variantSlug.lastIndexOf(spKeyPrefix);
      if (indexForSpPrefix != -1) {
        String storeProductIdentifier = variantSlug.substring(indexForSpPrefix);

        try {
          Long storeproductId = Long.parseLong(storeProductIdentifier.replaceAll(spKeyPrefix, ""));
          return storeproductId;
        } catch (NumberFormatException nfe) {
          logger.error("Error while extracting product id from variant slug:" + nfe.getMessage());
        }
      }
    }
    return null;
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
}
