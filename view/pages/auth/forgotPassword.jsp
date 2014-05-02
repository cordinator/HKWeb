<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 23/07/13
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/templates/general.jsp" type="login" showFooter="no">
  <s:layout-component name="content">
    <s:useActionBean beanclass="com.hk.web.action.beta.auth.ForgotPasswordAction" var="forgotPasswordAction"/>
    <div class="container">
      <div class="span7 offset4">
        <div class="span6 sign-on-cntnr">

            <%--Error/success Msg begins--%>
              <s:layout-render name="/layouts/errorLayout.jsp"  errorMsgClass="sign-on-msg" />
            <%--Error/success Msg ends--%>

          <c:choose>
            <c:when test="${forgotPasswordAction.mailSuccess eq true}">
              <%-- success message begins--%>
              <div class="sucess-cntnr">
                <p class="txt-blue mrgn-b-20">Check your e-mail.</p>

                <p>
                  You will receive an e-mail from us with
                  instructions for resetting your password. If
                  you don't receive this e-mail, please check
                  your junk mail folder.
                </p>
                <div class="span3 alpha">
                <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="btn btn-blue mrgn-t-10">
                     Continue
                </s:link>
                </div>
              </div>
              <%--success message ends--%>
            </c:when>
            <c:otherwise>
              <h4 class="mrgn-b-20">FORGOT PASSWORD</h4>

              <p>
                Enter the e-mail address associated
                with your account, then click continue.
                We'll email you a link to a page where you
                can easily create a new password.
              </p>
              <s:form beanclass="com.hk.web.action.beta.auth.ForgotPasswordAction" class="vertical">
                <fieldset class="mrgn-b-10">
                  <s:label name="Email Id" class="mrgn-t-10" for="email"/>
                  <s:text name="email" id="email" class="auto-adjust check-empty input-block-level"/>
                </fieldset>
                <div class="cont-lft disp-inln">
                  <s:submit name="sendMail" id="sendEmail" class="btn btn-blue" value="Continue"/>
                </div>
                <div class="span3 cont-rht txt-rgt">
                  <span class="icn icn-sqre-blue"></span>
                  <s:link class="txt-blue" beanclass="com.hk.web.action.beta.auth.LoginAction"
                          event="pre"> go back & login</s:link>
                </div>
              </s:form>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </s:layout-component>
  <s:layout-component name="scriptComponent">
    <script type="text/javascript">

      $('[name=sendMail]').click(function (event) {
        var doSubmit = true;
        if (HK.validator.isNull('[name=email]')) {
          HK.validator.showErrMsg('[name=email]', HK.errs.enterEmail);
          doSubmit = false;
        }
        else if (!HK.validator.isEmail('[name=email]')) {
          HK.validator.hideErrMsg('[name=email]');
          HK.validator.showErrMsg('[name=email]', HK.errs.invalidEmail);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg('[name=email]');
        }
        if (doSubmit != true) {
          event.preventDefault();
        }
      });

    </script>
  </s:layout-component>
</s:layout-render>
