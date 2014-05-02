package com.hk.api.response.variant.response;

import com.hk.api.response.variant.group.VariantGroup;
import com.hk.api.response.variant.image.VariantImage;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.*;

/**
 * @author Rimal
 */
public class StoreVariantApiResponse extends StoreVariantBasicApiResponse {

  @JsonProperty(DtoJsonConstants.KEY_POINTS)
  protected List<String> keyPoints = new LinkedList<String>();
  @JsonProperty(DtoJsonConstants.DESCRIPTION)
  protected String description;
  @JsonProperty(DtoJsonConstants.IMAGES)
  protected List<VariantImage> images = new ArrayList<VariantImage>();

  @JsonProperty(DtoJsonConstants.GROUPS)
  protected List<VariantGroup> groups = new ArrayList<VariantGroup>();

  protected Map<String, VariantGroup> internalNameToGrp = null;


  public List<String> getKeyPoints() {
    return keyPoints;
  }

  public void setKeyPoints(List<String> keyPoints) {
    this.keyPoints = keyPoints;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public List<VariantImage> getImages() {
    return images;
  }

  public void setImages(List<VariantImage> images) {
    this.images = images;
  }

  public List<VariantGroup> getGroups() {
    return groups;
  }

  public VariantGroup getVariantGroup(String groupInternalName) {
    if (internalNameToGrp == null) {
      internalNameToGrp = new HashMap<String, VariantGroup>();
      for (VariantGroup variantGroup : this.groups) {
        internalNameToGrp.put(variantGroup.getName(), variantGroup);
      }
    }

    return internalNameToGrp.get(groupInternalName);
  }

  public void setGroups(List<VariantGroup> groups) {
    this.groups = groups;
  }
}
