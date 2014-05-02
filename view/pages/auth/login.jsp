<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/templates/general.jsp" type="login" showFooter="no">

  <s:layout-component name="content">
    <s:useActionBean beanclass="com.hk.web.action.beta.auth.LoginAction" var="loginAction"/>
    <div class="container ">
    <div class="span7 offset4">

      <div class="span6 sign-on-cntnr">
          <%--Error/success Msg begins--%>
            <s:layout-render name="/layouts/errorLayout.jsp"  errorMsgClass="sign-on-msg" />
          <%--Error/success Msg ends--%>
        <h4 class="mrgn-b-20">SIGN IN</h4>
        <s:form beanclass="com.hk.web.action.beta.auth.SignUpAction" name="signup">
          <input type="hidden" name="redirectUrl" value="${loginAction.redirectUrl}"/>
          <input type="hidden" id="signupEmail" name="email" value=""/>

        </s:form>
        <s:form beanclass="com.hk.web.action.beta.auth.LoginAction" class="vertical" name="signin">
          <input type="hidden" name="redirectUrl" value="${loginAction.redirectUrl}"/>
          <fieldset class="mrgn-b-20">
            <s:label name="Email address" for="emailId"/>
            <s:text name="email" id="emailId" class="auto-adjust check-empty input-block-level"/>

            <label class="radio mrgn-b-5">
              <input type="radio" name="type" class="auto-adjust check-empty" value="new"/> I am a new user
            </label>

            <label class="radio">
              <input type="radio" name="type" class="auto-adjust check-empty" value="old" checked="checked"/> I am an
              existing user, I have password
            </label>
            <br>
            <s:label for="password"/>
            <s:password name="password" id="password" class="auto-adjust check-empty input-block-level"/>
          </fieldset>

          <div class="cont-lft disp-inln">
            <s:submit name="login" class="btn btn-blue fnt-caps" value="Sign in"/>
            <s:submit name="createNew" class="btn btn-blue fnt-caps hide" value="Create an account"/>

          </div>

          <div class="span3 cont-rht txt-rgt" name="forgot-link-cntnr">
            <span class="icn icn-sqre-blue"></span>
            <s:link class="txt-blue" beanclass="com.hk.web.action.beta.auth.ForgotPasswordAction"
                    event="pre"> forgot password</s:link>
          </div>
        </s:form>
      </div>


    </div>
  </s:layout-component>
  <s:layout-component name="scriptComponent">
    <script type="text/javascript">
      $('[name=login]').click(function (event) {
        var doSubmit = true;
        if (HK.validator.isNull('[name=signin] [name=email]')) {
          HK.validator.showErrMsg('[name=signin] [name=email]', HK.errs.enterEmail);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg('[name=signin] [name=email]');
        }

        if (HK.validator.isNull('[name=password]')) {
          HK.validator.showErrMsg('[name=password]', HK.errs.enterPassword);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg('[name=password]');
        }
        /*console.log(doSubmit);*/
        if (doSubmit != true) {
          event.preventDefault();
        }
      });
      $('[name=createNew]').click(function (event) {
        var doSubmit = true;
        var trgtForm = $('form[name=signup]');
        var emailid = $('#emailId');
        event.preventDefault();
        if (HK.validator.isNull(emailid)) {
          HK.validator.showErrMsg(emailid, HK.errs.enterEmail);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg(emailid);
        }
        if (doSubmit != true) {
          return false
        }
        $('#signupEmail').val(emailid.val());
        trgtForm.submit();
      });

      $('[name=type]').change(function () {
        $('#err-cntnr').html('');
        if ($(this).val() == 'new') {
          newView();
        } else {
          oldView();
        }
      })
      function newView() {
          HK.validator.hideErrMsg('[name=password]');
          HK.element.disable($('[name=password]'));
        $('[name=createNew]').show();
        $('[name=login]').hide();
        $('[name=forgot-link-cntnr]').hide();


      }
      function oldView() {
        HK.element.enable($('[name=password]'));
        $('[name=createNew]').hide();
        $('[name=login]').show();
        $('[name=forgot-link-cntnr]').show();
      }
    </script>
  </s:layout-component>
</s:layout-render>