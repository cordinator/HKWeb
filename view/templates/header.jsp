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
<div class="container">

  <div class="${pageType !='home' ? 'text-left' : 'text-right'} header-info">

    <c:if test="${pageType !='home'}">
      <a href="/${pageContext.request.contextPath}">
          <%--<img style="position:relative;top:-10px" src="<hk:vhostImage/>/assets/images/HK-Logo.png" alt="HealthKart"/>--%>
        <img class="logo" src="<hk:vhostImage/>/assets/images/HK-Logo.png" alt="HealthKart"/>

      </a>

    </c:if>

    <div class="disp-inln fnt-sz9  ${pageType !='home' ? 'cont-rht' : ''}">
      <a href="http://www.healthkartplus.com" rel="nofollow" class="" target="_blank"><img
          src="<hk:vhostImage/>/assets/images/HKPlus-Logo.png" class="pad-r-10" alt="HK Plus"/></a>
      <a href="${pageContext.request.contextPath}/core/loyaltypg/LoyaltyIntroduction.action" rel="nofollow" class=""
         target="_blank"><img src="<hk:vhostImage/>/assets/images/hk-loyalty-logo.png" class="pad-r-10"
                              alt="HK Loyalty"/></a>
      <a class="pad-r-10 fnt-bolder" href=" ${pageContext.request.contextPath}/core/user/CustomerOrderHistory.action">
        Track Your Order(s)</a>
      <s:link class="pad-r-10" beanclass="com.hk.web.action.beta.hk.FAQAction" target="_blank"><s:param name="reftag"
                                                                                                        value="return"/>14 day return policy</s:link>
      <s:link class="pad-r-10" beanclass="com.hk.web.action.beta.hk.ContactUsAction"
              target="_blank">Contact Us</s:link>
        <%--<a href="http://www.healthkart.com/resources" rel="nofollow" class="" target="_blank"><img src="<hk:vhostImage/>/assets/images/HKResources-Logo.png" class="hk-resource" alt="HK Resources"/></a>--%>

    </div>
      <%--<a href="http://www.healthkart.com/resources" rel="nofollow" class="" target="_blank"><img src="<hk:vhostImage/>/assets/images/HKResources-Logo.png" class="hk-resource" alt="HK Resources"/></a>--%>
  </div>
  <div class="row ">
    <div class="span4 text-left" style="${pageType=='home'? 'height: 50px;' : ' '}">
      <c:choose>
        <c:when test="${pageType=='home'}">
          <a href="/${pageContext.request.contextPath}">
              <%--<img style="position:relative;top:-10px" src="<hk:vhostImage/>/assets/images/HK-Logo.png" alt="HealthKart"/>--%>
            <img class="logo" src="<hk:vhostImage/>/assets/images/logo/logo.png" alt="HealthKart"/>

          </a>

        </c:when>
        <c:otherwise>
          <s:layout-render name="/includes/menuInclude.jsp" showMenu="${showMenu}"/>

        </c:otherwise>
      </c:choose>
    </div>
    <div class="span8">
      <s:layout-render name="/includes/autoCompleteInclude.jsp"/>
    </div>
    <div class="span2 sign-in-box">

      <div class="hdr-drop-cntnr">
        <div class="hdr-drop-label">
          <shiro:hasAnyRoles name="<%=roles%>">
            <%--<div class="pop-label">Account</div>--%>
              <span class="fnt-sz10">Hi <span class="usr-name"><shiro:principal property="firstName"/></span>  <span
                  class="icn icn-dwn-arrow"></span></span>
          </shiro:hasAnyRoles>
          <shiro:hasRole name="<%=RoleConstants.TEMP_USER%>">
            <%--<div class="pop-label">Account</div>--%>
            <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="fnt-sz9 fnt-bold"> Sign up | Sign in
              <s:param name="redirectUrl" value="<%=originalUrlHeader%>"/>
            </s:link> <span class="icn icn-dwn-arrow"></span>
          </shiro:hasRole>
          <shiro:guest>
            <%--<div class="pop-label" >Account</div>--%>
            <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="fnt-sz9 fnt-bold"> Sign up | Sign in
              <s:param name="redirectUrl" value="<%=originalUrlHeader%>"/>
            </s:link> <span class="icn icn-dwn-arrow"></span>
          </shiro:guest>

        </div>

        <ul class="hdr-drop-down gl pad hide fnt-sz10  ">
          <a href="${pageContext.request.contextPath}/core/user/MyAccount.action?pre=&tabId=1">
            <li>
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
            <s:link beanclass="com.hk.web.action.beta.auth.LogoutAction">
              <li class="brdr-t">LOG OUT</li>
              <s:param name="redirectUrl" value="/"/>
            </s:link>
          </shiro:hasAnyRoles>
        </ul>

      </div>


    </div>
    <div class="span2 cart-pop-container ">
      <div class="cart-pop-label">
          <%--<div class="pop-label">Your cart</div>--%>
        Cart <span class="fnt-sz10">(<span data-role="cart-counter"></span>)<%-- items  --%><span
          class="icn icn-dwn-arrow mrgn-lr-5"></span></span>
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
  <c:if test="${pageType=='home'}">
    <div class="row">
      <div class="span4"><s:layout-render name="/includes/menuInclude.jsp" showMenu="${showMenu}"/></div>
    </div>
  </c:if>
  <div id="logo" class="span7 alpha">
  </div>
</div>
<style type="text/css">
  #header {
    margin: 10px 0;
  }

  #header .header-info {
    margin-bottom: 0px;
  }

  .logo {
    position: relative;
    top: -10px
  }

  .hk-search-bar .icn-search {
    background-color: #ffc509;
    color: #000;
    position: relative;
    float: right;
    margin-top: -36px;
  }

  .hk-search-bar .hk-search-box {
    border: 1px solid #a3a3a3;
  }

  .hdr-drop-down {
    margin-left: 0px;
  }

  .span2.sign-in-box {
    margin-top: 5px;
    width: 116px;
    margin-left: 30px;
  }

  .usr-name {
    max-width: 64%;
    line-height: 0.8em;
    display: inline-block;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .cart-pop-container {
    margin-top: 5px;
    margin-left: 0;
    width: 85px;
    font-size: 0.9em;
    font-weight: 600;
  }
</style>

</s:layout-definition>