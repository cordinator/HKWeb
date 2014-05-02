package com.hk.api.response.variant.response;

import com.hk.api.response.brand.Brand;
import com.hk.api.response.ui.VariantPage;
import com.hk.api.response.variant.attribute.VariantAttribute;
import com.hk.api.response.variant.config.VariantConfigOption;
import com.hk.api.response.variant.review.response.VariantReviewApiResponse;
import com.hk.api.response.video.Video;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Rimal
 */
public class StoreVariantDetailApiResponse extends StoreVariantApiResponse {

  @JsonProperty(DtoJsonConstants.ATTRIBUTES)
  private List<VariantAttribute> attributes = new ArrayList<VariantAttribute>();
  @JsonProperty(DtoJsonConstants.CONFIG_OPTIONS)
  private List<VariantConfigOption> configOptionList = new ArrayList<VariantConfigOption>();
  @JsonProperty(DtoJsonConstants.SELECTED_ATTRIBUTES)
  private Map<String, String> selectedAttributes = new HashMap<String, String>();
  @JsonProperty(DtoJsonConstants.AVAILABLE_VARIANTS)
  private Map<String, String> availableVariants = new HashMap<String, String>();
//  private Map<String, Long> availableVariants = new HashMap<String, Long>();

  @JsonProperty(DtoJsonConstants.REVIEW_RESPONSE)
  private VariantReviewApiResponse variantReviewResponse;

  @JsonProperty(DtoJsonConstants.PAGE)
  private VariantPage variantPage;
  @JsonProperty(DtoJsonConstants.BRAND)
  private Brand brand;

  @JsonProperty(DtoJsonConstants.BRAND_NAME)
  private String brandName;

  @JsonProperty(DtoJsonConstants.JIT)
  private boolean jit;
  @JsonProperty(DtoJsonConstants.VIDEO)
  private Video video;

  @JsonProperty(DtoJsonConstants.VARIANT_COMPARE)
  private List<LightVariantApiResponse> compareStoreVariants = new ArrayList<LightVariantApiResponse>();


  /*@JsonProperty(DtoJsonConstants.DIRECT_LINK_ENABLED)
  private boolean directLinkEnabled;*/

  public List<VariantAttribute> getAttributes() {
    return attributes;
  }

  public void setAttributes(List<VariantAttribute> attributes) {
    this.attributes = attributes;
  }

  public List<VariantConfigOption> getConfigOptionList() {
    return configOptionList;
  }

  public void setConfigOptionList(List<VariantConfigOption> configOptionList) {
    this.configOptionList = configOptionList;
  }

  public Map<String, String> getSelectedAttributes() {
    return selectedAttributes;
  }

  public void setSelectedAttributes(Map<String, String> selectedAttributes) {
    this.selectedAttributes = selectedAttributes;
  }

  public Map<String, String> getAvailableVariants() {
    return availableVariants;
  }

  public void setAvailableVariants(Map<String, String> availableVariants) {
    this.availableVariants = availableVariants;
  }

  public VariantReviewApiResponse getVariantReviewResponse() {
    return variantReviewResponse;
  }

  public void setVariantReviewResponse(VariantReviewApiResponse variantReviewResponse) {
    this.variantReviewResponse = variantReviewResponse;
  }

  public VariantPage getVariantPage() {
    return variantPage;
  }

  public void setVariantPage(VariantPage variantPage) {
    this.variantPage = variantPage;
  }

  public Brand getBrand() {
    return brand;
  }

  public void setBrand(Brand brand) {
    this.brand = brand;
  }

  public String getBrandName() {
    return brandName;
  }

  public void setBrandName(String brandName) {
    this.brandName = brandName;
  }

  public Video getVideo() {
    return video;
  }

  public void setVideo(Video video) {
    this.video = video;
  }

  public List<LightVariantApiResponse> getCompareStoreVariants() {
    return compareStoreVariants;
  }

  public void setCompareStoreVariants(List<LightVariantApiResponse> compareStoreVariants) {
    this.compareStoreVariants = compareStoreVariants;
  }

  public String getCompareStoreVariantIdsAsString() {
    StringBuilder compareStoreVariantIdsStr = new StringBuilder("");
    if (compareStoreVariants != null && compareStoreVariants.size() > 0) {
      for (LightVariantApiResponse lightVariantApiResponse : compareStoreVariants) {
        if (lightVariantApiResponse != null) {
          compareStoreVariantIdsStr.append(lightVariantApiResponse.getId() + ",");
        }
      }
    }
    return compareStoreVariantIdsStr.toString();
  }

  /*public boolean isJit() {
    return jit;
  }

  public void setJit(boolean jit) {
    this.jit = jit;
  }*/

  /*public boolean isDirectLinkEnabled() {
    return directLinkEnabled;
  }

  public boolean getDirectLinkEnabled() {
    return directLinkEnabled;
  }

  public void setDirectLinkEnabled(boolean directLinkEnabled) {
    this.directLinkEnabled = directLinkEnabled;
  }*/
}
