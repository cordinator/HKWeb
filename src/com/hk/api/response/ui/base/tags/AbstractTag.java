package com.hk.api.response.ui.base.tags;

import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Rimal
 */
public abstract class AbstractTag {

  @JsonProperty(DtoJsonConstants.TAGS)
  protected List<String> tagList = new ArrayList<String>();


  public List<String> getTagList() {
    return tagList;
  }

  public void setTagList(List<String> tagList) {
    this.tagList = tagList;
  }
}
