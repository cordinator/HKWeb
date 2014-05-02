package com.hk.pact.service.email;

import com.hk.api.response.user.response.UserApiResponse;


public interface EmailService {

  public boolean sendWelcomeEmail(UserApiResponse user, String activationLink);

  public boolean sendAccountActivationEmail(UserApiResponse user, String activationLink);

  public boolean sendForgotPasswordEmail(UserApiResponse user, String activationLink);

  public boolean sendContactUsMail(String name, String email, String phone, String subject, String message);

}
