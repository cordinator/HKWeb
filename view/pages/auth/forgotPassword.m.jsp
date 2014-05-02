<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 23/07/13
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/includes/taglibInclude.jsp"%>

<s:layout-render name="/templates/general.m.jsp" type="login"
	showFooter="no">
	<s:layout-component name="htmlHead">
		<link rel="stylesheet" type="text/css"
			href="<hk:vhostCss/>/assets/css/login.m.css" media="screen">
	</s:layout-component>
	<s:layout-component name="content">
		<s:useActionBean
			beanclass="com.hk.web.action.beta.auth.ForgotPasswordAction"
			var="forgotPasswordAction" />
		<div class="login-hldr">

			<%--Error/success Msg begins--%>
			<s:layout-render name="/layouts/errorLayout.jsp"
				errorMsgClass="sign-on-msg" />
			<%--Error/success Msg ends--%>

			<c:choose>
				<c:when test="${forgotPasswordAction.mailSuccess eq true}">
					<%-- success message begins--%>
					<div class="sucess-cntnr">
						<p class="blue_text font14">Check your e-mail.</p>

						<p class="font14 mt10">You will receive an e-mail from us with
							instructions for resetting your password. If you don't receive
							this e-mail, please check your junk mail folder.</p>

						<s:link beanclass="com.hk.web.action.beta.auth.LoginAction"
							class="btn blue font14 sign-in mt10">
                     Continue
                </s:link>

					</div>
					<%--success message ends--%>
				</c:when>
				<c:otherwise>
					<div class="font16 semi-bold ">FORGOT PASSWORD</div>

					<p class="font14 mt10">Enter the e-mail address associated with
						your account, then click continue. We'll email you a link to a
						page where you can easily create a new password.</p>
					<s:form
						beanclass="com.hk.web.action.beta.auth.ForgotPasswordAction"
						class="vertical">
						<fieldset class="mt10">
							<s:label name="Login Email ID" class="font14 " for="email" />
							<s:text name="email" id="email" class="mt5" />
						</fieldset>
						<div class="cont-lft disp-inln">
							<s:submit name="sendMail" id="sendEmail"
								class="btn blue sign-in font14" value="Continue" />
						</div>
						<!--                 <div class="span3 cont-rht txt-rgt"> -->
						<!--                   <span class="icn icn-sqre-blue"></span> -->
						<%--                   <s:link class="txt-blue" beanclass="com.hk.web.action.beta.auth.LoginAction" --%>
						<%--                           event="pre"> go back & login</s:link> --%>
						<!--                 </div> -->
					</s:form>
				</c:otherwise>
			</c:choose>
		</div>
	</s:layout-component>
	<s:layout-component name="scriptComponent">
		<script type="text/javascript">

	var sendMail = document.getElementsByName('sendMail')[0];
    
	sendMail.onclick = function (event) {
    if (HK.validator.isNull(document.getElementById('email'))) {
        HK.validator.showErrMsg(document.getElementById('email'), HK.errs.enterEmail);
        doSubmit = false;
      }
    else if (!HK.validator.isEmail(document.getElementById('email'))) {
        HK.validator.hideErrMsg(document.getElementById('email'));
        HK.validator.showErrMsg(document.getElementById('email'), HK.errs.invalidEmail);
        doSubmit = false;
      }
      else {
        HK.validator.hideErrMsg(document.getElementById('emailId'));
      }
   if (doSubmit != true) {
        event.preventDefault();
      }
}
  
      

    </script>
	</s:layout-component>
</s:layout-render>
