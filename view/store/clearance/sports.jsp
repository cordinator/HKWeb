<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp"  title="Sports Products Clearance Sale online in India | HealthKart.com">
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
    <meta name="description" content="Clearance Sale of Sports Products online in India at HealthKart.com. Free home delivery across India on orders above Rs. 500." />
    <meta name="keywords" content="Sports Products Clearance sale, Sports Products branded products, Sports Products in India, Sports Products Products Online Sale" />
  </s:layout-component>

  <s:layout-component name="msHeader">
    <s:layout-render name="/store/clearance/clearanceHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">
    <%--<div class="nyBanner">--%>
      <%--<div class="wrapper">--%>
        <%--<img src="<hk:vhostImage/>/store/clearance/images/SportsFitness.jpg">--%>
      <%--</div>--%>
    <%--</div>--%>
    <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
   <div class="wrapper">
     <h1 class="headingH1">Sports</h1>
         <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="23120,23116,45572,22502,23099,23098,23096,20989,20986,20842,24448,24444,24440,24437,24436,24435,24431,24430,24428,24424,50079,50078,50072,47319,23065,24329,24312,24302,24301,21683,40051,401220594,20566,20558,20557,20551,44321,20301,20262,20260,20237,4,40123,40122,40121,40117,40116,40115,40114,40113" showAddToCart="true"/>
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