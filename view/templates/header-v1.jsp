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
    if(requestUrI == null){
      requestUrI = request.getRequestURI();
    }
    String queryString = request.getQueryString();
    StringBuilder stringBuilder = new StringBuilder(requestUrI);
    if(queryString!=null){
      stringBuilder.append("?").append(queryString);
    }
    String originalUrlHeader = stringBuilder.toString();

  %>

  <div class="container">

    <!--center style="font-size:36px">HEALTHKART</center><BR-->
    <div class="text-left header-info">

      <span class="txt-light pad-r-10"><s:link beanclass="com.hk.web.action.beta.hk.FAQAction" target="_blank"><s:param name="reftag" value="return"/>14 day return policy</s:link></span>
      <span class="pad-r-10 txt-light"><s:link beanclass="com.hk.web.action.beta.hk.ContactUsAction" target="_blank" >Contact Us</s:link></span>
      <span class="txt-light pad-r-10 fnt-sz9 "><a class="fnt-bolder " href=" ${pageContext.request.contextPath}/core/user/CustomerOrderHistory.action"> Track Your Order(s) </a></span>

      <a href="http://www.healthkart.com/resources" rel="nofollow" class="cont-rht" target="_blank"><img src="<hk:vhostImage/>/assets/images/HKResources-Logo.png" class="hk-resource" alt="HK Resources"/></a>
      <a href="${pageContext.request.contextPath}/core/loyaltypg/LoyaltyIntroduction.action" rel="nofollow" class="cont-rht" target="_blank"><img src="<hk:vhostImage/>/assets/images/hk-loyalty-logo.png" class="pad-r-10" alt="HK Loyalty"/></a>
      <a href="http://www.healthkartplus.com" rel="nofollow" class="cont-rht" target="_blank"><img src="<hk:vhostImage/>/assets/images/HKPlus-Logo.png" class="pad-r-10" alt="HK Plus"/></a>
    </div>
    <div class="mrgn-b-10 text-center">
      <a href="/${pageContext.request.contextPath}">
        <img style="position:relative;top:-10px" src="<hk:vhostImage/>/assets/images/HK-Logo.png" alt="HealthKart"/>
      </a>
    </div>
    <div class="row">
      <div class="span4"><s:layout-render name="/includes/menuInclude.jsp" showMenu="${showMenu}"/></div>

      <div class="span8">
        <s:layout-render name="/includes/autoCompleteInclude.jsp"/>
      </div>
      <div class="span2">

        <div class="hdr-drop-cntnr">
          <div class="hdr-drop-label">
            <shiro:hasAnyRoles name="<%=roles%>">
              <div class="pop-label">Account</div>
              <span class="fnt-sz10">Hi <span style="max-width: 64%;line-height:1em;display: inline-block;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"><shiro:principal property="firstName"/></span>  <span class="icn icn-dwn-arrow"></span></span>
            </shiro:hasAnyRoles>
            <shiro:hasRole name="<%=RoleConstants.TEMP_USER%>">
              <div class="pop-label">Account</div>
              <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="fnt-sz10" > Sign in
                <s:param name="redirectUrl" value="<%=originalUrlHeader%>"  />
              </s:link> <span class="icn icn-dwn-arrow"></span>
            </shiro:hasRole>
            <shiro:guest>
              <div class="pop-label" >Account</div>
              <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="fnt-sz10"> Sign in
                <s:param name="redirectUrl" value="<%=originalUrlHeader%>"  />
              </s:link> <span class="icn icn-dwn-arrow"></span>
            </shiro:guest>

          </div>
          <ul class="hdr-drop-down gl pad hide ">
            <a href="${pageContext.request.contextPath}/core/user/MyAccount.action?pre=&tabId=1"><li>
              Profile
            </li>
            </a>
            <a href="/core/user/CustomerOrderHistory.action">
              <li>
                Orders
              </li>
            </a>
            <a href="/core/discount/RewardPointTxnStatement.action">
              <li>
                Reward points
              </li>
            </a>


            <!--li>Orders</li>
            <li>Rewards</li-->
            <shiro:hasAnyRoles name="<%=roles%>">
              <s:link beanclass="com.hk.web.action.beta.auth.LogoutAction"><li class="brdr-t">LOG OUT</li>
                <s:param name="redirectUrl" value="/" />
              </s:link>
            </shiro:hasAnyRoles>
          </ul>

        </div>


      </div>
      <div class="span2 cart-pop-container">
        <div class="cart-pop-label">
          <div class="pop-label">Your cart</div>
          <span class="fnt-sz10"><span data-role="cart-counter"></span> items  <span class="icn icn-dwn-arrow"></span></span>
        </div>
        <div id='cartPop' class='popUp hide'>
          <!--div class=icnSctn>
              <div class=icn2></div>
              <div class=icn></div>
          </div-->
          <div class=bdySctn>
            <div class=body>
              <!--div class=title style="text-align:right">
                            <a href="javascript:void(0)" style="padding-right:8px" onclick="$('#cartPop').fadeOut('slow')">Hide</a>
                          </div-->
              <div class=msg>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div id="logo" class="span7 alpha">
    </div>
  </div>

  <style type="text/css">
    .hk-search-bar {
      position: absolute;
    }
    .hk-search-bar .icn-search{
      position: relative;
      float: right;
      margin-top: -36px;
    }
  </style>
</s:layout-definition>