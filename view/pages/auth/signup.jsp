<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/templates/general.jsp" type="login" showFooter="no">

  <s:layout-component name="content">
    <s:useActionBean beanclass="com.hk.web.action.beta.auth.LoginAction" var="loginAction"/>
    <div class="container">
      <div class="span7 offset4">

        <div class="span6 sign-on-cntnr">
            <%--Error/success Msg begins--%>
          <s:layout-render name="/layouts/errorLayout.jsp" errorMsgClass="sign-on-msg"/>
            <%--Error/success Msg ends--%>
          <h4 class="mrgn-b-20">REGISTRATION</h4>
          <s:form beanclass="com.hk.web.action.beta.auth.SignUpAction" class="vertical">
            <fieldset class="mrgn-b-20">
              <s:label name="Your name"/>
              <s:text name="name" class="auto-adjust check-empty input-block-level"/>
              <s:label name="Email Id"/>
              <s:text name="email" class="auto-adjust check-empty input-block-level"/>

              <br>
              <s:label name="Password"/>
              <s:password name="password" class="auto-adjust check-empty input-block-level"/>
              <s:label name="Confirm Password"/>
              <s:password name="confirmPassword" class="auto-adjust check-empty input-block-level"/>
            </fieldset>

            <div class="cont-lft disp-inln">
              <s:submit name="signup" class="btn btn-blue fnt-caps" value="Create Account"/>
            </div>
            <div class="span3 cont-rht txt-rgt alpha">
              <span class="icn icn-sqre-blue"></span>
              <s:link class="txt-blue" beanclass="com.hk.web.action.beta.auth.LoginAction" event="pre">
                go back & login</s:link>

            </div>
          </s:form>
        </div>


      </div>
    </div>
  </s:layout-component>
  <s:layout-component name="scriptComponent">
    <script type="text/javascript">
      $('[name=signup]').click(function (event) {
        var doSubmit = true;
        if (HK.validator.isNull('[name=name]')) {
          HK.validator.showErrMsg('[name=name]', HK.errs.enterName);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg('[name=name]');
        }
        if (HK.validator.isNull('[name=email]')) {
          HK.validator.hideErrMsg('[name=email]');
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
        if (HK.validator.isNull('[name=password]')) {
          HK.validator.hideErrMsg('[name=password]');
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