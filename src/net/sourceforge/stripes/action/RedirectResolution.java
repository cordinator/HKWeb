package net.sourceforge.stripes.action;

import com.hk.web.stripes.HKJspFileConstants;
import com.hk.web.stripes.HKResolutionHelper;
import net.sourceforge.stripes.controller.FlashScope;
import net.sourceforge.stripes.controller.StripesConstants;
import net.sourceforge.stripes.util.Log;
import org.apache.commons.lang.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.HashSet;

/**
 * @author Rimal
 */
public class RedirectResolution extends OnwardResolution<RedirectResolution> implements Resolution {
  private static final Log log = Log.getInstance(RedirectResolution.class);
  private boolean prependContext = true;
  private boolean includeRequestParameters;
  private Collection<ActionBean> beans; // used to flash action beans


  /**
   * if site mode cookie exists and value is mobile site mode, then search for equivalent mobile jsp;
   * if jsp not found, then return desktop mode jsp
   *
   * @param path the path within the web application that the user should be forwarded to
   */
  public RedirectResolution(String path) {
    this(path, true);
  }

  public RedirectResolution(String path, boolean prependContext) {
    super(path);
    this.prependContext = prependContext;

    if (path.endsWith(".jsp")) {
      if (HKResolutionHelper.shouldGetMobileJsp()) {
        String equivalentMobileJspPath = StringUtils.replace(path, ".jsp", HKJspFileConstants.MOBILE_JSP_SUFFIX + ".jsp");

        if (HKResolutionHelper.isValidPath(equivalentMobileJspPath)) {
          this.setPath(equivalentMobileJspPath);
        }
      }

      if (!HKResolutionHelper.isValidPath(path)) {
        if (!path.equals(HKResolutionHelper.FALLBACK_PATH)) {
          this.setPath(HKResolutionHelper.FALLBACK_PATH);
        }
      }
    }
  }

  public RedirectResolution(Class<? extends ActionBean> beanType) {
    super(beanType);
  }

  public RedirectResolution(Class<? extends ActionBean> beanType, String event) {
    super(beanType, event);
  }

  @Override
  public String getAnchor() {
    return super.getAnchor();
  }

  @Override
  public RedirectResolution setAnchor(String anchor) {
    return super.setAnchor(anchor);
  }

  public RedirectResolution includeRequestParameters(boolean inc) {
    this.includeRequestParameters = inc;
    return this;
  }

  public RedirectResolution flash(ActionBean bean) {
    if (this.beans == null) {
      this.beans = new HashSet<ActionBean>();
    }

    this.beans.add(bean);
    return this;
  }


  @SuppressWarnings("unchecked")
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    if (this.includeRequestParameters) {
      addParameters(request.getParameterMap());
    }

    // Add any beans to the flash scope
    if (this.beans != null) {
      FlashScope flash = FlashScope.getCurrent(request, true);
      for (ActionBean bean : this.beans) {
        flash.put(bean);
      }
    }

    // If a flash scope exists, add the parameter to the request
    FlashScope flash = FlashScope.getCurrent(request, false);
    if (flash != null) {
      addParameter(StripesConstants.URL_KEY_FLASH_SCOPE_ID, flash.key());
    }

    // Prepend the context path if requested
    String url = getUrl(request.getLocale());
    if (prependContext) {
      String contextPath = request.getContextPath();
      if (contextPath.length() > 1)
        url = contextPath + url;
    }

    url = response.encodeRedirectURL(url);
    log.trace("Redirecting ", this.beans == null ? "" : "(w/flashed bean) ", "to URL: ", url);

    response.sendRedirect(url);
  }
}
