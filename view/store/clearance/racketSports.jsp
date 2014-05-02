<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="Racket Sports Clearance Sale online in India | HealthKart.com">
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
    <meta name="description" content="Clearance Sale of Racket Sports online in India at HealthKart.com. Free home delivery across India on orders above Rs. 500." />
    <meta name="keywords" content="Racket Sports Clearance sale, Racket Sports branded products, Racket Sports in India, Racket Sports Products Online Sale" />
  </s:layout-component>

  <s:layout-component name="msHeader">
    <s:layout-render name="/store/clearance/clearanceHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
     <h1 class="headingH1">Racket Sports</h1>

    <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="50079,50078,50072,47319,23065,24329,24312,24302,24301,21683,47806,47805,47794,48212,48210,50079,50078,50072,47319,21586,47123,20418,20416,20415,20723,20712,43092,43091,43089,43088,43087,43078,23078,23038,23037,23036,23035,23023,50079,50078,50072,47319,21340,40304,20848,20837,20794,20793,20792,20791,20790,20787,20785,20783,20782,20780,20779,48851,48850,48849,48830,48829,48830" showAddToCart="true"/>
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