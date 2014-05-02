package com.hk.web.filter;

import com.hk.impl.service.ServiceLocatorFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.stereotype.Component;

import javax.servlet.*;
import java.io.IOException;

@Component
public class RememberMeFilter implements Filter {

  private DefaultWebSecurityManager securityManager;
  private SecurityUtils securityUtils;

  public void init(FilterConfig filterConfig) throws ServletException {
    securityManager = (DefaultWebSecurityManager) ServiceLocatorFactory.getService("SecurityManager");
  }

  @SuppressWarnings("unused")
  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {


    /*Subject subject = ThreadContext.getSubject();

    boolean buildSubject = false;
    if (subject == null || subject.getPrincipals() == null) {
      buildSubject = true;
    } else if (subject.getPrincipals().isEmpty()) {
      buildSubject = true;
    }
    if (buildSubject) {


      WebSubjectContext context = new DefaultWebSubjectContext();
      context.setServletRequest(servletRequest);
      context.setServletResponse(servletResponse);

      subject = getSecurityManager().createSubject(context);

      // subject = new Subject.Builder(securityManager).buildSubject();
      ThreadContext.bind(subject);
    }*/

    /*if (getSecurityUtils().getSubject().isRemembered()) {
      PrincipalImpl principal = (PrincipalImpl) securityUtils.getSubject().getPrincipal();
    }*/
    filterChain.doFilter(servletRequest, servletResponse);
  }

  public void destroy() {
  }

  public DefaultWebSecurityManager getSecurityManager() {
    return securityManager;
  }

  public void setSecurityManager(DefaultWebSecurityManager securityManager) {
    this.securityManager = securityManager;
  }

  public SecurityUtils getSecurityUtils() {
    return securityUtils;
  }

  public void setSecurityUtils(SecurityUtils securityUtils) {
    this.securityUtils = securityUtils;
  }
}
