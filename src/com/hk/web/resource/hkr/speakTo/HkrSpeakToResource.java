package com.hk.web.resource.hkr.speakTo;

import com.hk.api.request.hkr.notify.HkrUpdateSpeakToUserDetails;
import com.hk.api.response.hkr.speakTo.HkrSpeakToResponse;
import com.hk.pact.service.hkr.speakTo.HkrSpeakToService;
import com.hk.web.response.hkr.HkWebSpeakToResponse;
import com.shiro.PrincipalImpl;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

@Path("/speakTo/")
@Component
public class HkrSpeakToResource {

  @Autowired
  private HkrSpeakToService hkrSpeakToService;

  @GET
  @Path("/details/")
  @Produces("application/json")
  public HkWebSpeakToResponse getUserDetails(){
    HkWebSpeakToResponse hkWebSpeakToResponse = new HkWebSpeakToResponse();
    PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
    if(principal!=null){
      hkWebSpeakToResponse.setName(principal.getName());
      hkWebSpeakToResponse.setEmail(principal.getEmail());
      hkWebSpeakToResponse.addMessage("User Logged In");
    }else{
      hkWebSpeakToResponse.addMessage("No Logged In User");
    }
   return hkWebSpeakToResponse;
  }

  @POST
  @Path("/update/")
  @Produces("application/json")
  public HkrSpeakToResponse updateSpeakToResponse(HkrUpdateSpeakToUserDetails hkrUpdateSpeakToUserDetails){
    return getHkrSpeakToService().updateSpeakToResponse(hkrUpdateSpeakToUserDetails);
  }

  public HkrSpeakToService getHkrSpeakToService() {
    return hkrSpeakToService;
  }
}
