package com.hk.web.action.beta.account;

import com.hk.api.response.user.response.UserApiResponse;
import com.hk.api.response.user.response.account.UserAccountUpdateApiResponse;
import com.hk.api.response.user.response.account.UserEmailUpdateApiResponse;
import com.hk.common.constants.user.RoleConstants;
import com.hk.constants.DateConstants;
import com.hk.constants.account.MyAccountConstants;
import com.hk.constants.rest.HKWebMessageConstants;
import com.hk.pact.service.email.EmailService;
import com.hk.pact.service.user.UserAccountService;
import com.hk.pact.service.user.UserActivationService;
import com.hk.pact.service.user.UserService;
import com.hk.web.action.beta.BaseAction;
import com.hk.web.action.beta.auth.LoginAction;
import com.hk.web.request.user.account.UpdateUserBasicInfoRequest;
import com.hk.web.request.user.account.UpdateUserEmailRequest;
import com.hk.web.request.user.account.UpdateUserPasswordRequest;
import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.SimpleMessage;
import net.sourceforge.stripes.validation.SimpleError;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.stripesstuff.plugin.security.Secure;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author Rimal
 */
@Component
@Secure(hasAnyRoles = {RoleConstants.HK_UNVERIFIED, RoleConstants.HK_USER, RoleConstants.HK_DEACTIVATED}, authActionBean = LoginAction.class, disallowRememberMe = true)
public class MyAccountAction extends BaseAction {


  private String name;
  private String gender;
  private int year;
  private int month;
  private int day;
  private String email;
  private String newEmail;
  private String oPassword;
  private String nPassword;
  private int endYear;
  private int beginYear;
  private int tabId = MyAccountConstants.ACCOUNT_TAB;
  private boolean accountLoaded = true;

  @Autowired
  private UserService userService;
  @Autowired
  private UserAccountService userAccountService;
  @Autowired
  private UserActivationService userActivationService;
  @Autowired
  private EmailService emailService;

  @DefaultHandler
  public Resolution pre() {
    UserApiResponse userResponse = getUserAccountService().getUserAccountDetails();
    populateParamsForView(userResponse);
    return new ForwardResolution("/pages/account/myAccount.jsp");
  }

  private void populateParamsForView(UserApiResponse userResponse) {
    if (userResponse != null) {
      this.name = userResponse.getName();
      this.gender = userResponse.getGender();
      this.email = userResponse.getEmail();
      Date birthDate = userResponse.getBirthDate();
      if(birthDate!=null){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(birthDate);
        this.year = calendar.get(Calendar.YEAR);
        this.month = calendar.get(Calendar.MONTH) + 1;
        this.day = calendar.get(Calendar.DATE);
      }
      endYear = Calendar.getInstance().get(Calendar.YEAR);
      beginYear = endYear-70;
    } else {
      accountLoaded = false;
    }
  }

  public Resolution updateBasicInfo() {
    UpdateUserBasicInfoRequest updateUserBasicInfoRequest = new UpdateUserBasicInfoRequest();
    updateUserBasicInfoRequest.setName(name);
    updateUserBasicInfoRequest.setGender(gender);
    Calendar calendar = Calendar.getInstance();
    calendar.set(year,month-1,day);
    SimpleDateFormat dateFormat = new SimpleDateFormat(DateConstants.DEFAULT_DATE_FORMAT);
    updateUserBasicInfoRequest.setBirthDate(dateFormat.format(calendar.getTime()));

    UserAccountUpdateApiResponse userAccountUpdateResponse = getUserAccountService().updateBasicAccountInfoForUser(updateUserBasicInfoRequest);
    if (userAccountUpdateResponse == null) {
      accountLoaded = false;
    } else {
      populateParamsForView(userAccountUpdateResponse.getUserApiResponse());
    }
    if(accountLoaded){
      addRedirectAlertMessage(new SimpleMessage(HKWebMessageConstants.PROFILE_SAVE));
    }
    return new ForwardResolution("/pages/account/myAccount.jsp");
  }

  public Resolution updateEmail() {
    UpdateUserEmailRequest updateUserEmailRequest = new UpdateUserEmailRequest();
    updateUserEmailRequest.setNewEmail(newEmail);
    UserEmailUpdateApiResponse userEmailUpdateApiResponse = getUserAccountService().updateEmailForUser(updateUserEmailRequest);
    UserApiResponse userResponse = null;
    boolean addMessage = true;
    if(userEmailUpdateApiResponse!=null && userEmailUpdateApiResponse.getUserAccountUpdateApiResponse()!=null){
      userResponse = userEmailUpdateApiResponse.getUserAccountUpdateApiResponse().getUserApiResponse();
      if(userResponse.isException()){
        addRedirectAlertMessage(new SimpleError(userResponse.getMessages().get(0)));
        addMessage = false;
      }else{
        // Sending Account Activation Email
        if(userEmailUpdateApiResponse.getUserActivationTokenApiResponse()!=null){
          String token = userEmailUpdateApiResponse.getUserActivationTokenApiResponse().getToken();
          Long userId =  getUserService().getLoggedInUserId();
          String activationLink = getUserActivationService().createActivationLink(token,userId);
          UserApiResponse userApiResponse = getUserService().getUserResponseById(userId);
          getEmailService().sendAccountActivationEmail(userApiResponse,activationLink);
        }
      }
    }
    populateParamsForView(userResponse);
    if(accountLoaded && addMessage){
      addRedirectAlertMessage(new SimpleMessage(HKWebMessageConstants.EMAIL_SAVE));
    }
    return new ForwardResolution("/pages/account/myAccount.jsp");
  }
  public Resolution changePassword() {
    UpdateUserPasswordRequest updateUserPasswordRequest = new UpdateUserPasswordRequest();
    updateUserPasswordRequest.setOldPassword(oPassword);
    updateUserPasswordRequest.setNewPassword(nPassword);

    UserAccountUpdateApiResponse userAccountUpdateResponse = getUserAccountService().updatePasswordForUser(updateUserPasswordRequest);
    UserApiResponse userResponse = null;
    boolean addMessage = true;
    if(userAccountUpdateResponse.getUserApiResponse()!=null){
      userResponse = userAccountUpdateResponse.getUserApiResponse();
      if(userResponse.isException()){
        addRedirectAlertMessage(new SimpleError(userResponse.getMessages().get(0)));
        addMessage = false;
      }
    }
    populateParamsForView(userResponse);
    if(accountLoaded && addMessage){
      addRedirectAlertMessage(new SimpleMessage(HKWebMessageConstants.PASSWORD_SAVE));
    }
    return new ForwardResolution("/pages/account/myAccount.jsp");
  }


  public UserService getUserService() {
    return userService;
  }

  public UserAccountService getUserAccountService() {
    return userAccountService;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public int getYear() {
    return year;
  }

  public void setYear(int year) {
    this.year = year;
  }

  public int getMonth() {
    return month;
  }

  public void setMonth(int month) {
    this.month = month;
  }

  public int getDay() {
    return day;
  }

  public void setDay(int day) {
    this.day = day;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getoPassword() {
    return oPassword;
  }

  public void setoPassword(String oPassword) {
    this.oPassword = oPassword;
  }

  public String getnPassword() {
    return nPassword;
  }

  public void setnPassword(String nPassword) {
    this.nPassword = nPassword;
  }

  public int getEndYear() {
    return endYear;
  }

  public void setEndYear(int endYear) {
    this.endYear = endYear;
  }

  public int getBeginYear() {
    return beginYear;
  }

  public void setBeginYear(int beginYear) {
    this.beginYear = beginYear;
  }

  public int getTabId() {
    return tabId;
  }

  public void setTabId(int tabId) {
    this.tabId = tabId;
  }

  public boolean isAccountLoaded() {
    return accountLoaded;
  }

  public boolean getAccountLoaded(){
    return this.accountLoaded;
  }

  public void setAccountLoaded(boolean accountLoaded) {
    this.accountLoaded = accountLoaded;
  }

  public String getNewEmail() {
    return newEmail;
  }

  public void setNewEmail(String newEmail) {
    this.newEmail = newEmail;
  }

  public UserActivationService getUserActivationService() {
    return userActivationService;
  }

  public EmailService getEmailService() {
    return emailService;
  }
}
