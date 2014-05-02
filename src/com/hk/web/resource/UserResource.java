package com.hk.web.resource;


import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.constants.rest.HKWebRequestConstants;
import com.hk.pact.service.user.UserService;
import com.hk.web.response.user.UserExistSentResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

@Component
@Path("/user/")
public class UserResource {

  @Autowired
  private UserService userService;

  @GET
  @Path("/userExist/{login}")
  @Produces("application/json")
  public UserExistSentResponse isValidLogin(@PathParam(HKWebRequestConstants.LOGIN) String login){
    UserExistSentResponse userExistSentResponse = new UserExistSentResponse();
    boolean isUserExist = false;
    try{
      isUserExist = getUserService().isUserExist(login);
    }catch (Exception e){
      userExistSentResponse.setException(true);
      userExistSentResponse.addMessage(HKWebMessageConstants.ERROR);
    }
    userExistSentResponse.setUserExist(isUserExist);
    if(isUserExist){
      userExistSentResponse.addMessage(HKWebMessageConstants.USER_EXIST);
    }else{
      userExistSentResponse.addMessage(HKWebMessageConstants.USER_NOT_EXIST);
    }
    return userExistSentResponse;
  }

  public UserService getUserService() {
    return userService;
  }
}
