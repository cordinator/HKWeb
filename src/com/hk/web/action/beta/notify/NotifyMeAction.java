package com.hk.web.action.beta.notify;

import com.hk.api.request.hkr.notify.HkrUpdateNotifyMeUserDetails;
import com.hk.api.response.hkr.notify.HkrNotifyMeUpdateResponse;
import com.hk.pact.service.hkr.notify.HkrNotifyMeService;
import com.hk.web.action.beta.BaseAction;
import com.hk.web.resource.hkr.notify.HkrNotifyMeResource;
import com.hk.web.response.hkr.HkWebNotifyMeResponse;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.SimpleMessage;
import net.sourceforge.stripes.validation.SimpleError;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created with IntelliJ IDEA.
 * User: Sachit
 * Date: 12/20/13
 * Time: 4:38 PM
 * To change this template use File | Settings | File Templates.
 */
@Component
public class NotifyMeAction extends BaseAction {

  private Long storeVariantId;
  private String oldVariantId;
  private String userName;
  private String email;
  private String phone;
  private boolean hideForm;
  private String variantLink;

  @Autowired
  private HkrNotifyMeService hkrNotifyMeService;
  @Autowired
  private HkrNotifyMeResource hkrNotifyMeResource;

  @DefaultHandler
  public Resolution pre() {
    HkWebNotifyMeResponse hkWebNotifyMeResponse = getHkrNotifyMeResource().getNotifyMeUserDetails();
    if (hkWebNotifyMeResponse != null) {
      email = hkWebNotifyMeResponse.getEmail();
      userName = hkWebNotifyMeResponse.getName();
      phone = hkWebNotifyMeResponse.getContactNumber();
    }
    return new ForwardResolution("/pages/notify/notifyMe.jsp");
  }

  public Resolution saveData() {
    if (phone == null || email == null || userName == null) {
      addRedirectAlertMessage(new SimpleError("Please Enter Mandatory Values"));
      return new ForwardResolution("/pages/notify/notifyMe.jsp");
    }
    HkrUpdateNotifyMeUserDetails hkrUpdateNotifyMeUserDetails = new HkrUpdateNotifyMeUserDetails();
    hkrUpdateNotifyMeUserDetails.setContactNumber(phone);
    hkrUpdateNotifyMeUserDetails.setEmail(email);
    hkrUpdateNotifyMeUserDetails.setName(userName);
    hkrUpdateNotifyMeUserDetails.setVariantId(oldVariantId);
    HkrNotifyMeUpdateResponse hkrNotifyMeUpdateResponse = getHkrNotifyMeService().updateNotifyMe(hkrUpdateNotifyMeUserDetails);
    if (null != hkrNotifyMeUpdateResponse) {
      if (hkrNotifyMeUpdateResponse.isSuccess()) {
        addRedirectAlertMessage(new SimpleMessage(hkrNotifyMeUpdateResponse.getMessages().get(0)));
      } else {
        addRedirectAlertMessage(new SimpleError(hkrNotifyMeUpdateResponse.getMessages().get(0)));
      }
    } else {
      addRedirectAlertMessage(new SimpleError("An error occurred. Please try again in sometime."));
    }
    hideForm = true;
    return new ForwardResolution("/pages/notify/notifyMe.jsp");

  }

  public Long getStoreVariantId() {
    return storeVariantId;
  }

  public void setStoreVariantId(Long storeVariantId) {
    this.storeVariantId = storeVariantId;
  }

  public String getOldVariantId() {
    return oldVariantId;
  }

  public void setOldVariantId(String oldVariantId) {
    this.oldVariantId = oldVariantId;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public HkrNotifyMeService getHkrNotifyMeService() {
    return hkrNotifyMeService;
  }

  public HkrNotifyMeResource getHkrNotifyMeResource() {
    return hkrNotifyMeResource;
  }

  public boolean isHideForm() {
    return hideForm;
  }

  public void setHideForm(boolean hideForm) {
    this.hideForm = hideForm;
  }

  public String getVariantLink() {
    return variantLink;
  }

  public void setVariantLink(String variantLink) {
    this.variantLink = variantLink;
  }
}
