package com.hk.pact.service.user;

import com.hk.api.response.user.response.activation.ActivateUserApiResponse;
import com.hk.api.response.user.response.activation.UserActivationTokenApiResponse;

/**
 * @author Rimal
 */
public interface UserActivationService {

  public UserActivationTokenApiResponse regenerateTokenForUser(Long userId);

  public ActivateUserApiResponse activateUser(String activationLink);

  public String createActivationLink(String token, Long userId);
}
