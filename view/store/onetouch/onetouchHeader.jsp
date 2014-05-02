<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>

    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/ms/1t/ot-default.css"
          media="screen">

  <%
    PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
    if (principal != null) {
      pageContext.setAttribute("userId", principal.getId());
    } else {
      pageContext.setAttribute("userId", null);
    }

    String roles = RoleConstants.HK_USER + "," + RoleConstants.HK_UNVERIFIED;

    String requestUrI = (String) request.getAttribute("javax.servlet.forward.request_uri");
    if (requestUrI == null) {
      requestUrI = request.getRequestURI();
    }
    String queryString = request.getQueryString();
    StringBuilder stringBuilder = new StringBuilder(requestUrI);
    if (queryString != null) {
      stringBuilder.append("?").append(queryString);
    }
    String originalUrlHeader = stringBuilder.toString();

  %>
  <div id="header">
    <a href="${pageContext.request.contextPath}/store/onetouch"><img class="flot-l" src="<hk:vhostImage/>/assets/images/ms/1t/onetouch-logo.png">   </a>
    <img class="hk-logo" src="<hk:vhostImage/>/assets/images/ms/1t/healthkart-logo.png">

    <div class="row cont-rht mrgn-b-10 text-left">
      <div class="span2 mrgn-bt-15">
        <div class="hdr-drop-cntnr">
          <div class="hdr-drop-label">
            <shiro:hasAnyRoles name="<%=roles%>">
              <div class="pop-label">Account</div>
              <span class="fnt-sz10">Hi <span
                  style="max-width: 64%;line-height:1em;display: inline-block;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"><shiro:principal
                  property="firstName"/></span>  <span class="icn icn-dwn-arrow"></span></span>
            </shiro:hasAnyRoles>
            <shiro:hasRole name="<%=RoleConstants.TEMP_USER%>">
              <div class="pop-label">Account</div>
              <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="fnt-sz10"> Sign in
                <s:param name="redirectUrl" value="<%=originalUrlHeader%>"/>
              </s:link> <span class="icn icn-dwn-arrow"></span>
            </shiro:hasRole>
            <shiro:guest>
              <div class="pop-label">Account</div>
              <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="fnt-sz10"> Sign in
                <s:param name="redirectUrl" value="<%=originalUrlHeader%>"/>
              </s:link> <span class="icn icn-dwn-arrow"></span>
            </shiro:guest>
          </div>
          <ul class="hdr-drop-down gl pad hide ">
            <a href="/core/user/MyAccount.action?pre=&tabId=1">
              <li>
                Profile
              </li>
            </a>
            <a href="/core/user/UserManageAddress.action?manageAddresses=">
              <li>
                Addresses
              </li>
            </a>
            <shiro:hasAnyRoles name="<%=roles%>">
              <s:link beanclass="com.hk.web.action.beta.auth.LogoutAction">
                <li class="brdr-t">LOG OUT</li>
                <s:param name="redirectUrl" value="/"/>
              </s:link>
            </shiro:hasAnyRoles>
          </ul>

        </div>


      </div>
      <div class="span2 mrgn-bt-15 cart-pop-container">
        <div class="cart-pop-label">
          <div class="pop-label">Your cart</div>
          <span class="fnt-sz10"><span data-role="cart-counter"></span> items  <span
              class="icn icn-dwn-arrow"></span></span>
        </div>
        <div id='cartPop' class='popUp hide'>
          <div class=bdySctn>
            <div class=body>
              <div class=msg>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


  </div>
  <div class="cl"></div>
</s:layout-definition>