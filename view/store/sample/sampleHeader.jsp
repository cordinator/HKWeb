<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
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
  <style type="text/css">
    .wrapper{width: auto;}
    .hdr-drop-label, .cart-pop-label{background-color: #ffdf4f;}
    #msHeaderCont{background-color: #ffdf4f;}
    .yellow-bckgrnd{background-color: #ffdf4f;margin-bottom: 30px;}
    .pipe{
      border-left: 1px solid #000000;
      width: 1px;
      float: left;
      height: 75px;
      margin-top: 15px;
      margin-right: 10px;
    }
    .topBanner{
      margin-bottom: 30px;
    }
    .about-hk{
      padding: 10px;
      line-height: 1.7em;
    }

  </style>
  <div class="container yellow-bckgrnd" >
    <div class="span3 mrgn-b-10 text-left">
      <p class="mrgn-bt-15">Online Store</p>
      <img src="<hk:vhostImage/>/store/sample/images/jnj-logo.png" alt="johnson &amp; johnson"/>
    </div>
    <div class="pipe"></div>
    <div class="span3 mrgn-b-10 text-left">
      <p class="mrgn-bt-15">Powered by</p>
      <a  href="/${pageContext.request.contextPath}">
        <img src="<hk:vhostImage/>/store/sample/images/hk-logo.png" alt="HealthKart"/>
      </a>
    </div>
    <div class="row cont-rht mrgn-t-30 mrgn-b-10 text-left">
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
</s:layout-definition>