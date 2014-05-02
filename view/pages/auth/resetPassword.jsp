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
    <div class="container wrap">
      <div class="span7 offset4">
        <div class="span6 sign-on-cntnr">
            <%--Error/success Msg begins--%>
              <s:layout-render name="/layouts/errorLayout.jsp"  errorMsgClass="sign-on-msg" />
            <%--Error/success Msg ends--%>
          <h4 class="mrgn-b-20 fnt-caps">Create a New Password</h4>
          <s:form beanclass="com.hk.web.action.beta.auth.ForgotPasswordAction" class="vertical">
            <fieldset class="mrgn-b-10">
              <s:label name="password" class="mrgn-t-10" for="password"/>
              <s:password name="password" id="password" class="auto-adjust check-empty input-block-level"/>
              <s:label name="Confirm password" class="mrgn-t-10" for="confirmPassword"/>
              <input type="password" id="confirmPassword" name="confirmPassword" class="auto-adjust check-empty input-block-level"/>
            </fieldset>

            <div class="">
              <s:hidden name="token" value="${forgotPasswordAction.token}"/>
              <s:submit name="resetPassword" class="btn btn-blue" value="Save Changes"/>
            </div>
          </s:form>
        </div>
      </div>
    </div>
  </s:layout-component>

  <s:layout-component name="scriptComponent">
    <script type="text/javascript">
      $('[name=resetPassword]').click(function (event) {
        var doSubmit = true;
        if (HK.validator.isNull('[name=password]')) {
          HK.validator.showErrMsg('[name=password]', HK.errs.enterPassword);
          doSubmit = false;
        }
        else if (!HK.validator.isEqual('[name=password]', '[name=confirmPassword]')) {
          HK.validator.hideErrMsg('[name=password]');
          HK.validator.showErrMsg('[name=confirmPassword]', HK.errs.passwordNotMatch);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg('[name=password]');
        }
        if (doSubmit != true) {
          event.preventDefault();
        }
      });

    </script>
  </s:layout-component>


</s:layout-render>
