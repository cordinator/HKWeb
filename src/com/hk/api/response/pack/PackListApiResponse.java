package com.hk.api.response.pack;

import com.hk.api.response.AbstractApiBaseResponse;
import com.hk.common.constants.DtoJsonConstants;

import java.util.List;
import java.util.ArrayList;

import org.codehaus.jackson.annotate.JsonProperty;

/**
 * @author Rimal
 */
public class PackListApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.PACKS)
  private List<Pack> packs = new ArrayList<Pack>(0);


  public List<Pack> getPacks() {
    return packs;
  }

  public void setPacks(List<Pack> packs) {
    this.packs = packs;
  }
}