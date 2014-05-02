<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>

<link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/store/clearance/css/clearance.css"
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

<div class="wrapper nyHeader">


<div class="logo">
    <a href="http://www.healthkart.com"><img src="<hk:vhostImage/>/store/clearance/images/hk-logo.png"></a>
</div>

<ul class="navG">

<li><a href="${pageContext.request.contextPath}/store/clearance/index.jsp">Home</a> </li>

<li>
  <div>Nutrition</div>

  <div class="tabG tab-nutrition">


    <div class="nav-cl">

      <span><a href="${pageContext.request.contextPath}/store/clearance/sportsNutrition.jsp">Sports Nutrition</a></span>
      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/clearance/protein.jsp">Protein</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/prePost.jsp">Pre, Post &amp; Intra Workout</a></li>

        <li><a href="${pageContext.request.contextPath}/store/clearance/massGainer.jsp">Mass Gainer</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/fatBurner.jsp">Fat Burner</a></li>

      </ul>

    </div>

    <div class="nav-cl">

      <span><a href="${pageContext.request.contextPath}/store/clearance/healthNutrition.jsp">Health Nutrition</a></span>

      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/clearance/heartBlood.jsp">Heart &amp; Blood Pressure</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/immunity.jsp">IMMUNITY</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/jointSupport.jsp">Joint/Arthritis Support</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/weightManage.jsp">Weight Management</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/wellBeing.jsp">WELL BEING</a></li>
      </ul>

    </div>
    <img class="flot-l mt-10" src="<hk:vhostImage/>/store/clearance/images/nut-menu.jpg">




  </div>
</li>
<!-- Nutrition close--->

<li><div>Sports &amp; Fitness</div>

  <div class="tabG tab-sports">



    <div class="nav-cl">
      <span><a href="${pageContext.request.contextPath}/store/clearance/fitnessAcces.jsp">Fitness</a></span>
      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/clearance/gymEssentials.jsp">Gym Essentials</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/muscleBuilding.jsp">Muscle Building Equipments</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/weightLossEquipments.jsp">Weight Loss Equipments</a></li>
        <%--<li><a href="${pageContext.request.contextPath}/store/clearance/fitnessEquipments.jsp">Fitness Equipments</a></li>--%>
        <li><a href="${pageContext.request.contextPath}/store/clearance/otherAccessories.jsp">Other Accessories</a></li>
      </ul>
    </div>

    <div class="nav-cl">
      <span><a href="${pageContext.request.contextPath}/store/clearance/sports.jsp">Sports</a></span>
      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/clearance/teamSports.jsp">Team Sports</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/racketSports.jsp">Racket Sports</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/footwear.jsp">Footwear</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/apparel.jsp">Sports Apparel</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/otherSports.jsp">Other Sports</a></li>
      </ul>
    </div>


    <img class="flot-l mt-10" src="<hk:vhostImage/>/store/clearance/images/sports-fitness-menu.jpg">


  </div>


</li>
<!-- Sports & fitness close--->


<li><div>Health &amp; Wellness</div>
  <div class="tabG tab-health">


    <div class="nav-cl">

              <span>
              <a href="${pageContext.request.contextPath}/store/clearance/health.jsp">Health</a></span>


      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/clearance/healthDevices.jsp">Health Devices</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/diabetes.jsp">Diabetes</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/eye.jsp">Eye</a></li>
      </ul>

    </div>

    <div class="nav-cl">


              <span>
              <a href="${pageContext.request.contextPath}/store/clearance/wellness.jsp">Wellness</a></span>

      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/clearance/beauty.jsp">Beauty</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/personalCare.jsp">Personal Care</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/parenting.jsp">Parenting</a></li>
        <li><a href="${pageContext.request.contextPath}/store/clearance/healthyLiving.jsp">Healthy Living</a></li>
      </ul>
    </div>
    <img class="flot-l mt-10" src="<hk:vhostImage/>/store/clearance/images/healthWellMenu.jpg">





  </div>

</li>
<!-- Health & Wellness close--->





</ul>


<!-- account and cart--->

<div class="row cont-rht text-left cart-mt">





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

<div class="cl"></div>

<!--- tab close --->
</div>
<!--- wrapper close --->

<!--- header close --->
<div class="cl"></div>
</s:layout-definition>