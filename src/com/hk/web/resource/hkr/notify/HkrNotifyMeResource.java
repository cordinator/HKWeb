package com.hk.web.resource.hkr.notify;

import com.hk.api.request.hkr.notify.HkrUpdateNotifyMeUserDetails;
import com.hk.api.response.hkr.notify.HkrNotifyMeResponse;
import com.hk.api.response.hkr.notify.HkrNotifyMeUpdateResponse;
import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.pact.service.hkr.notify.HkrNotifyMeService;
import com.hk.pact.service.user.UserService;
import com.hk.web.response.hkr.HkWebNotifyMeResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Component
@Path("/notify/")
public class HkrNotifyMeResource {

  @Autowired
  private HkrNotifyMeService hkrNotifyMeService;
  @Autowired
  private UserService userService;

  @GET
  @Path("/details/")
  @Produces("application/json")
  public HkWebNotifyMeResponse getNotifyMeUserDetails(){
    HkWebNotifyMeResponse hkWebNotifyMeResponse = new HkWebNotifyMeResponse();
    Long userId = getUserService().getLoggedInUserId();
    if(userId!=null){
      HkrNotifyMeResponse hkrNotifyMeResponse =  getHkrNotifyMeService().getNotifyMeResponseOfLoginUser(userId);
      if(hkrNotifyMeResponse!=null){
        hkWebNotifyMeResponse.setMessages(hkrNotifyMeResponse.getMessages());
        hkWebNotifyMeResponse.setContactNumber(hkrNotifyMeResponse.getContactNumber());
        hkWebNotifyMeResponse.setEmail(hkrNotifyMeResponse.getEmail());
        hkWebNotifyMeResponse.setName(hkrNotifyMeResponse.getName());
        hkWebNotifyMeResponse.setAccountLink(hkrNotifyMeResponse.getAccountLink());
        hkWebNotifyMeResponse.setSubscribedForNotify(hkrNotifyMeResponse.isSubscribedForNotify());
      }else{
        hkWebNotifyMeResponse.setException(true);
        hkWebNotifyMeResponse.addMessage(HKWebMessageConstants.ERROR);
      }
    }else{
      hkWebNotifyMeResponse.addMessage("No Logged-in User");
      hkWebNotifyMeResponse.setSubscribedForNotify(true);
    }
    return hkWebNotifyMeResponse;
  }

  @POST
  @Path("/update/")
  @Produces("application/json")
  public HkrNotifyMeUpdateResponse updateNotifyForVariant(HkrUpdateNotifyMeUserDetails hkrUpdateNotifyMeUserDetails){
      return getHkrNotifyMeService().updateNotifyMe(hkrUpdateNotifyMeUserDetails);
  }

  public HkrNotifyMeService getHkrNotifyMeService() {
    return hkrNotifyMeService;
  }

  public UserService getUserService() {
    return userService;
  }
}
