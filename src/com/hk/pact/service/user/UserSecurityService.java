package com.hk.pact.service.user;

import com.hk.web.auth.Principal;

import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 24, 2013
 * Time: 6:29:31 PM
 */
public interface UserSecurityService {

  public String getPasswordForUser(String userName);

  public Set<String> getRoleNamesForUser(Principal principal);

  public Set<String> getPermissions(Principal principal, Set<String> roles);

  public Principal getPrincipal(String loginName);
}
