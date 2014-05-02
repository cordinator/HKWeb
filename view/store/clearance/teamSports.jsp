<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="Team Sports Clearance Sale online in India | HealthKart.com">
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
    <meta name="description" content="Clearance Sale of Team Sports online in India at HealthKart.com. Free home delivery across India on orders above Rs. 500." />
    <meta name="keywords" content="Team Sports Clearance sale, Team Sports branded products, Team Sports in India, Team Sports Products Online Sale" />
  </s:layout-component>

  <s:layout-component name="msHeader">
    <s:layout-render name="/store/clearance/clearanceHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
     <h1 class="headingH1">Team Sports</h1>

    <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="23120,23116,45572,22502,23099,23098,23096,20989,20986,20842,20841,20840,40169,22719,22715,45298,22713,22712,22711,22705,22704,22698,35645,22695,47914,47913,45811,45802,48574,48573,47588,48572,47587,47586,47585,47582,48567,47581,47579,47578,47574,47573,47571,45516,47552,45483,22523,22512,22457,22456,22455,22454,22450,22448,22403,22394,22384,22381,22374,22373,22371,22369,22367,22362,22349,21157,21929,21928,21918,21909,21908,21905,21904,21893,38918,38916,38914,38913,38907,38906,38903,38899,38898,38891,38888,38886,20492,20491,20490,20466,20451,45791,45788,47597,22498,22496,22489,22486,22478,22475,22469,22468,48682,23154,23152,23151,23150,23149,23147,23107,23106,23102,21214,21202,21201,21190,21112,21077,21053,23053,23052,22884,45296,22549,39188,22549" showAddToCart="true"/>
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