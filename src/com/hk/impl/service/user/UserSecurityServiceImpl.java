package com.hk.impl.service.user;

import com.hk.api.response.user.response.UserApiResponse;
import com.hk.pact.service.user.UserSecurityService;
import com.hk.pact.service.user.UserService;
import com.hk.web.auth.Principal;
import com.shiro.PrincipalImpl;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 24, 2013
 * Time: 6:30:21 PM
 */
public class UserSecurityServiceImpl implements UserSecurityService {


  @Autowired
  private UserService userService;

  @Override
  public String getPasswordForUser(String userName) {
    UserApiResponse userResponse = getUserService().getUserResponseByLogin(userName);
    if (userResponse != null) {
      return userResponse.getPasswordChecksum();
    }
    return null;
  }

  @Override
  public Set<String> getRoleNamesForUser(Principal principal) {
    Set<String> roleNames = new LinkedHashSet<String>();
    UserApiResponse userResponse = getUserService().getUserResponseById(principal.getId());

    if (userResponse == null) {
      return roleNames;
    }
    roleNames.addAll(userResponse.getRoles());

    return roleNames;

  }

  @Override
  public Set<String> getPermissions(Principal principal, Set<String> roles) {
    Set<String> permissions = new HashSet<String>();

    UserApiResponse userResponse = getUserService().getUserResponseById(principal.getId());
    if (userResponse == null) {
      return permissions;
    }

    permissions.addAll(userResponse.getPermissions());

    return permissions;


  }

  @Override
  public Principal getPrincipal(String loginName) {
    UserApiResponse userResponse = getUserService().getUserResponseByLogin(loginName);

    if (userResponse == null) {
      return null;
    }
    return new PrincipalImpl(userResponse);


  }

  public UserService getUserService() {
    return userService;
  }
}
