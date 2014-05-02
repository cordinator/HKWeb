package com.hk.impl.service.email;

import com.hk.api.response.user.response.UserApiResponse;
import com.hk.constants.email.EmailTemplateConstants;
import com.hk.constants.email.Keys;
import com.hk.pact.service.email.EmailSentService;
import com.hk.pact.service.email.EmailService;
import com.hk.pact.service.email.FreeMarkerService;
import com.hk.util.HKEmailUtils;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class EmailServiceImpl implements EmailService {

  @Value("#{hkEnvProps['" + Keys.Env.hkContactEmail + "']}")
  private String hkContactEmail;

  @Autowired
  private FreeMarkerService freeMarkerService;
  @Autowired
  private EmailSentService emailSentService;


  @Override
  @SuppressWarnings("unchecked")
  public boolean sendWelcomeEmail(UserApiResponse user, String activationLink) {
    HashMap valuesMap = new HashMap();
    valuesMap.put("user", user);
    valuesMap.put("activationLink", activationLink);

    Template freemarkerTemplate = getFreeMarkerService().getCampaignTemplate("/welcomeEmail.ftl");
    return getEmailSentService().sendHtmlEmail(freemarkerTemplate, valuesMap, user.getEmail(), user.getName());
  }

  @Override
  @SuppressWarnings("unchecked")
  public boolean sendAccountActivationEmail(UserApiResponse user, String activationLink) {
    HashMap valuesMap = new HashMap();
    valuesMap.put("user", user);
    valuesMap.put("activationLink", activationLink);

    Template freemarkerTemplate = getFreeMarkerService().getCampaignTemplate("/accountActivationEmail.ftl");
    return getEmailSentService().sendHtmlEmail(freemarkerTemplate, valuesMap, user.getEmail(), user.getName());
  }

  @Override
  @SuppressWarnings("unchecked")
  public boolean sendForgotPasswordEmail(UserApiResponse user, String activationLink) {
    HashMap valuesMap = new HashMap();
    valuesMap.put("user", user);
    valuesMap.put("link", activationLink);

    Template freemarkerTemplate = getFreeMarkerService().getCampaignTemplate("/passwordResetEmail.ftl");
    return getEmailSentService().sendHtmlEmail(freemarkerTemplate, valuesMap, user.getEmail(), user.getName());
  }

  @SuppressWarnings("unchecked")
  public boolean sendContactUsMail(String name, String email, String phone, String subject, String message) {
    HashMap valuesMap = new HashMap();
    valuesMap.put("name", name);
    valuesMap.put("email", email);
    valuesMap.put("phone", phone);
    valuesMap.put("subject", subject);
    valuesMap.put("message", HKEmailUtils.convertNewLineToBr(message));

    Template freemarkerTemplate = freeMarkerService.getCampaignTemplate(EmailTemplateConstants.contactUsEmail);
    return emailSentService.sendHtmlEmail(freemarkerTemplate, valuesMap, this.hkContactEmail, "HK Info", email);
  }

  public FreeMarkerService getFreeMarkerService() {
    return freeMarkerService;
  }

  public EmailSentService getEmailSentService() {
    return emailSentService;
  }
}