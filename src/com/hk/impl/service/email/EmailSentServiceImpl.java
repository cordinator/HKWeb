package com.hk.impl.service.email;

import com.hk.constants.email.Keys;
import com.hk.pact.service.email.EmailSentService;
import com.hk.pact.service.email.FreeMarkerService;
import freemarker.template.Template;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;


@Service
public class EmailSentServiceImpl implements EmailSentService {

  private static Logger logger = LoggerFactory.getLogger(EmailSentService.class);

  @Autowired
  private FreeMarkerService freeMarkerService;

  private final static String noReplyEmail = Keys.Env.hkNoReplyEmail;
  private final static String noReplyName = Keys.Env.hkNoReplyName;
  private final static String contactEmail = Keys.Env.hkContactEmail;
  private final static String contactName = Keys.Env.hkContactName;


  public boolean sendHtmlEmailNoReply(Template template, Object templateValues, String toEmail, String toName) {
    return sendHtmlEmail(template, templateValues, noReplyEmail, noReplyName, toEmail, toName, null, null, null);
  }

  public boolean sendHtmlEmail(Template template, Object templateValues, String toEmail, String toName) {
    return sendHtmlEmail(template, templateValues, noReplyEmail, noReplyName, toEmail, toName, contactEmail, contactName, null);
  }

  public boolean sendHtmlEmail(Template template, Object templateValues, String toEmail, String toName, String replyToEmail) {
    return sendHtmlEmail(template, templateValues, noReplyEmail, noReplyName, toEmail, toName, replyToEmail, null, null);
  }

  public Map<String, HtmlEmail> createHtmlEmail(Template template, Object templateValues, String fromEmail, String fromName, String toEmail, String toName, String replyToEmail,
                                                String replyToName, Map<String, String> headerMap) {
    Map<String, HtmlEmail> returnMap = new HashMap<String, HtmlEmail>();
    FreeMarkerServiceImpl.RenderOutput renderOutput = getFreeMarkerService().processCampaignTemplate(template, templateValues);
    HtmlEmail htmlEmail = null;
    try {                                                                       
      if (renderOutput == null) {
        logger.error("Error while rendering freemarker template in sendHtmlEmail");
        return null;
      }
      htmlEmail = new HtmlEmail();
      htmlEmail.addTo(toEmail, toName).setFrom(fromEmail, fromName).setSubject(renderOutput.getSubject()).setHostName("localhost");
      if (headerMap != null && !headerMap.isEmpty())
        htmlEmail.setHeaders(headerMap);
      if (!StringUtils.isBlank(replyToEmail))
        htmlEmail.addReplyTo(replyToEmail, replyToName);
      htmlEmail.setHtmlMsg(renderOutput.getMessage());
      returnMap.put(toEmail, htmlEmail);

      logger.debug("Trying to send email with Subject: ");
      logger.debug(renderOutput.getSubject());
      logger.debug("Body:");
      logger.debug(renderOutput.getMessage());
    } catch (EmailException ex) {
      logger.error("EmailException in sendHtmlEmail for template " + ex.getCause() + " message : " + ex.getMessage());
      return null;
    }
    return returnMap;
  }

  private boolean sendHtmlEmail(Template template, Object templateValues, String fromEmail, String fromName, String toEmail, String toName, String replyToEmail,
                                String replyToName, Map<String, String> headerMap) {
    // Template freemarkerTemplate = freeMarkerService.getCampaignTemplate(template);

    Map<String, HtmlEmail> htmlEmailMap = createHtmlEmail(template, templateValues, fromEmail, fromName, toEmail, toName, replyToEmail, replyToName, headerMap);
    if (htmlEmailMap == null) {
      return false;
    }

    for (Map.Entry<String, HtmlEmail> mapEntry : htmlEmailMap.entrySet()) {
      HtmlEmail htmlEmail = mapEntry.getValue();
      // send this email asynchrounously, we do not want to wait for this process
      sendEmail(htmlEmail);
    }
    return true;
  }

  protected void sendEmail(Email email) {
    SendEmailAsyncThread emailAsyncThread = new SendEmailAsyncThread(email);
    emailAsyncThread.start();
  }

  /**
   * This is an inner class which extends Thread and send an email in a different thread
   */
  private class SendEmailAsyncThread extends Thread {
    private final Email email;

    SendEmailAsyncThread(Email email) {
      this.email = email;
    }

    public void run() {
      try {
        email.send();
      } catch (EmailException e) {
        logger.error("EmailException in SendEmailAsyncThread.run", e);
      }
    }
  }

  public FreeMarkerService getFreeMarkerService() {
    return freeMarkerService;
  }
}
