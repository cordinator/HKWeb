package com.hk.impl.service.auth;

import com.hk.exception.LoginException;
import com.hk.pact.service.auth.LoginService;
import org.springframework.stereotype.Service;
import org.apache.shiro.SecurityUtils;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Sep 5, 2013
 * Time: 1:03:09 PM
 */
@Service
public class HkrLoginServiceImpl implements LoginService {


  @Override
  public void createAndLoginAsGuestUser() {
    throw new UnsupportedOperationException();
  }

  @Override
  public boolean login(String email, String password, boolean rememberMe) throws LoginException {
    throw new UnsupportedOperationException();
  }

  @Override
  public void logout() {
    SecurityUtils.getSubject().logout();
  }
}
