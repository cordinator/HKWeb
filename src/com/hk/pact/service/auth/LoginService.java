package com.hk.pact.service.auth;

import com.hk.exception.LoginException;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 24, 2013
 * Time: 6:37:06 PM
 */
public interface LoginService {


  public void createAndLoginAsGuestUser();

  public boolean login(String email, String password, boolean rememberMe) throws LoginException;


  public void logout();


}
