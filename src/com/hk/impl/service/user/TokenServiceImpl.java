package com.hk.impl.service.user;

import com.hk.api.response.user.response.TokenValidationApiResponse;
import com.hk.api.response.user.wrapper.TokenValidationResponseApiWrapper;
import com.hk.common.builder.URIBuilder;
import com.hk.common.constants.ServiceEndPoints;
import com.hk.common.constants.StoreConstants;
import com.hk.common.http.HkHttpClient;
import com.hk.exception.InvalidInputException;
import com.hk.pact.service.user.TokenService;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

/**
 * @author Rimal
 */
@Service
public class TokenServiceImpl implements TokenService {

  private static final String VALIDATE_TOKEN = "/validate/";

  public TokenValidationApiResponse validateToken(String token) {
    if (StringUtils.isBlank(token)) {
      throw new InvalidInputException("TOKEN_CANNOT_BE_BLANK");
    }

    URIBuilder builder = new URIBuilder().fromURI(ServiceEndPoints.USER_TOKEN + VALIDATE_TOKEN +
        StoreConstants.DEFAULT_STORE_ID_STR + URIBuilder.URL_TOKEN_SEP + token);

    TokenValidationResponseApiWrapper tokenValidationResponseApiWrapper =
        (TokenValidationResponseApiWrapper) HkHttpClient.executeGet(builder.getWebServiceUrl(), TokenValidationResponseApiWrapper.class);

    if (tokenValidationResponseApiWrapper != null && tokenValidationResponseApiWrapper.getTokenValidationApiResponse() != null) {
      return tokenValidationResponseApiWrapper.getTokenValidationApiResponse();
    }

    return null;
  }
}
