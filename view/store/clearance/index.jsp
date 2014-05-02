<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>


<s:layout-render name="/store/msGeneral.jsp" title="Clearance Sale @ HealthKart: Selling Branded Products online in India">
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
    <meta name="description" content="Clearance sale – Discount on branded products at HealthKart. Buy Branded Nutrition, Sports & Fitness products online from India's most reliable e-health store." />
    <meta name="keywords" content="Clearance sale, branded products, Sale in India, Online Sale, Discount Products, Clearance Sale in India, buy Clearance Sale online in india, online store for Clearance Sale, Shop online for Clearance Sale" />
  </s:layout-component>

  <s:layout-component name="msHeader">
    <s:layout-render name="/store/clearance/clearanceHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

    <div class="wrapper">
      <div class="bannerRow">
        <a href="${pageContext.request.contextPath}/store/clearance/sportsNutrition.jsp"><img src="<hk:vhostImage/>/store/clearance/images/sprtnut.jpg"> </a>
          <a href="${pageContext.request.contextPath}/store/clearance/healthNutrition.jsp"><img class="margin-l13" src="<hk:vhostImage/>/store/clearance/images/healthnut.jpg">   </a>
            <a href="${pageContext.request.contextPath}/store/clearance/sports.jsp"><img class="margin-l13" src="<hk:vhostImage/>/store/clearance/images/sports.jpg">      </a>
      </div>
      <div class="cl"></div>
        <div class="bannerRow">
          <a href="${pageContext.request.contextPath}/store/clearance/apparel.jsp"><img src="<hk:vhostImage/>/store/clearance/images/apparel.jpg">       </a>
            <a href="${pageContext.request.contextPath}/store/clearance/health.jsp"><img class="margin-l13" src="<hk:vhostImage/>/store/clearance/images/healthprd.jpg">   </a>
              <a href="${pageContext.request.contextPath}/store/clearance/wellness.jsp"><img class="margin-l13" src="<hk:vhostImage/>/store/clearance/images/wellness.jpg">      </a>
      </div>  </div>
    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
    <div class="wrapper">

      <div class="pHeading"><h2 class="headingH2">Sports Nutrition</h2> <span><a href="${pageContext.request.contextPath}/store/clearance/sportsNutrition.jsp">More in Sports Nutrition &raquo;</a> </span> </div>
      <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="42611,42319,13266,42605,44980,37949,14195,42610" showAddToCart="true"/>

      <div class="pHeading"><h2 class="headingH2">Health Nutrition</h2> <span><a href="${pageContext.request.contextPath}/store/clearance/healthNutrition.jsp">More in Health Nutrition &raquo;</a> </span> </div>
      <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="12877,13917,13914,13952,13935,44822,13811,37919" showAddToCart="true"/>

      <div class="pHeading"><h2 class="headingH2">Sports</h2> <span><a href="${pageContext.request.contextPath}/store/clearance/sports.jsp">More in Sports &raquo;</a> </span> </div>
      <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="38783,38786,21267,22704,22594,39176,23065,23096" showAddToCart="true"/>

      <div class="pHeading"><h2 class="headingH2">Fitness Accessories</h2> <span><a href="${pageContext.request.contextPath}/store/clearance/fitnessAcces.jsp">More in Fitness Accessories &raquo;</a> </span> </div>
      <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="39566,23753,24156,23794,45864,47448,45827,45840" showAddToCart="true"/>

      <div class="pHeading"><h2 class="headingH2">Health</h2> <span><a href="${pageContext.request.contextPath}/store/clearance/health.jsp">More in Health &raquo;</a> </span> </div>
      <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="7017,47078,24656,40998,6722,264,25677,40451" showAddToCart="true"/>

      <div class="pHeading"><h2 class="headingH2">Wellness</h2> <span><a href="${pageContext.request.contextPath}/store/clearance/wellness.jsp">More in Wellness &raquo;</a> </span> </div>
      <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="318,42728,37824,41816,47836,36340,11293,16185" showAddToCart="true"/>

    </div>
  </s:layout-component>

  <s:layout-component name="msFooter">
    <s:layout-render name="/store/clearance/clearanceFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>