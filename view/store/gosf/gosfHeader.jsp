<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>

<link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/gosf/gosf.css?v=1.1"
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
<div class="wrapper">


<div class="logo">
  <a href="${pageContext.request.contextPath}/store/gosf/index.jsp"> <img class="gosf-logo" src="<hk:vhostImage/>/assets/images/gosf/gosf-logo.png">     </a>
  <a href="http://www.healthkart.com"><img src="<hk:vhostImage/>/assets/images/gosf/hk-logo.png"></a>
</div>

<ul class="navG">
<li>
  <div>Nutrition</div>

  <div class="tabG tab-nutrition">
    <span class="staff-pic">Staff Picks</span>
    <ul class="staff">
      <li><a href="${pageContext.request.contextPath}/store/gosf/spTarun.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/tarun_s.png"><br>Tarun Singhal  <br>
        <span>For Health Enthusiasts</span> </a>
      </li>

      <li><a href="${pageContext.request.contextPath}/store/gosf/spAnshul.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/anshulS.png"><br>Anshul Sharma<br>
        <span>For Health Enthusiasts</span>   </a>
      </li>

      <li><a href="${pageContext.request.contextPath}/store/gosf/spPreeti.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/preetiS.png"><br>Preeti Roopanwal<br>
        <span>For Health Enthusiasts</span>    </a>
      </li>

      <li><a href="${pageContext.request.contextPath}/store/gosf/spRabindra.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/rabindraS.png"><br>Rabindra Singh<br>
        <span>For Health Enthusiasts</span></a>
      </li>

      <li><a href="${pageContext.request.contextPath}/store/gosf/spRohit.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/rohitS.png"><br>Rohit Tekriwal<br>
        <span>For Health Enthusiasts</span>  </a>
      </li>
    </ul>
    <div class="cl"></div>

    <div class="nav-gosf">

      <span><a href="${pageContext.request.contextPath}/store/gosf/sportsNutrition.jsp">Sports Nutrition</a></span>
      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/gosf/protein.jsp">Protein</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/prePost.jsp">Pre, Post &amp; Intra Workout</a></li>

        <li><a href="${pageContext.request.contextPath}/store/gosf/weightManage.jsp">Weight Management</a></li>
      </ul>

    </div>

    <div class="nav-gosf">

      <span><a href="${pageContext.request.contextPath}/store/gosf/healthNutrition.jsp">Health Nutrition</a></span>

      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/gosf/boneMuscle.jsp">Bone &amp; Muscle Support</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/heartBlood.jsp">Heart &amp; Blood Pressure</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/immunity.jsp">IMMUNITY</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/weightLoss.jsp">WEIGHT LOSS</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/wellBeing.jsp">WELL BEING</a></li>
      </ul>

    </div>
    <img class="flot-l mt-10" src="<hk:vhostImage/>/assets/images/gosf/nut-menu.jpg">




  </div>
</li>
<!-- Nutrition close--->

<li><div>Sports &amp; Fitness</div>

  <div class="tabG tab-sports">
    <span class="staff-pic">Staff Picks</span>
    <ul class="staff">
      <li><a href="${pageContext.request.contextPath}/store/gosf/spSunny.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/sunny_s.png"><br>Sunny Gupta<br>
        <span>For Sports Enthusiast</span> </a>
      </li>

      <li><a href="${pageContext.request.contextPath}/store/gosf/spParas.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/parasS.png"><br>Paras Beri<br>
        <span>For Sports Enthusiast</span>   </a>
      </li>

      <li><a href="${pageContext.request.contextPath}/store/gosf/spKaustuv.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/kaustavS.png"><br>Kaustuv Paliwal<br>
        <span>For Sports Enthusiast</span>  </a>
      </li>

      <li><a href="${pageContext.request.contextPath}/store/gosf/spEklavya.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/eklavyaS.png"><br>Eklavya Kohli<br>
        <span>For Sports Enthusiast</span>  </a>
      </li>

      <li><a href="${pageContext.request.contextPath}/store/gosf/spPankaj.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/pankajS.png"><br>Pankaj Singh<br>
        <span>For Sports Enthusiast</span> </a>
      </li>
    </ul>
    <div class="cl"></div>

    <div class="nav-gosf">

      <span><a href="${pageContext.request.contextPath}/store/gosf/gymGoer.jsp">Gym Goer</a></span>
      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/gosf/professionalBodyBuilders.jsp">Professinal Body Builders</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/fitnessEnthusiasts.jsp">Fitness Enthusiast</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/officeGoers.jsp">Office Goers</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/houseWives.jsp">Womens Accessories</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/limitless.jsp">Limitless apparel</a></li>

      </ul>
    </div>

    <div class="nav-gosf">
      <span><a href="${pageContext.request.contextPath}/store/gosf/nonGymGoer.jsp">Non-Gym Goer</a></span>
      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/gosf/excuseNoTime.jsp">Excuse / No time etc.</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/gymPhobic.jsp">Gym Phobic</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/officeMachines.jsp">Office - High End Machines</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/seniorCitizen.jsp">Senior Citizens / Patients</a></li>
      </ul>
    </div>

    <div class="nav-gosf">
      <span><a href="${pageContext.request.contextPath}/store/gosf/sports.jsp">Sports</a></span>
      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/gosf/boxing.jsp">Boxing</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/football.jsp">Football</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/cricket.jsp">Cricket</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/badminton.jsp">Badminton</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/tennis.jsp">Tennis</a></li>

        <li><a href="${pageContext.request.contextPath}/store/gosf/tableTennis.jsp">Table Tennis</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/otherSports.jsp">Other Sports</a></li>
      </ul>
    </div>



    <div class="nav-gosf">
      <span><a href="${pageContext.request.contextPath}/store/gosf/forAll.jsp">For All</a></span>
      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/gosf/belts.jsp">Gym Belts</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/rehabSupports.jsp">Rehab Support</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/bags.jsp">Bags</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/sippersShakers.jsp">Sippers &amp; Shakers</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/bodyBalanceBands.jsp">Body Balance Bands</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/limitless.jsp">Limitless Apparel</a></li>

      </ul>
    </div>


    <a href="${pageContext.request.contextPath}/store/gosf/limitless.jsp"><img class="flot-l mt-10" src="<hk:vhostImage/>/assets/images/gosf/limitLessBanner.jpg"></a>




  </div>

</li>
<!-- Sports & fitness close--->


<li><div>Health &amp; Wellness</div>
  <div class="tabG tab-health">
    <span class="staff-pic">Staff Picks</span>
    <ul class="staff">
      <li><a href="${pageContext.request.contextPath}/store/gosf/spRavi.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/ravi_s.png"><br>Ravi Sharma<br>
        <span>For Your Wellness</span>   </a>
      </li>

      <li><a href="${pageContext.request.contextPath}/store/gosf/spJaideep.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/jaideepS.png"><br>Jaideep Singh<br>
        <span>For Your Wellness</span>      </a>
      </li>

      <li><a href="${pageContext.request.contextPath}/store/gosf/spShefali.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/shefaliS.png"><br>Shefali Sankhyan<br>
        <span>For Your Wellness</span>  </a>
      </li>

      <li><a href="${pageContext.request.contextPath}/store/gosf/spBobby.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/bobbyS.png"><br>Bobby Medhi<br>
        <span>For Your Wellness</span>     </a>
      </li>

      <li><a href="${pageContext.request.contextPath}/store/gosf/spPallavi.jsp"><img src="<hk:vhostImage/>/assets/images/gosf/pallaviS.png"><br>Pallavi Bhatia<br>
        <span>For Your Wellness</span>      </a>
      </li>
    </ul>
    <div class="cl"></div>

    <div class="nav-gosf">

              <span>
              <a href="${pageContext.request.contextPath}/store/gosf/personalCare.jsp"> Personal Care</a></span>


      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/gosf/elderlyCare.jsp">Elderly Care</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/womenCare.jsp">Women Care</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/sexualWellness.jsp">Sexual Wellness</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/wellness.jsp">Wellness</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/personalCareCombo.jsp">Personal Care Combo</a></li>
      </ul>

    </div>

    <div class="nav-gosf">


              <span>
              <a href="${pageContext.request.contextPath}/store/gosf/beauty.jsp"> Beauty</a></span>

      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/gosf/bathBody.jsp">Bath &amp; Body</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/faceHair.jsp">Face &amp; Hair Care</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/makeup.jsp">Make-up</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/maleGrooming.jsp">Men&#39;s Grooming</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/beautyCombo.jsp">Beauty Combo</a></li>
      </ul>
    </div>

    <div class="nav-gosf">


              <span>
              <a href="${pageContext.request.contextPath}/store/gosf/eye.jsp"> Eye</a></span>


      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/gosf/sunGlasses.jsp">Sun Glasses</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/eyeCare.jsp">Eye Care</a></li>
      </ul>

    </div>

    <div class="nav-gosf">



              <span>
              <a href="${pageContext.request.contextPath}/store/gosf/parenting.jsp"> Parenting</a></span>

      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/gosf/momsMaternity.jsp">Moms &amp; Maternity</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/babyCare.jsp">Kids Corner</a></li>
          <li><a href="${pageContext.request.contextPath}/store/gosf/homeKitchen.jsp">Home & Kitchen</a></li>

          <%--<li><a href="${pageContext.request.contextPath}/store/gosf/toys.jsp">Toys</a></li>--%>
      </ul>

    </div>



    <div class="nav-gosf">


              <span>
              <a href="${pageContext.request.contextPath}/store/gosf/healthCare.jsp"> Health Care</a></span>


      <div class="cl"></div>

      <ul class="menu">
        <li><a href="${pageContext.request.contextPath}/store/gosf/diaFood.jsp">Diabetic Food</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/monitoringTesting.jsp">Monitoring &amp; Testing</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/clinicalProd.jsp">Clinical Products</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/generalHD.jsp">General Health Devices</a></li>
        <li><a href="${pageContext.request.contextPath}/store/gosf/diabetesDevicesCombo.jsp">Diabetes &amp; Devices Combo</a></li>
      </ul>

    </div>




  </div>

</li>
<!-- Health & Wellness close--->

<li><a href="${pageContext.request.contextPath}/store/gosf/gosfExclusive.jsp">Exclusive</a> </li>

<li><a href="${pageContext.request.contextPath}/store/gosf/gosfCoupons.jsp">All Coupons</a> </li>


</ul>


<!-- account and cart--->

<div class="row cont-rht text-left cart-mt">





  <%--<div class="span2 mrgn-bt-15">--%>
    <%--<div class="hdr-drop-cntnr">--%>
      <%--<div class="hdr-drop-label">--%>
        <%--<shiro:hasAnyRoles name="<%=roles%>">--%>
          <%--<div class="pop-label">Account</div>--%>
              <%--<span class="fnt-sz10">Hi <span--%>
                  <%--style="max-width: 64%;line-height:1em;display: inline-block;overflow: hidden;text-overflow: ellipsis;white-space: nowrap;"><shiro:principal--%>
                  <%--property="firstName"/></span>  <span class="icn icn-dwn-arrow"></span></span>--%>
        <%--</shiro:hasAnyRoles>--%>
        <%--<shiro:hasRole name="<%=RoleConstants.TEMP_USER%>">--%>
          <%--<div class="pop-label">Account</div>--%>
          <%--<s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="fnt-sz10"> Sign in--%>
            <%--<s:param name="redirectUrl" value="<%=originalUrlHeader%>"/>--%>
          <%--</s:link> <span class="icn icn-dwn-arrow"></span>--%>
        <%--</shiro:hasRole>--%>
        <%--<shiro:guest>--%>
          <%--<div class="pop-label">Account</div>--%>
          <%--<s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="fnt-sz10"> Sign in--%>
            <%--<s:param name="redirectUrl" value="<%=originalUrlHeader%>"/>--%>
          <%--</s:link> <span class="icn icn-dwn-arrow"></span>--%>
        <%--</shiro:guest>--%>
      <%--</div>--%>
      <%--<ul class="hdr-drop-down gl pad hide ">--%>
        <%--<a href="/core/user/MyAccount.action?pre=&tabId=1">--%>
          <%--<li>--%>
            <%--Profile--%>
          <%--</li>--%>
        <%--</a>--%>
        <%--<a href="/core/user/UserManageAddress.action?manageAddresses=">--%>
          <%--<li>--%>
            <%--Addresses--%>
          <%--</li>--%>
        <%--</a>--%>
        <%--<shiro:hasAnyRoles name="<%=roles%>">--%>
          <%--<s:link beanclass="com.hk.web.action.beta.auth.LogoutAction">--%>
            <%--<li class="brdr-t">LOG OUT</li>--%>
            <%--<s:param name="redirectUrl" value="/"/>--%>
          <%--</s:link>--%>
        <%--</shiro:hasAnyRoles>--%>
      <%--</ul>--%>

    <%--</div>--%>


  <%--</div>--%>








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
</div>
<!--- header close --->
<div class="cl"></div>
</s:layout-definition>