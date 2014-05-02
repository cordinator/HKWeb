package com.hk.web.action.beta;


import com.shiro.PrincipalImpl;
import com.hk.api.response.AbstractApiBaseResponse;
import net.sourceforge.stripes.action.ActionBean;
import net.sourceforge.stripes.action.ActionBeanContext;
import net.sourceforge.stripes.action.SimpleMessage;
import net.sourceforge.stripes.validation.SimpleError;
import net.sourceforge.stripes.validation.ValidationError;
import net.sourceforge.stripes.validation.ValidationErrors;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Author: Kani Date: Sep 1, 2008
 */
@Component
public class BaseAction implements ActionBean {
  private ActionBeanContext context;


  public ActionBeanContext getContext() {
    return context;
  }

  public void setContext(ActionBeanContext context) {
    this.context = context;
  }

  /*public org.apache.shiro.mgt.SecurityManager getSecurityManager() {
    return securityManager;
  }*/

  protected void addValidationError(String key, SimpleError localizableError) {
    getContext().getValidationErrors().add(key, localizableError);
  }

  public List<ValidationError> getMessageList(ValidationErrors validationErrors) {
    List<ValidationError> messageList = new ArrayList<ValidationError>();
    Collection<List<ValidationError>> errorCol = validationErrors.values();
    for (List<ValidationError> errors : errorCol) {
      messageList.addAll(errors);
    }
    return messageList;
  }

  public void addRedirectAlertMessage(SimpleMessage message) {
    List<net.sourceforge.stripes.action.Message> messages = getContext().getMessages("generalMessages");
    getContext().getRequest().setAttribute("gm", true);
    messages.add(message);
  }

  public void addRedirectAlertMessage(SimpleError errorMessage) {
    List<net.sourceforge.stripes.action.Message> messages = getContext().getMessages("errorMessages");
    getContext().getRequest().setAttribute("em", true);
    messages.add(errorMessage);
  }

  public PrincipalImpl getPrincipal() {
    return (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
  }

  public void addErrorMessages(AbstractApiBaseResponse abstractApiBaseResponse) {
    for (String errorMessage : abstractApiBaseResponse.getMessages()) {
      addRedirectAlertMessage(new SimpleMessage(errorMessage));
    }
  }

  /* 

  public User getPrincipalUser() {
    if (getPrincipal() == null)
      return null;
    return getUserService().getUserById(getPrincipal().getId());
  }

  public Subject getSubject() {
    return securityManager.getSubject();
  }

  public BreadcrumbInterceptor.Crumb getPreviousBreadcrumb() {
    return BreadcrumbInterceptor.getPreviousBreadcrumb(getContext().getRequest().getSession());
  }*/

  /*public BreadcrumbInterceptor.Crumb getCurrentBreadcrumb() {
    return BreadcrumbInterceptor.getCurrentBreadcrumb(getContext().getRequest().getSession());
  }*/

  public void noCache() {
    HttpServletResponse response = getContext().getResponse();
    response.addHeader("Pragma", "no-cache");
    response.addHeader("Cache-Control", "no-cache");
    response.addHeader("Cache-Control", "private");
    response.addHeader("Cache-Control", "no-store");
    response.addHeader("Cache-Control", "max-age=0");
    response.addHeader("Cache-Control", "s-maxage=0");
    response.addHeader("Cache-Control", "must-revalidate");
    response.addHeader("Cache-Control", "proxy-revalidate");
  }

  protected boolean isSecureRequest() {
    return getContext().getRequest().isSecure();
  }


}

