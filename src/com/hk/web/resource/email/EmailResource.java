package com.hk.web.resource.email;

import com.hk.api.response.user.response.UserApiResponse;
import com.hk.api.response.user.response.activation.UserActivationTokenApiResponse;
import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.pact.service.email.EmailService;
import com.hk.pact.service.user.UserActivationService;
import com.hk.pact.service.user.UserService;
import com.hk.web.response.GenericResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

/**
 * Created with IntelliJ IDEA.
 * User: Shrey
 * Date: 6/18/13
 * Time: 2:59 PM
 * To change this template use File | Settings | File Templates.
 */
@Component
@Path("/email/")
public class EmailResource {

  @Autowired
  private UserService userService;
  @Autowired
  private UserActivationService userActivationService;
  @Autowired
  private EmailService emailService;

  @GET
  @Path("/activate")
  public GenericResponse sendActivationEmail() {

    GenericResponse genericResponse = new GenericResponse();

    Long userId = getUserService().getLoggedInUserId();
    if (userId != null) {

      UserActivationTokenApiResponse userActivationTokenResponse = getUserActivationService().regenerateTokenForUser(userId);

      if (userActivationTokenResponse != null) {

        String token = userActivationTokenResponse.getToken();

        String activationLink = getUserActivationService().createActivationLink(token, userId);

        UserApiResponse userResponse = getUserService().getUserResponseById(userId);
        try {
          getEmailService().sendAccountActivationEmail(userResponse, activationLink);
          genericResponse.setException(false).addMessage(HKWebMessageConstants.EMAIL_SUCCESS);
        } catch (Exception e) {
          genericResponse.setException(true).addMessage(HKWebMessageConstants.ERROR);
        }
      } else {
        genericResponse.setException(true).addMessage(HKWebMessageConstants.ERROR);
      }
    } else {
      genericResponse.setException(true).addMessage(HKWebMessageConstants.INVALID_USER);
    }
    return genericResponse;
  }

  public UserService getUserService() {
    return userService;
  }

  public UserActivationService getUserActivationService() {
    return userActivationService;
  }

  public EmailService getEmailService() {
    return emailService;
  }
}
