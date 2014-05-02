package com.hk.web.auth;

import com.hk.pact.service.user.UserSecurityService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authc.credential.CredentialsMatcher;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Set;


/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 24, 2013
 * Time: 3:47:25 PM
 */
@SuppressWarnings( "deprecation" )
public class RemoteUserRealm extends AuthorizingRealm {

  public static String realmName = "DefaultHibernateRealmName";
  public static String passwordSalt = "";
  public static int hashIterations = 1;

  public RemoteUserRealm() {
    super();
  }

  @Autowired
  private UserSecurityService userSecurityService;

  @Override
  public String getName() {
    return realmName;
  }

  @Override
  public CacheManager getCacheManager() {
    return null;
  }

  @Override
  @SuppressWarnings("unchecked")
  public Cache getAuthorizationCache() {
    return null;
  }

  @Override
  @SuppressWarnings("deprecation")
  public CredentialsMatcher getCredentialsMatcher() {
    SecurityCredentialsMatcher credentialsMatcher = new SecurityCredentialsMatcher();
    credentialsMatcher.setHashSalted(true);
    credentialsMatcher.setStoredCredentialsHexEncoded(false);
    credentialsMatcher.setHashIterations(hashIterations);
    return credentialsMatcher;
  }

  @SuppressWarnings("deprecation")
  class SecurityCredentialsMatcher extends org.apache.shiro.authc.credential.Md5CredentialsMatcher {
    protected Object getSalt(AuthenticationToken token) {
      return passwordSalt;
    }
  }

  public RemoteUserRealm(UserSecurityService userSecurityService) {
    this.userSecurityService = userSecurityService;
  }

  //private static final Log log                      = LogFactory.getLog(HibernateSecurityRealm.class);

  /*--------------------------------------------
  |    I N S T A N C E   V A R I A B L E S    |
  ============================================*/
  protected boolean permissionsLookupEnabled = false;

  /**
   * Enables lookup of permissions during authorization. The default is "false" - meaning that only roles are
   * associated with a user. Set this to true in order to lookup roles <b>and</b> permissions.
   *
   * @param permissionsLookupEnabled true if permissions should be looked up during authorization, or false if only
   *                                 roles should be looked up.
   */
  public void setPermissionsLookupEnabled(boolean permissionsLookupEnabled) {
    this.permissionsLookupEnabled = permissionsLookupEnabled;
  }

  /*--------------------------------------------
  |               M E T H O D S               |
  ============================================*/

  protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
    UsernamePasswordToken upToken = (UsernamePasswordToken) token;
    String username = upToken.getUsername();
    // Null username is invalid
    if (username == null) {
      throw new AccountException("Null usernames are not allowed by this realm.");
    }

    String password = getUserSecurityService().getPasswordForUser(username);
    Principal principal = getUserSecurityService().getPrincipal(username);
    if (password == null) {
      throw new UnknownAccountException("No account found for user [" + username + "]");
    }
    return buildAuthenticationInfo(principal, password.toCharArray());
  }

  protected AuthenticationInfo buildAuthenticationInfo(Principal principal, char[] password) {
    return new SimpleAuthenticationInfo(principal, password, getName());
  }

  /**
   * This implementation of the interface expects the principals collection to return a String username keyed off of
   * this realm's {@link #getName() name}
   *
   * @see AuthorizingRealm#getAuthorizationInfo(PrincipalCollection)
   */
  @Override
  protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

    // null usernames are invalid
    if (principals == null) {
      throw new AuthorizationException("PrincipalCollection method argument cannot be null.");
    }

    Principal userPrincipal = (Principal) principals.fromRealm(getName()).iterator().next();

    // Retrieve roles and permissions from database
    Set<String> roleNames = getUserSecurityService().getRoleNamesForUser(userPrincipal);
    Set<String> permissions = getUserSecurityService().getPermissions(userPrincipal, roleNames);

    SimpleAuthorizationInfo info = new SimpleAuthorizationInfo(roleNames);
    info.setStringPermissions(permissions);
    return info;
  }

  public UserSecurityService getUserSecurityService() {
    return userSecurityService;
  }
}
