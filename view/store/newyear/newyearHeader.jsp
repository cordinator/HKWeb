<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>

<link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/store/newyear/css/ny.css"
      media="screen">

<script src='<hk:vhostJs/>/store/newyear/css/snowfall.jquery.js'></script>

<script>
  snowStorm.snowColor = '#99ccff';   // blue-ish snow!?
  snowStorm.flakesMaxActive = 96;    // show more snow on screen at once
  snowStorm.useTwinkleEffect = true; // let the snow flicker in and out of view
</script>

<%--<script type="text/javascript">--%>
  <%--$(document).snowfall({round : true, minSize: 5, maxSize:8}); // add rounded--%>
<%--</script>--%>
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
    <a href="http://www.healthkart.com"><img src="<hk:vhostImage/>/store/newyear/images/hk-logo.png"></a>
</div>

<ul class="navG">

<li><a href="${pageContext.request.contextPath}/store/newyear/index.jsp">Home</a> </li>

<li>
  <div>Nutrition</div>

  <div class="tabG tab-nutrition">


    <div class="nav-gosf">

      <span><a href="${pageContext.request.contextPath}/store/newyear/sportsNutrition.jsp">Sports Nutrition</a></span>
      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/newyear/protein.jsp">Protein</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/prePost.jsp">Pre, Post &amp; Intra Workout</a></li>

        <li><a href="${pageContext.request.contextPath}/store/newyear/massGainer.jsp">Mass Gainer</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/fatBurner.jsp">Fat Burner</a></li>

      </ul>

    </div>

    <div class="nav-gosf">

      <span><a href="${pageContext.request.contextPath}/store/newyear/healthNutrition.jsp">Health Nutrition</a></span>

      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/newyear/heartBlood.jsp">Heart &amp; Blood Pressure</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/immunity.jsp">IMMUNITY</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/jointSupport.jsp">Joint/Arthritis Support</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/weightManage.jsp">Weight Management</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/wellBeing.jsp">WELL BEING</a></li>
      </ul>

    </div>
    <img class="flot-l mt-10" src="<hk:vhostImage/>/store/newyear/images/nut-menu.jpg">




  </div>
</li>
<!-- Nutrition close--->

<li><div>Sports &amp; Fitness</div>

  <div class="tabG tab-sports">



    <div class="nav-gosf">
      <span><a href="${pageContext.request.contextPath}/store/newyear/fitness.jsp">Fitness</a></span>
      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/newyear/crossTrainers.jsp">Crosstrainers</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/exerciseBike.jsp">Exercise Bike</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/fitnessAcces.jsp">Fitness Accessories</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/fitnessEquip.jsp">Fitness Equipment</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/homeGym.jsp">Home Gyms</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/treadmills.jsp">Treadmills</a></li>
      </ul>
    </div>

    <div class="nav-gosf">
      <span><a href="${pageContext.request.contextPath}/store/newyear/sports.jsp">Sports</a></span>
      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/newyear/boxing.jsp">Boxing</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/football.jsp">Football</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/cricket.jsp">Cricket</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/badminton.jsp">Badminton</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/tennis.jsp">Tennis</a></li>

        <li><a href="${pageContext.request.contextPath}/store/newyear/tableTennis.jsp">Table Tennis</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/otherSports.jsp">Other Sports</a></li>
      </ul>
    </div>
    <img class="flot-l mt-10" src="<hk:vhostImage/>/store/newyear/images/sports-fitness-menu.jpg">


  </div>


</li>
<!-- Sports & fitness close--->


<li><div>Health &amp; Wellness</div>
  <div class="tabG tab-health">


    <div class="nav-gosf">

              <span>
              <a href="${pageContext.request.contextPath}/store/newyear/health.jsp">Health</a></span>


      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/newyear/healthDevices.jsp">Health Devices</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/diabetes.jsp">Diabetes</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/eye.jsp">Eye</a></li>
      </ul>

    </div>

    <div class="nav-gosf">


              <span>
              <a href="${pageContext.request.contextPath}/store/newyear/wellness.jsp">Wellness</a></span>

      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/newyear/beauty.jsp">Beauty</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/personalCare.jsp">Personal Care</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/parenting.jsp">Parenting</a></li>
        <li><a href="${pageContext.request.contextPath}/store/newyear/healthyLiving.jsp">Healthy Living</a></li>
      </ul>
    </div>
    <img class="flot-l mt-10" src="<hk:vhostImage/>/store/newyear/images/healthWellMenu.jpg">





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