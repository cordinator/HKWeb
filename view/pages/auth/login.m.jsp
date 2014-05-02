<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/templates/general.m.jsp" type="login" showFooter="no">
<s:layout-component name="htmlHead">
        <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/login.m.css"
        media="screen">
</s:layout-component>

  <s:layout-component name="content">
    <s:useActionBean beanclass="com.hk.web.action.beta.auth.LoginAction" var="loginAction"/>
    
    <div class="login-hldr">

      
          <%--Error/success Msg begins--%>
            <s:layout-render name="/layouts/errorLayout.jsp"  errorMsgClass="sign-on-msg" />
          <%--Error/success Msg ends--%>
<!--         <h4 class="mrgn-b-20">SIGN IN</h4> -->
        <div class="tcenter title font16">
    		  <div class="circle"></div>
    		  <span class="inline semi_bold">SIGN IN</span>
    		  <div class="circle"></div>
    	</div>
        <s:form beanclass="com.hk.web.action.beta.auth.SignUpAction" name="signup">
          <input type="hidden" name="redirectUrl" value="${loginAction.redirectUrl}"/>
          <input type="hidden" id="signupEmail" name="email" value=""/>

        </s:form>
        <s:form beanclass="com.hk.web.action.beta.auth.LoginAction" class="vertical" name="signin">
          <input type="hidden" name="redirectUrl" value="${loginAction.redirectUrl}"/>
          <fieldset >
            <s:label name="Email address" for="emailId" class="font14 semi_bold"/>
            <s:text name="email" id="emailId" class="auto-adjust check-empty input-block-level"/>

            <div class="radio mt15">
              <input type="radio" name="type" class="auto-adjust check-empty" value="new" id="new-user"/><label for="new-user" class="font14"> I am a new user</label>
            </div>

            <div class="radio mt5">
              <input type="radio" name="type" class="auto-adjust check-empty" value="old" checked="checked" id="old-user"/><label for="old-user" class="font14"> I am an
              existing user, I have password</label>
            </div>
            <s:label for="password" class="font14 semi_bold mt5"/>
            <s:password name="password" id="password" class="auto-adjust check-empty input-block-level"/>
          </fieldset>

          
            <s:submit name="login" class="btn blue font14 sign-in left" value="Sign in"/>
            <s:submit name="createNew" class="btn blue hide sign-in left font14" value="Sign Up"/>

          <div class="right forgot-pass" name="forgot-link-cntnr">
            <span class="blue-box left"></span>
            <s:link class="blue_text font14" beanclass="com.hk.web.action.beta.auth.ForgotPasswordAction"
                    event="pre"> forgot password?</s:link>
          </div>
        </s:form>
      

</div>
 
  </s:layout-component>
  <s:layout-component name="scriptComponent">
    <script type="text/javascript">
    document.getElementsByName('createNew')[0].style.display = "none";
    var login = document.getElementsByName('login')[0];
    
    login.onclick = function (event) {
        var doSubmit = true;
        if (HK.validator.isNull(document.getElementById('emailId'))) {
          HK.validator.showErrMsg(document.getElementById('emailId'), HK.errs.enterEmail);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg(document.getElementById('emailId'));
        }

        if (HK.validator.isNull(document.getElementById('password'))) {
          HK.validator.showErrMsg(document.getElementById('password'), HK.errs.enterPassword);
          doSubmit = false;
        }
        else {
          HK.validator.hideErrMsg(document.getElementById('password'));
        }
        if (doSubmit != true) {
          event.preventDefault();
        }
       }

      var createNew = document.getElementsByName('createNew')[0];  
      createNew.onclick = function (event) {
        var doSubmit = true;
        var emailid =document.getElementById('emailId');
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
        document.getElementById('signupEmail').value = emailid.value;
        document.forms['signup'].submit();
      }

      window.onload=function() {
    	  var radios = document.signin.elements["type"];
    	 radios[0].onclick = function(){
    			 if(radios[0].value == 'new')
           	 	{
       		 	 	newView();
           	 	 }
    	 };
		radios[1].onclick = function(){
    			 if(radios[1].value == 'old')
           	 	{
    				 oldView();
           	 	 }
		};
    	}

      
      function newView() {
          HK.validator.hideErrMsg(document.getElementById('password'));
          document.getElementById('password').disabled='disabled';
          document.getElementsByName('createNew')[0].style.display = "block";
          document.getElementsByName('login')[0].style.display = "none";
          document.getElementsByName('forgot-link-cntnr')[0].style.display = "none";
      }
      function oldView() {
    	  document.getElementById('password').disabled='';
    	  document.getElementsByName('createNew')[0].style.display = "none";
          document.getElementsByName('login')[0].style.display = "block";
          document.getElementsByName('forgot-link-cntnr')[0].style.display = "block";
      }
    </script>
  </s:layout-component>
</s:layout-render>