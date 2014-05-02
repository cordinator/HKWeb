package com.hk.web.tag;

import com.hk.constants.email.Keys;
import com.hk.impl.service.ServiceLocatorFactory;
import com.hk.web.filter.WebContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: Sunit
 * Date: Jan 22, 2014
 * Time: 5:15:42 PM
 */
public class LoggingTag extends TagSupport {

  @Override
  public int doEndTag() throws JspException {

    String url = (String) ServiceLocatorFactory.getProperty(Keys.Env.loggingUrl);
    String token = (String) ServiceLocatorFactory.getProperty(Keys.Env.loggingToken);

    JspWriter out = pageContext.getOut();
    try {
        out.write(url +"/" +token);
    } catch (IOException e) {
      // should not happen
    }
    return EVAL_PAGE;
  }

}
