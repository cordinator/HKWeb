package net.sourceforge.stripes.action;

import com.hk.web.stripes.HKJspFileConstants;
import com.hk.web.stripes.HKResolutionHelper;
import net.sourceforge.stripes.controller.StripesConstants;
import net.sourceforge.stripes.util.Log;
import org.apache.commons.lang.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Rimal
 */
public class ForwardResolution extends OnwardResolution<ForwardResolution> implements Resolution {
  private boolean autoInclude = true;
  private static final Log log = Log.getInstance(ForwardResolution.class);
  private String event;

  /**
   * if site mode cookie exists and value is mobile site mode, then search for equivalent mobile jsp;
   * if jsp not found, then return desktop mode jsp
   *
   * @param path the path within the web application that the user should be forwarded to
   */
  public ForwardResolution(String path) {
    super(path);

    if (path.endsWith(".jsp")) {
      if (HKResolutionHelper.shouldGetMobileJsp()) {
        String equivalentMobileJspPath = StringUtils.replace(path, ".jsp", HKJspFileConstants.MOBILE_JSP_SUFFIX + ".jsp");
       /* System.out.println("equivalentMobileJspPath = "+equivalentMobileJspPath);*/
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

  /**
   * Constructs a ForwardResolution that will forward to the URL appropriate for
   * the ActionBean supplied.  This constructor should be preferred when forwarding
   * to an ActionBean as it will ensure the correct URL is always used.
   *
   * @param beanType the Class object representing the ActionBean to redirect to
   */
  public ForwardResolution(Class<? extends ActionBean> beanType) {
    super(beanType);
  }

  /**
   * Constructs a ForwardResolution that will forward to the URL appropriate for
   * the ActionBean supplied.  This constructor should be preferred when forwarding
   * to an ActionBean as it will ensure the correct URL is always used.
   *
   * @param beanType the Class object representing the ActionBean to redirect to
   * @param event    the event that should be triggered on the redirect
   */
  public ForwardResolution(Class<? extends ActionBean> beanType, String event) {
    super(beanType, event);
    this.event = event;
  }

  /**
   * If true then the ForwardResolution will automatically detect when it is executing
   * as part of a server-side Include and <i>include</i> the supplied URL instead of
   * forwarding to it.  Defaults to true.
   *
   * @param auto whether or not to automatically detect and use includes
   */
  public void autoInclude(boolean auto) {
    this.autoInclude = auto;
  }

  /**
   * Attempts to forward the user to the specified path.
   *
   * @throws javax.servlet.ServletException thrown when the Servlet container encounters an error
   * @throws java.io.IOException            thrown when the Servlet container encounters an error
   */
  public void execute(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String path = getUrl(request.getLocale());

    // Set event name as a request attribute
    String oldEvent = (String) request.getAttribute(StripesConstants.REQ_ATTR_EVENT_NAME);
    request.setAttribute(StripesConstants.REQ_ATTR_EVENT_NAME, event);

    // Figure out if we're inside an include, and use an include instead of a forward
    if (autoInclude && request.getAttribute(StripesConstants.REQ_ATTR_INCLUDE_PATH) != null) {
      log.trace("Including URL: ", path);
      request.getRequestDispatcher(path).include(request, response);
    } else {
      log.trace("Forwarding to URL: ", path);
      request.getRequestDispatcher(path).forward(request, response);
    }

    // Revert event name to its original value
    request.setAttribute(StripesConstants.REQ_ATTR_EVENT_NAME, oldEvent);
  }
}
