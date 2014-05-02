package com.hk.pact.service.user;

import com.hk.api.response.user.response.TokenValidationApiResponse;

/**
 * @author Rimal
 */
public interface TokenService {

  public TokenValidationApiResponse validateToken(String token);
}
