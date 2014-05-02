package com.hk.web.filter;


import com.hk.impl.service.ServiceLocatorFactory;
import com.hk.pact.service.variant.StoreVariantService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class InAppUrlRedirectFilter implements Filter {

  private static Logger logger = LoggerFactory.getLogger(InAppUrlRedirectFilter.class);

  private static Map<String, String> urlMappings = new HashMap<String, String>();
  private static Map<String, String> urlMappingsByProductId = new HashMap<String, String>();

  private StoreVariantService storeVariantService;


  private static String getOldProductId(String uri) {


    try {
      String productIdRegex = "/product/.*/(([A-Za-z0-9]-?)+[0-9]+)/?\\??";
//      String emailRegEx = "/product/.*/([A-Za-z]+[0-9]+)/?\\??";
      Pattern p = Pattern.compile(productIdRegex);

      Matcher m = p.matcher(uri);
      if (!m.find()) {
        return null;
      } else {

        return m.group(1);
      }

/*    String oldUri = uri;
    int start = oldUri.lastIndexOf("/");
    int end = oldUri.lastIndexOf("?");

    if (end == -1) {
      end = oldUri.length();
    }


    return oldUri.substring(start + 1, end);*/
    }

    catch (Throwable t) {

    }

    return null;

  }

  public static void setUrlMappings(Map<String, String> urlMappings) {
    InAppUrlRedirectFilter.urlMappings = urlMappings;
  }

  public static void setUrlMappingsByPid(Map<String, String> urlMappingsByPid) {
    InAppUrlRedirectFilter.urlMappingsByProductId = urlMappingsByPid;
  }

  @Override
  public void init(FilterConfig filterConfig) throws ServletException {

  }

  @Override
  public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
    HttpServletRequest request = (HttpServletRequest) (servletRequest);
    String uri = request.getRequestURI();
    uri = uri.trim();
    uri = uri.toLowerCase();
    String queryParam = request.getQueryString();
    StringBuilder newUrl = null;

    String oldProductId = getOldProductId(uri);

    String trailingSlashUri = "", brandPlusUri = "";
    if (uri.contains("/brand")) {
      brandPlusUri = URLDecoder.decode(uri,"UTF-8");
      brandPlusUri = brandPlusUri.replaceAll("\\s", "+");
      System.out.println(uri + "  :_ >" + brandPlusUri);
    }

    /*logger.info("Old PId in app url redirect is " + oldProductId);
logger.info("new url in app url redirect is " + urlMappingsByProductId.get(oldProductId));*/

    //Removing / from the end of uri if it is only present

    if (uri.charAt(uri.length() - 1) == '/') {
      trailingSlashUri = uri;
      uri = uri.substring(0, uri.length() - 1);
    }

    boolean bool = true;
    System.out.println("------------------" + uri);


    if (uri.contains("search") && request.getParameter("query") != null) {
      bool = false;
      String query = request.getParameter("query");
      newUrl = new StringBuilder("/beta/search/Search.action?txtQ=");
      newUrl.append(query);
    } else if (urlMappings.containsKey(uri) && ((queryParam != null && !queryParam.contains("navKey")) || queryParam == null || queryParam.equals(""))) {
      newUrl = new StringBuilder(urlMappings.get(uri));
      System.out.println("------------------" + uri + "1" + newUrl);
    } else if (urlMappings.containsKey(trailingSlashUri) && ((queryParam != null && !queryParam.contains("navKey")) || queryParam == null || queryParam.equals(""))) {
      newUrl = new StringBuilder(urlMappings.get(trailingSlashUri));
      System.out.println("------------------" + uri + "2" + newUrl);
    } else if (urlMappings.containsKey(brandPlusUri) && ((queryParam != null && !queryParam.contains("navKey")) || queryParam == null || queryParam.equals(""))) {
      newUrl = new StringBuilder(urlMappings.get(brandPlusUri));
      System.out.println("------------------" + uri + "3" + newUrl);
    } else if (urlMappingsByProductId.containsKey(oldProductId) && ((queryParam != null && !queryParam.contains("navKey")) || queryParam == null || queryParam.equals(""))) {
      newUrl = new StringBuilder(urlMappingsByProductId.get(oldProductId));
      System.out.println("------------------" + uri + "4" + newUrl);
    } else if (queryParam !=null && queryParam.contains("navKey")) {
      String key = uri.concat("?");
        if(request.getParameter("navKey")!=null){
          key = key.concat("navKey=").concat(request.getParameter("navKey"));
        }
      System.out.println("key " + key);
      if (urlMappings.get(key.toLowerCase().trim()) != null) {
        newUrl = new StringBuilder(urlMappings.get(key.toLowerCase().trim()));
        StringBuilder replaceQueryParam = new StringBuilder("navKey=");
        replaceQueryParam.append(request.getParameter("navKey"));
        queryParam = queryParam.replace(replaceQueryParam.toString(),"");
        if(queryParam.startsWith("&")){
          queryParam = queryParam.replaceFirst("&","");
        }
        if(queryParam!=null && !queryParam.equals("")){
          newUrl.append("&").append(queryParam);
        }
        System.out.println("------------------" + uri + "5" + newUrl);
        bool = false;
      }
      System.out.println("------------------" + uri + "6" + newUrl);
    }


    if (newUrl != null) {
      if (bool) {
        if (queryParam != null && !queryParam.equals("")) {
          if (newUrl.toString().contains("?")) {
            newUrl.append("&").append(queryParam);
          } else {
            newUrl.append("?").append(queryParam);
          }
        }
      }
      HttpServletResponse response = (HttpServletResponse) servletResponse;
      response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
      response.setHeader("Location", newUrl.toString());
      return;
    }
    filterChain.doFilter(servletRequest, servletResponse);
  }

  @Override
  public void destroy() {

  }

  public StoreVariantService getStoreVariantService() {
    if (storeVariantService == null) {
      storeVariantService = ServiceLocatorFactory.getService(StoreVariantService.class);
    }
    return storeVariantService;
  }

  public static void main(String[] args) {
    System.out.println(getOldProductId("http://www.healthkart.com/product/braun-satinliner-es2-*free-gift*/BRN002"));
  }
}
