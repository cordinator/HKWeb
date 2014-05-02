<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="Other Sports Accessories Clearance Sale online in India | HealthKart.com">
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
    <meta name="description" content="Clearance Sale of Other Sports Accessories online in India at HealthKart.com. Free home delivery across India on orders above Rs. 500." />
    <meta name="keywords" content="Other Sports Accessories Clearance sale, Other Sports Accessories branded products, Other Sports Accessories in India, Other Sports Accessories & Products Online Sale" />
  </s:layout-component>

  <s:layout-component name="msHeader">
    <s:layout-render name="/store/clearance/clearanceHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
   <div class="wrapper">
          <h1 class="headingH1">Other Sports</h1>
     <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="40051,40124,40123,40122,40121,40117,40116,40115,40114,40113,40112,40111,40095,24471,24469,24468,24467,24466,24465,24462,24460,24455,24454,24453,24284,24283,45460,23619,23618,23617,23616,23614,23612,23611,23610,23609,23608,23607,23606,23605,23603,23601,22955,39733,21052,21051,21048,21046,21045,21039,21037,22597,22596,22595,22594,22595" showAddToCart="true"/>

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