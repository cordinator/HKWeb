<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="Fitness Equipments Clearance Sale online in India | HealthKart.com">
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
    <meta name="description" content="Clearance Sale of Fitness Equipments online in India at HealthKart.com. Free home delivery across India on orders above Rs. 500." />
    <meta name="keywords" content="Fitness Equipments Clearance sale, Fitness Equipments branded products, Fitness Equipments in India, Fitness Products Online Sale" />
  </s:layout-component>

  <s:layout-component name="msHeader">
    <s:layout-render name="/store/clearance/clearanceHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
     <h1 class="headingH1">Fitness Equipments</h1>

    <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="21619,21620,21621,21622,21623,21624,21625,21626,21627,21628,21629,21630,24448,24449,24450,24433,23987,23988,23990,23991,21698,21700,21701,21702,24441,24442,24446,24447,21709,21710,21711,21713,21714,21715,21716,21717,21719,21723,21724,21725,21727,21728,21730,21731,21732,21733,21734,21735,21736,21740,21745,21755,21757,21758,21759,21762,21763,24368,24371,24373,24374,24375,24379,24381,24383,45450,24385,24389,24390,24392,24393,24395,24398,24406,24409,24410,24412,24413,24414,24415,24416,24419,24422,24423,24424,24427,21691,21695,21696,21697,21699,21706,21107,21108,21109,21110,24428,24429,24430,24431,24432,24435,24436,24437,24438,24439,24440,24443,24444,24445,21718,21722,21726,21738,21742,21752,21760,21761,24369,24370,24372,24376,24380,24382,24384,24388,24391,24396,24399,24400,24401,24408,24420,23994,21083,21084,21085,21086,44484,44485,44488,44490,21103,21104,21105,21106,21099,21100,21101,21102,21138,21139,21140,21146,21147,21148,21149,21150,21151,21152,21153" showAddToCart="true"/>
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