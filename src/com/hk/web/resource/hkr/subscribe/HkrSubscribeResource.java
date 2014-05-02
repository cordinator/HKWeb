package com.hk.web.resource.hkr.subscribe;


import com.hk.api.response.hkr.subscribe.HkrSubscribeResponse;
import com.hk.common.constants.DtoJsonConstants;
import com.hk.pact.service.hkr.speakTo.HkrSpeakToService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

@Component
@Path("/subscribe/")
public class HkrSubscribeResource {

  @Autowired
  private HkrSpeakToService hkrSpeakToService;

  @POST
  @Path("/{email}/")
  @Produces("application/json")
  public HkrSubscribeResponse subscribeUserByEmail(@PathParam(DtoJsonConstants.EMAIL) String email){
   return getHkrSpeakToService().subscribeUserByEmail(email);
  }

  public HkrSpeakToService getHkrSpeakToService() {
    return hkrSpeakToService;
  }
}
