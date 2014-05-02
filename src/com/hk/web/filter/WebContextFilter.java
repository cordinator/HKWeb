package com.hk.web.filter;

import javax.servlet.*;
import java.io.IOException;

public class WebContextFilter implements Filter {

  public void destroy() {
  }

  public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
    WebContext.setContext(req,resp);
    chain.doFilter(req, resp);
  }

  public void init(FilterConfig config) throws ServletException {
  }
}
