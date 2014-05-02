<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 16/07/13
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.hk.constants.account.MyAccountConstants" %>
<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.hk.constants.rest.HKWebMessageConstants" %>
<%@ page import="com.hk.constants.account.EnumMonthConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp" pageTitle="My Account | Healthkart">
<s:useActionBean beanclass="com.hk.web.action.beta.account.MyAccountAction" var="accountAction"/>
<c:set var="tabId" value="${accountAction.tabId}"/>
<c:set var="accountTab" value="<%=MyAccountConstants.ACCOUNT_TAB%>"/>
<c:set var="editEmailTab" value="<%=MyAccountConstants.EDIT_EMAIL_TAB%>"/>
<c:set var="changePasswordTab" value="<%=MyAccountConstants.CHANGE_PASSWORD_TAB%>"/>

<s:layout-component name="content">
<div class="mainContainer">

<div class="container clearfix">

<%--breadcrumbs begins--%>
<div class="hk-breadcrumb-cntnr">
  <span>
    <a href="/" title="Home">
      Home
    </a>
  </span>
  <span>&raquo;</span>
  <c:choose>
    <c:when test="${tabId == accountTab}">
      <span>
          <span class="txt-blue fnt-bold">
          Account
          </span>
        </span>
    </c:when>
    <c:otherwise>
      <span>
            <s:link beanclass="com.hk.web.action.beta.account.MyAccountAction">
              Account
            </s:link>
          </span>
      <span>&raquo;</span>
    </c:otherwise>
  </c:choose>
  <c:if test="${tabId == editEmailTab}">
  <span class="fnt-bold">
      Edit Email
  </span>
  </c:if>
  <c:if test="${tabId == changePasswordTab}">
    <span class="fnt-bold">
      Change Password
    </span>
  </c:if>
</div>

<%--breadcrumbs ends--%>

<%--unverified email Msg begins--%>
<shiro:hasRole name="<%=RoleConstants.HK_UNVERIFIED%>">
  <div class="err-cntnr" id="actLinkDiv">
    <span class="icn-warning-small"></span>

    <div>
      <ul>
        <li>Your email id is not verified, kindly click on the link sent to your mail to apply offer coupons.
          <a class="txt-blue" href="javascript:void(0)" id="actLink"> Click here</a> to resend the email.
        </li>
      </ul>
    </div>
    <span class="icn icn-close2 remove-error"></span>
  </div>
</shiro:hasRole>
<%--unverified email Msg ends--%>

<%--Error/success Msg begins--%>
<s:layout-render name="/layouts/errorLayout.jsp"/>
<%--Error/success Msg ends--%>
<div class="ttl-cntnr">
  <span class="icn icn-sqre "></span>

  <h1 class="hide" data-title-id="${accountTab}">Profile</h1>

  <h1 class="hide" data-title-id="${editEmailTab}">Edit Email</h1>

  <h1 class="hide" data-title-id="${changePasswordTab}">Change Password</h1>
  <span class="icn icn-sqre"></span>
</div>
<div class="row my-acnt-ht">
  <div class="span4">
    <s:layout-render name="/layouts/accountNavigationLayout.jsp" tabId="${tabId}"/>
  </div>
  <c:choose>
    <c:when test="${accountAction.accountLoaded}">
      <div class="span10 offset1 acnt-details hide" data-tab-id="${accountTab}">
        <s:form beanclass="com.hk.web.action.beta.account.MyAccountAction" id="profileForm">
          <div class="new-pfl-cntnr">
            <div class="span8 mrgn-b-10">
              <div class="span2 alpha">
                <s:label for="name">Name</s:label>
              </div>
              <div class="span5">
                <s:text id="name" name="name" value="${accountAction.name}"/>
              </div>
            </div>
            <%--<div class="span5 mrgn-b-10">
              <s:label for="phone"> Phone</s:label>
              <s:text name="phone" id="phone" value="" />
            </div>--%>
            <div class="span8 mrgn-b-10">
              <div class="span2 alpha">
                <s:label for="gender"> Gender</s:label>
              </div>
              <div class="span5">
                <s:select id="gender" name="gender" value="${accountAction.gender}">
                  <s:option value="">-Select One-</s:option>
                  <s:option value="Male">Male</s:option>
                  <s:option value="Female">Female</s:option>
                </s:select>
              </div>
            </div>

            <div class="span8 mrgn-b-10">
              <div class="span2 alpha">
                <span class="label-txt">DOB</span>
              </div>
              <div class="span6 alpha">
                <div class="date-widget-cont">
                  <div class="date-widget">
                    <c:set var="beginDay" value="1"/>
                    <s:label for="dobDay"> Day</s:label>
                    <s:select name="day" id="dobDay">
                      <s:option value="">Day</s:option>
                      <c:forEach begin="1" end="31">
                        <s:option value="${beginDay}">${beginDay}</s:option>
                        <c:set var="beginDay" value="${beginDay+1}"/>
                      </c:forEach>
                    </s:select>
                  </div>
                  <div class="date-widget">
                    <s:label for="dobMonth"> Month</s:label>
                    <s:select name="month" id="dobMonth">
                      <s:option value="">Month</s:option>
                      <c:forEach items="<%=EnumMonthConstants.values()%>" var="monthConstant">
                        <s:option value="${monthConstant.monthIndex}">${monthConstant.monthName}
                        </s:option>
                      </c:forEach>
                    </s:select>
                  </div>
                  <div class="date-widget">
                    <c:set var="beginYear" value="${accountAction.beginYear}"/>
                    <s:label for="dobYear"> Year</s:label>
                    <s:select name="year" id="dobYear">
                      <s:option value="">Year</s:option>
                      <c:forEach begin="${accountAction.beginYear}" end="${accountAction.endYear}">
                        <s:option value="${beginYear}">${beginYear}</s:option>
                        <c:set var="beginYear" value="${beginYear+1}"/>
                      </c:forEach>
                    </s:select>
                  </div>
                </div>
                <%--  <s:text  name="dob" value="${accountAction.userResponse.birthDate}" id="dob" placeholder="" title=""/>--%>
              </div>
            </div>
            <div class="span7 mrgn-b-10">
              <div class="span5">
                <s:submit name="updateBasicInfo" id="updateBasicInfo" value="Save changes" class="btn btn-blue"/>
              </div>
            </div>
          </div>
        </s:form>
      </div>
      <div class="span10 offset1 edit-mail-cont hide" data-tab-id="${editEmailTab}">
        <s:form beanclass="com.hk.web.action.beta.account.MyAccountAction">
          <div class="span7 mrgn-b-10">
            <span class="label-txt">Email</span>
            <span class="email-txt" id="oldEmail">${accountAction.email}</span>
          </div>
          <div class="span7 mrgn-b-10">
            <div class="span2 alpha">
              <s:label for="email">New Email</s:label>
            </div>
            <div class="span5">
              <s:text id="newEmail" name="newEmail" value=""/>

              <p class="email-note"> Your login ID will remain the same and this email id will be used for all the
                communications</p>
            </div>
          </div>

          <div class="span7 mrgn-b-10">
            <div class="span5">

              <s:hidden name="tabId" id="tabId" value="${editEmailTab}"/>
              <s:submit name="updateEmail" id="updateEmail" class="btn btn-blue">Save changes </s:submit>

            </div>
          </div>
        </s:form>

      </div>
      <div class="span10 offset1 pwd-cont hide" data-tab-id="${changePasswordTab}">
        <s:form beanclass="com.hk.web.action.beta.account.MyAccountAction">
          <div class="new-pwd-cntnr">
            <div class="span8 mrgn-b-10">
              <div class="span3">
                <span class="label-txt">Email</span>
              </div>
              <div class="span5 alpha">
                <span class="email-txt"> ${accountAction.email}</span>
              </div>
            </div>
            <div class="span8 mrgn-b-10">
              <div class="span3">
                <s:label for="oPassword"> Old Password</s:label>
              </div>
              <div class="span5 alpha">
                <s:password name="oPassword" id="oPassword" value=""/>
              </div>
            </div>
            <div class="span8 mrgn-b-10">
              <div class="span3">
                <s:label for="nPassword">New Password</s:label>
              </div>
              <div class="span5 alpha">
                <s:password name="nPassword" value="" id="nPassword" placeholder="" title=""/>
              </div>
            </div>
            <div class="span8">
              <div class="span3">
                <s:label for="cPassword">Confirm Password</s:label>
              </div>
              <div class="span5 alpha">
                <input type="password" name="cPassword" id="cPassword" placeholder="" title=""/>
              </div>
            </div>
            <div class="span7 mrgn-b-10">
              <div class="span6">
                <s:hidden name="tabId" id="tabId" value="${changePasswordTab}"/>
                <s:submit name="changePassword" id="changePassword" class="btn btn-blue">Save changes </s:submit>
              </div>
            </div>
          </div>
        </s:form>
      </div>
    </c:when>
    <c:otherwise>
      <%=HKWebMessageConstants.ERROR%>
    </c:otherwise>
  </c:choose>
</div>
</div>
</div>
</s:layout-component>

<s:layout-component name="scriptComponent">
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/email/email.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      $('[data-tab-id=${accountAction.tabId}]').show();
      $('[data-title-id=${accountAction.tabId}]').removeClass('hide');
      var doSubmit = true;
      $('[name=updateBasicInfo]').click(function (event) {
        /*var dobDay = $('#dobDay').val();
         var dobMonth = $('#dobMonth').val();
         var dobYear = $('#dobYear').val();
         var name = $('#name').val();
         var gender = $('#gender').val();

         if (dobDay != "" || dobMonth != "" || dobYear != "") {
         if (dobDay == "" || dobMonth == "" || dobYear == "") {
         HK.alert({content: "Please Enter Date Of Birth in Correct Format", theme: HK.POPUP.THEME.ALERT});
         return false;
         }
         } */
        if (HK.validator.isNull('[name=name]')) {
          HK.validator.showErrMsg('[name=name]', HK.errs.enterName);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg('[name=name]');
          doSubmit = true;
        }
        if (doSubmit != true) {
          event.preventDefault();
        }
      });

      $('[name=updateEmail]').click(function (event) {
        var oldEmail = $('#oldEmail').text();
        var newEmail = $('#newEmail').val();
        // alert(oldEmail  + newEmail );
        if (HK.validator.isNull('[name=newEmail]')) {
          HK.validator.hideErrMsg('[name=newEmail]');
          HK.validator.showErrMsg('[name=newEmail]', HK.errs.enterEmail);
          doSubmit = false;
        }
        else if (!HK.validator.isEmail('[name=newEmail]')) {
          HK.validator.hideErrMsg('[name=newEmail]');
          HK.validator.showErrMsg('[name=newEmail]', HK.errs.invalidEmail);
          doSubmit = false
        }
        else if (newEmail == oldEmail) {
          HK.validator.hideErrMsg('[name=newEmail]');
          HK.validator.showErrMsg('[name=newEmail]', HK.errs.emailNotDifferent);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg('[name=newEmail]');
          doSubmit = true;
        }
        if (doSubmit != true) {
          event.preventDefault();
        }
      });

      $('[name=oPassword]').on('blur keyup', function () {
        if (HK.validator.isNull('[name=oPassword]'))
          HK.validator.showErrMsg(this, HK.errs.enterPassword);
        else
          HK.validator.hideErrMsg(this, HK.errs.enterPassword);
      });

      $('[name=nPassword]').on('blur keyup', function () {
        if (HK.validator.isNull('[name=nPassword]'))
          HK.validator.showErrMsg(this, HK.errs.enterPassword);
        else {
          HK.validator.hideErrMsg(this, HK.errs.enterPassword);
          if (HK.validator.isEqual('[name=nPassword]', '[name=oPassword]'))
            HK.validator.showErrMsg(this, HK.errs.passwordNotDifferent);
          else
            HK.validator.hideErrMsg(this, HK.errs.passwordNotDifferent);
        }
      });

      $('[name=cPassword]').on('blur keyup', function () {
        if (HK.validator.isNull('[name=cPassword]'))
          HK.validator.showErrMsg(this, HK.errs.enterPassword);
        else {
          HK.validator.hideErrMsg(this, HK.errs.enterPassword);
          if (HK.validator.isEqual('[name=cPassword]', '[name=nPassword]'))
            HK.validator.hideErrMsg(this, HK.errs.passwordNotMatch);
          else
            HK.validator.showErrMsg(this, HK.errs.passwordNotMatch);
        }
      });

      $('[name=changePassword]').click(function (event) {
        var oPassword = $('#oPassword').val();
        var nPassword = $('#nPassword').val();
        var cPassword = $('#cPassword').val();
        if (HK.validator.isNull('[name=oPassword]') || HK.validator.isNull('[name=nPassword]') || HK.validator.isNull('[name=cPassword]')) {
          HK.validator.hideErrMsg('[name=oPassword]');
          HK.validator.hideErrMsg('[name=nPassword]');
          HK.validator.hideErrMsg('[name=cPassword]');
          if (HK.validator.isNull('[name=oPassword]')) {
            HK.validator.showErrMsg('[name=oPassword]', HK.errs.enterPassword);
          }
          if (HK.validator.isNull('[name=nPassword]')) {
            HK.validator.showErrMsg('[name=nPassword]', HK.errs.enterPassword);
          }
          if (HK.validator.isNull('[name=cPassword]')) {
            HK.validator.showErrMsg('[name=cPassword]', HK.errs.enterPassword);
          }
          doSubmit = false;
        }
        else if (oPassword == nPassword) {
          HK.validator.hideErrMsg('[name=oPassword]');
          HK.validator.hideErrMsg('[name=nPassword]');
          HK.validator.hideErrMsg('[name=cPassword]');
          HK.validator.showErrMsg('[name=nPassword]', HK.errs.passwordNotDifferent);
          doSubmit = false;
        }
        else if (cPassword != nPassword) {
          HK.validator.hideErrMsg('[name=oPassword]');
          HK.validator.hideErrMsg('[name=cPassword]');
          HK.validator.hideErrMsg('[name=nPassword]');
          HK.validator.showErrMsg('[name=cPassword]', HK.errs.passwordNotMatch);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg('[name=oPassword]');
          HK.validator.hideErrMsg('[name=nPassword]');
          HK.validator.hideErrMsg('[name=cPassword]');
          doSubmit = true;
        }
        if (doSubmit != true) {
          event.preventDefault();
        }
      });

    });
  </script>

</s:layout-component>
</s:layout-render>