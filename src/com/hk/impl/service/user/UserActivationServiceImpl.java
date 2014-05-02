package com.hk.impl.service.user;

import com.hk.api.response.user.response.activation.ActivateUserApiResponse;
import com.hk.api.response.user.response.activation.UserActivationTokenApiResponse;
import com.hk.api.response.user.wrapper.activation.ActivateUserResponseApiWrapper;
import com.hk.api.response.user.wrapper.activation.UserActivationTokenResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.exception.InvalidInputException;
import com.hk.pact.service.user.UserActivationService;
import com.hk.util.HKEmailUtils;
import com.hk.web.manager.LinkManager;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.InvalidParameterException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Rimal
 */
@Service
public class UserActivationServiceImpl implements UserActivationService {

  private static Logger logger = LoggerFactory.getLogger(UserActivationService.class);

  private static final String ACTIVATE = "/active/";
  private static final String REGENERATE = "/regenerate/";

  @Autowired
  private LinkManager linkManager;


  public UserActivationTokenApiResponse regenerateTokenForUser(Long userId) {
    if (userId == null) {
      throw new InvalidParameterException("USER_ID_CANNOT_BE_BLANK");
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER_ACTIVATION + REGENERATE +
        StoreConstants.DEFAULT_STORE_ID_STR + URIBuilder.URL_TOKEN_SEP + userId.toString());

    UserActivationTokenResponseApiWrapper userActivationTokenResponseWrapper =
        (UserActivationTokenResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), UserActivationTokenResponseApiWrapper.class);

    if (userActivationTokenResponseWrapper != null && userActivationTokenResponseWrapper.getUserActivationTokenResponse() != null) {
      return userActivationTokenResponseWrapper.getUserActivationTokenResponse();
    }

    return null;
  }

  @Override
  public ActivateUserApiResponse activateUser(String activationLink) {
    if (StringUtils.isBlank(activationLink)) {
      throw new InvalidParameterException("ACTIVATION_LINK_CANNOT_BE_BLANK");
    }

    try {
      Map<String, String> linkMap = HKEmailUtils.parseActivationLink(activationLink);
      String userId = linkMap.get("userId");
      String token = linkMap.get("token");
      if (userId == null || token == null) {
        throw new InvalidInputException("USER_ID OR TOKEN_CANNOT_BE_BLANK");
      }

      URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER_ACTIVATION + ACTIVATE +
          StoreConstants.DEFAULT_STORE_ID_STR + URIBuilder.URL_TOKEN_SEP + userId + URIBuilder.URL_TOKEN_SEP + token);

      ActivateUserResponseApiWrapper activateUserResponseWrapper = (ActivateUserResponseApiWrapper) HkHttpClient.executePostForObject(
          builder.getWebServiceUrl(), new HashMap<String, String>(0), ActivateUserResponseApiWrapper.class);
      if (activateUserResponseWrapper != null && activateUserResponseWrapper.getActivateUserResponse() != null) {
        if (activateUserResponseWrapper.getActivateUserResponse().isException()) {
          return null;
        }
        return activateUserResponseWrapper.getActivateUserResponse();
      }
    } catch (InvalidInputException e) {
      logger.error("Exception while parsing user activation link: " + e.getMessage());
      return null;
    }
    return null;
  }

  public String createActivationLink(String token, Long userId) {
    String queryString = HKEmailUtils.createActivationLink(userId, token);
    return getLinkManager().getUserActivationLink(queryString);
  }


  public LinkManager getLinkManager() {
    return linkManager;
  }
}