package com.hk.api.response.user.response;

import com.hk.common.constants.DtoJsonConstants;
import com.hk.api.response.AbstractApiBaseResponse;
import org.codehaus.jackson.annotate.JsonProperty;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by IntelliJ IDEA.
 * User: Vaibhav
 * Date: Apr 25, 2013
 * Time: 7:43:37 PM
 */
public class UserApiResponse extends AbstractApiBaseResponse {

  @JsonProperty(DtoJsonConstants.ID)
  private Long id;
  @JsonProperty(DtoJsonConstants.LOGIN)
  private String login;
  @JsonProperty(DtoJsonConstants.EMAIL)
  private String email;
  @JsonProperty(DtoJsonConstants.NAME)
  private String name;
  @JsonProperty(DtoJsonConstants.PASSWORD)
  private String passwordChecksum;

  @JsonProperty(DtoJsonConstants.ROLES)
  private Set<String> roles = new HashSet<String>();
  @JsonProperty(DtoJsonConstants.PERMISSIONS)
  private Set<String> permissions = new HashSet<String>();
  @JsonProperty(DtoJsonConstants.BIRH_DATE)
  private Date birthDate;
  @JsonProperty(DtoJsonConstants.GENDER)
  private String gender ;
  @JsonProperty(DtoJsonConstants.USER_HASH)
  private String userHash;
  @JsonProperty(DtoJsonConstants.ORDER_COUNT)
  private Integer orderCount;


  public String getLogin() {
    return login;
  }

  public void setLogin(String login) {
    this.login = login;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getPasswordChecksum() {
    return passwordChecksum;
  }

  public void setPasswordChecksum(String passwordChecksum) {
    this.passwordChecksum = passwordChecksum;
  }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Set<String> getRoles() {
    return roles;
  }

  public void setRoles(Set<String> roles) {
    this.roles = roles;
  }

  public Set<String> getPermissions() {
    return permissions;
  }

  public void setPermissions(Set<String> permissions) {
    this.permissions = permissions;
  }

  public Date getBirthDate() {
    return birthDate;
  }

  public void setBirthDate(Date birthDate) {
    this.birthDate = birthDate;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public String getUserHash() {
    return userHash;
  }

  public void setUserHash(String userHash) {
    this.userHash = userHash;
  }

  public Integer getOrderCount() {
    return orderCount;
  }

  public void setOrderCount(Integer orderCount) {
    this.orderCount = orderCount;
  }
}
