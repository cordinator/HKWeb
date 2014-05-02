package com.hk.web.action.beta.hk;

import com.hk.constants.HealthkartWebConstants;
import com.hk.pact.service.email.EmailService;
import com.hk.web.action.beta.BaseAction;
import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.validation.SimpleError;
import net.tanesha.recaptcha.ReCaptcha;
import net.tanesha.recaptcha.ReCaptchaFactory;
import net.tanesha.recaptcha.ReCaptchaResponse;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created with IntelliJ IDEA.
 * User: Ashish Bardhan
 * Date: 8/19/13
 * Time: 12:49 PM
 * To change this template use File | Settings | File Templates.
 */

@Component
public class ContactUsAction extends BaseAction {

  private String name;

  private String email;

  private String phone;

  private String msgSubject;

  private String msgText;

  private boolean error = false;

  private boolean clrText = false;

  @Autowired
  private EmailService emailService;

  @DefaultHandler
  public Resolution pre() {
    return new ForwardResolution("/pages/contactUs.jsp");
  }

  public Resolution sendMessage() {
    String challengeField = getContext().getRequest().getParameter("recaptcha_challenge_field");
    String responseField = getContext().getRequest().getParameter("recaptcha_response_field");
    if (StringUtils.isBlank(responseField))
      responseField = "null";

    ReCaptcha captcha = ReCaptchaFactory.newReCaptcha(HealthkartWebConstants.recaptchaPublicKey, HealthkartWebConstants.recaptchaPrivateKey, false);
    ReCaptchaResponse response = captcha.checkAnswer(getContext().getRequest().getRemoteAddr(), challengeField, responseField);
    error = true;
    if (!response.isValid()) {
      addRedirectAlertMessage(new SimpleError("Invalid Text Entered in Captcha"));
      return new ForwardResolution("/pages/contactUs.jsp");
    }
    clrText = true;
    getEmailService().sendContactUsMail(name, email, phone, msgSubject, msgText);
    addRedirectAlertMessage(new SimpleMessage("Your message has been sent. We'll get back to you within one business day."));
    return new ForwardResolution("/pages/contactUs.jsp");
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
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

  public String getMsgSubject() {
    return msgSubject;
  }

  public void setMsgSubject(String msgSubject) {
    this.msgSubject = msgSubject;
  }

  public String getMsgText() {
    return msgText;
  }

  public void setMsgText(String msgText) {
    this.msgText = msgText;
  }

  public EmailService getEmailService() {
    return emailService;
  }

  public boolean isError() {
    return error;
  }

  public void setError(boolean error) {
    this.error = error;
  }

  public boolean isClrText() {
    return clrText;
  }

  public void setClrText(boolean clrText) {
    this.clrText = clrText;
  }
}
