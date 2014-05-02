package com.hk.pact.service.email;

import freemarker.template.Template;
import org.apache.commons.mail.HtmlEmail;


public interface EmailSentService {

  public boolean sendHtmlEmailNoReply(Template template, Object templateValues, String toEmail, String toName);

  public boolean sendHtmlEmail(Template template, Object templateValues, String toEmail, String toName);

  public boolean sendHtmlEmail(Template template, Object templateValues, String toEmail, String toName, String replyToEmail);

}
