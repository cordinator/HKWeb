<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>


<s:layout-render name="/store/msGeneral.jsp" title="Weight Management">
  <%
    boolean isSecure = WebContext.isSecure();
    pageContext.setAttribute("isSecure", isSecure);

    PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
    if (principal != null) {
      pageContext.setAttribute("user_hash", principal.getUserHash());
      pageContext.setAttribute("gender", principal.getGender());
      pageContext.setAttribute("orderCount", principal.getOrderCount());
    } else {
      pageContext.setAttribute("user_hash", "guest");
      pageContext.setAttribute("gender", null);
      pageContext.setAttribute("orderCount", null);
    }
  %>

  <s:layout-component name="htmlHead">
    <meta name="description" content="Weight Management – Discount on branded products at HealthKart. Buy Branded Nutrition, Sports & Fitness products online from India's most reliable e-health store." />
    <meta name="keywords" content="Weight Management" />
  </s:layout-component>

  <s:layout-component name="msHeader">
    <s:layout-render name="/store/weightManage/weightManageHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

    <div class="wrapper">
      <div class="bannerRow">
       <img class="flot-l mrgn-r-20" src="<hk:vhostImage/>/store/weightManage/images/main-big-banner2.jpg" />
        <div>
          <a href="http://www.healthkart.com/store/weightManage/treadmills.jsp"><img src="<hk:vhostImage/>/store/weightManage/images/Stag.jpg" /> </a>
          <a href="http://www.healthkart.com/store/weightManage/ayurveda.jsp"><img src="<hk:vhostImage/>/store/weightManage/images/weight-loss.jpg" /> </a>
        </div>
      </div>
       </div>
    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
    <div class="wrapper">

      <div class="pHeading"><h2 class="headingH2">HEALTH SUPPLEMENTS</h2> <span><a href="${pageContext.request.contextPath}/store/weightManage/healthNutrition.jsp">More in Health Supplements &raquo;</a> </span> </div>
      <s:layout-render name="/store/weightManage/weightManageCatalogLayout.jsp" vid="45108,15662,15667,13547,42399,13688,42385,44822" showAddToCart="true"/>

      <div class="pHeading"><h2 class="headingH2">WORKOUT SUPPLEMENTS</h2> <span><a href="${pageContext.request.contextPath}/store/weightManage/workoutSupplements.jsp">More in Workout Supplements &raquo;</a> </span> </div>
      <s:layout-render name="/store/weightManage/weightManageCatalogLayout.jsp" vid="42130,48812,42652,48806,15515,44493,42604,42245" showAddToCart="true"/>

      <div class="pHeading"><h2 class="headingH2">Indoor Gym</h2> <span><a href="${pageContext.request.contextPath}/store/weightManage/indoorGym.jsp">More in Indoor Gym &raquo;</a> </span> </div>
      <s:layout-render name="/store/weightManage/weightManageCatalogLayout.jsp" vid="40181,40190,45401,39704,46852,40202,47396,39706" showAddToCart="true"/>

      <div class="pHeading"><h2 class="headingH2">Shape Your Waist</h2> <span><a href="${pageContext.request.contextPath}/store/weightManage/shapeWaist.jsp">More in Shape Your Waist &raquo;</a> </span> </div>
      <s:layout-render name="/store/weightManage/weightManageCatalogLayout.jsp" vid="45308,19962,24363,19963,39137,47462,23963,21169" showAddToCart="true"/>

      <div class="pHeading"><h2 class="headingH2">Build Abs</h2> <span><a href="${pageContext.request.contextPath}/store/weightManage/buildAbs.jsp">More in Build Abs &raquo;</a> </span> </div>
      <s:layout-render name="/store/weightManage/weightManageCatalogLayout.jsp" vid="36538,47802,19811,39171" showAddToCart="true"/>

      <div class="pHeading"><h2 class="headingH2">WEIGHT MANAGEMENT DEVICES</h2> <span><a href="${pageContext.request.contextPath}/store/weightManage/weightDevices.jsp">More in Weight Management Devices &raquo;</a> </span> </div>
      <s:layout-render name="/store/weightManage/weightManageCatalogLayout.jsp" vid="45000,7021,16686,16691,10430,16689,48166,41006" showAddToCart="true"/>

      <div class="pHeading"><h2 class="headingH2">BODY SHAPING</h2> <span><a href="${pageContext.request.contextPath}/store/weightManage/bodyShaping.jsp">More in Body Shaping &raquo;</a> </span> </div>
      <s:layout-render name="/store/weightManage/weightManageCatalogLayout.jsp" vid="5708,37788,25648,46870" showAddToCart="true"/>

    </div>
  </s:layout-component>

  <s:layout-component name="msFooter">
    <s:layout-render name="/store/weightManage/weightManageFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>