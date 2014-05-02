package com.hk.api.response.payment.response;

import com.hk.api.response.payment.IssuerDto;
import com.hk.common.constants.DtoJsonConstants;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.ArrayList;
import java.util.List;

public class SelectPaymentModeResponse {

   @JsonProperty(DtoJsonConstants.MODE_TYPE_NAME)
   private String name;
   @JsonProperty(DtoJsonConstants.MODE_TYPE_DISPLAY_NAME)
   private String displayName;
   @JsonProperty(DtoJsonConstants.ID)
   private Long id;
   @JsonProperty(DtoJsonConstants.PRIORITY)
   private long priority;

   @JsonProperty(DtoJsonConstants.PRIORITY_ISSUERS)
   private List<IssuerDto> priorityIssuers = new ArrayList<IssuerDto>();
   @JsonProperty(DtoJsonConstants.OTHER_ISSUERS)
   private List<IssuerDto> otherIssuers = new ArrayList<IssuerDto>();

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public long getPriority() {
    return priority;
  }

  public void setPriority(long priority) {
    this.priority = priority;
  }

  public List<IssuerDto> getPriorityIssuers() {
    return priorityIssuers;
  }

  public void setPriorityIssuers(List<IssuerDto> priorityIssuers) {
    this.priorityIssuers = priorityIssuers;
  }

  public List<IssuerDto> getOtherIssuers() {
    return otherIssuers;
  }

  public void setOtherIssuers(List<IssuerDto> otherIssuers) {
    this.otherIssuers = otherIssuers;
  }

  public String getDisplayName() {
    return displayName;
  }

  public void setDisplayName(String displayName) {
    this.displayName = displayName;
  }
}
