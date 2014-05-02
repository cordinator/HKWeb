package com.shiro;

import com.hk.api.response.user.response.UserApiResponse;
import com.hk.web.auth.Principal;


/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 24, 2013
 * Time: 5:02:06 PM
 */
public class PrincipalImpl implements Principal {

  public static final long serialVersionUID = 999L;
  private Long id;
  private String name;
  private String email;
  private String userHash;
  private Integer orderCount;
  private String gender;

  private Long assumedId;
  private String assumedName;
  private String assumedEmail;
  private String assumedUserHash;
  private Integer assumedOrderCount;
  private String assumedGender;

  private boolean isAssumed = false;

  public PrincipalImpl(UserApiResponse userResponse) {
    id = userResponse.getId();
    name = userResponse.getName();
    email = userResponse.getEmail();
    userHash = userResponse.getUserHash();
    orderCount = userResponse.getOrderCount();
    gender = userResponse.getGender();
  }

  /**
   * Call this method to assume the identity of the passed assumedUser
   *
   * @param
   */
  public void setAssumedIdentity(UserApiResponse assumedUser) {
    this.assumedId = assumedUser.getId();
    this.assumedName = assumedUser.getName();
    this.assumedEmail = assumedUser.getEmail();
    this.assumedUserHash = assumedUser.getUserHash();
    this.assumedOrderCount = assumedUser.getOrderCount();
    this.assumedGender = assumedUser.getGender();
    this.isAssumed = true;
  }

  public void clearAssumedIdentity() {
    this.assumedId = null;
    this.assumedName = null;
    this.assumedEmail = null;
    this.assumedUserHash = null;
    this.assumedOrderCount = null;
    isAssumed = false;
  }

  public Long getId() {
    return assumedId == null ? id : assumedId;
  }

  public String getName() {
    return assumedName == null ? name : assumedName;
  }

  public String getFirstName() {
    return assumedName == null ? name.split(" ")[0] : assumedName.split(" ")[0];
  }

  /*
  This method is explicitly added for handling the case
  of changing user name. so that the change can be reflected
  whithout any delay.
   */
  public void setName(String name) {
    this.name = name;
  }

  public String getEmail() {
    return assumedEmail == null ? email : assumedEmail;
  }

   public String getUserHash() {
    return assumedUserHash == null ? userHash : assumedUserHash;
  }

  public boolean isAssumed() {
    return isAssumed;
  }

  public Integer getOrderCount() {
    return assumedOrderCount == null ? orderCount : assumedOrderCount;
  }

  public String getGender() {
    return assumedGender == null ? gender : assumedGender;
  }
}
