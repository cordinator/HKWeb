package com.hk.web.tag;

import com.hk.constants.email.Keys;
import com.hk.impl.service.ServiceLocatorFactory;
import com.hk.web.filter.WebContext;
import net.sourceforge.stripes.tag.HtmlTagSupport;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Aug 27, 2013
 * Time: 7:29:34 PM
 */
public class VirtualHostImageTag extends HtmlTagSupport {

 /* String path;

  public void setPath(String path) {
    this.path = path;
  }*/

  public int doStartTag() throws JspException {
    return SKIP_BODY;
  }

  @Override
  public int doEndTag() throws JspException {

    String host = (String) ServiceLocatorFactory.getProperty(Keys.Env.virtualHostImage);
    String sslHost = (String) ServiceLocatorFactory.getProperty(Keys.Env.virtualHostImageSsl);

    String useVirtualHostsString = (String) ServiceLocatorFactory.getProperty(Keys.Env.useVirtualHosts);
    String useSslVirtualHostsString = (String) ServiceLocatorFactory.getProperty(Keys.Env.useSslVirtualHosts);

    boolean useVirtualHosts = Boolean.parseBoolean(useVirtualHostsString);
    boolean useSslVirtualHosts = Boolean.parseBoolean(useSslVirtualHostsString);


    JspWriter out = pageContext.getOut();
		try {
			if (useVirtualHosts) {
				if (useSslVirtualHosts && WebContext.isSecure()) {
					out.write(sslHost);
				} else {
					out.write(host);
				}
			} else {
				out.write(((HttpServletRequest) pageContext.getRequest()).getContextPath());
			}
		} catch (IOException e) {
			//should not happen
		}
    return EVAL_PAGE;
  }
}
