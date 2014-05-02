package com.hk.web.listener;

import com.hk.api.response.url.UrlRedirectionDTO;
import com.hk.api.response.user.response.url.UrlRedirectionApiResponse;
import com.hk.constants.AppConstants;
import com.hk.impl.service.ServiceLocatorFactory;
import com.hk.pact.service.url.UrlRedirectionService;
import com.hk.web.filter.InAppUrlRedirectFilter;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.PropertyConfigurator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

public class HKStartupListener implements ServletContextListener {

  private static Logger logger = LoggerFactory.getLogger(HKStartupListener.class);

  public static String contextPath;
  public static String environmentDir;

  // Public constructor is required by servlet spec
  public HKStartupListener() {
  }

  public void contextInitialized(ServletContextEvent event) {

    System.out.println("**************starting Web **********");

    AppConstants.contextPath = event.getServletContext().getContextPath();
    AppConstants.appBasePath = event.getServletContext().getRealPath("/");

    System.out.println("********Starting Populating Url ***************");

    populateUrlMigrations();

    System.out.println("********End Populating Url ***************");

    System.out.println("**************completed Web***********");
  }


  @SuppressWarnings("unused")
  private String getEnvironmentDir(String appBasePath) {
    return null;
  }

  @SuppressWarnings("unused")
  private void setupLogger(String environmentDir) {
    String loggerPropertiesFileLocation = environmentDir + "/logger-config.properties";
    File log4jFile = new File(loggerPropertiesFileLocation);

    if (!log4jFile.exists()) {
      System.err.println("ERROR: Cannot read the configuration file at " + log4jFile.getAbsolutePath() + ". Please check the path of the config init param in web.xml");
      throw new RuntimeException("ERROR: Cannot read the configuration file. Please check the path of the config init param in web.xml");
    }

    // look up another init parameter that tells whether to watch this
    // configuration file for changes.
    String watch = "false";

    // since we have not yet set up our log4j environment,
    // we will use System.err for some basic information
    System.err.println("Using properties file: " + loggerPropertiesFileLocation);
    System.err.println("Watch is set to: " + watch);

    // use the props file to load up configuration parameters for log4j
    if (watch.equalsIgnoreCase("true"))
      PropertyConfigurator.configureAndWatch(loggerPropertiesFileLocation);
    else
      PropertyConfigurator.configure(loggerPropertiesFileLocation);

    System.out.println("log4j init success");
    // once configured, we can start using the Logger now

    org.slf4j.Logger logger = LoggerFactory.getLogger(HKStartupListener.class);
    logger.debug("Log4j + slf4j Initialised Successfully ... ");
  }

  public void contextDestroyed(ServletContextEvent sce) {
    /*
    * This method is invoked when the Servlet Context (the Web application) is undeployed or Application Server
    * shuts down.
    */
  }

  public void populateUrlMigrations() {
    System.out.println("*********** Getting url redirections from HKEdge *****************");
    UrlRedirectionService urlRedirectionService = ServiceLocatorFactory.getService(UrlRedirectionService.class);
    UrlRedirectionApiResponse urlRedirectionApiResponse = urlRedirectionService.getUrlRedirections();

    Map<String, String> urlRedirections = new HashMap<String, String>(21000);

    if(urlRedirectionApiResponse!=null && urlRedirectionApiResponse.getUrlRedirectionDTOList()!=null)
    for (UrlRedirectionDTO urlRedirectionDTO : urlRedirectionApiResponse.getUrlRedirectionDTOList()) {
      urlRedirections.put(urlRedirectionDTO.getOldUrl().toLowerCase().trim(), urlRedirectionDTO.getNewUrl());

      /**
       * handle + case for brand specific urls
       */
      String oldUrl = urlRedirectionDTO.getOldUrl();
      if (StringUtils.isNotBlank(oldUrl) && oldUrl.contains("/brand")) {
        String plusVerUrl = oldUrl.replaceAll("\\s", "+");

        urlRedirections.put(plusVerUrl.toLowerCase().trim(), urlRedirectionDTO.getNewUrl());
      }
    }

    System.out.println("********** Got the Url Redirections with Size ***" + (urlRedirections.size()) + "******");


    InAppUrlRedirectFilter.setUrlMappings(urlRedirections);

    Map<String, String> urlRedirectionsFallback = new HashMap<String, String>(6000);

    if(urlRedirectionApiResponse!=null && urlRedirectionApiResponse.getUrlRedirectionVOListByProductId()!=null)
    for (Map.Entry<String, UrlRedirectionDTO> urlRedirectionDTOEntry : urlRedirectionApiResponse.getUrlRedirectionVOListByProductId().entrySet()) {
      if (urlRedirectionDTOEntry.getValue() != null) {
        urlRedirectionsFallback.put(urlRedirectionDTOEntry.getKey(), urlRedirectionDTOEntry.getValue().getNewUrl());
      }
    }


    System.out.println("********** Got the Url Redirections fallbacks with Size ***" + (urlRedirectionsFallback.size()) + "******");

    InAppUrlRedirectFilter.setUrlMappingsByPid(urlRedirectionsFallback);
  }
}