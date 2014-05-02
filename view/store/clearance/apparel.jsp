<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="Men & Women Apparel Clearance Sale online in India | HealthKart.com">
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
    <meta name="description" content="Clearance Sale of Men & Women Apparel online in India at HealthKart.com. Free home delivery across India on orders above Rs. 500." />
    <meta name="keywords" content="Men & Women Apparel Clearance sale, Men & Women Apparel branded products, Men & Women Apparel in India, Men & Women Apparel Products Online Sale" />
  </s:layout-component>

  <s:layout-component name="msHeader">
    <s:layout-render name="/store/clearance/clearanceHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
     <h1 class="headingH1">Apparel</h1>

    <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="24448,24444,24440,24437,24436,24435,24431,24430,24428,24424,24420,24413,24412,24408,24401,24392,24381,24380,24379,21763,21760,21758,21742,21734,21726,21724,21723,21722,21713,21706,21702,21701,21700,21699,21697,21696,21695,47126,22339,22325,22322,22320,22317,22312,22307,22296,22284,22283,21153,21151,21145,21142,21139,21138,21136,21134,21131,21128,21122,21119,21118,21109,21095,21093,21092,21091,21090,44485,44484,21086,21084,46946,46943,46942,46938,22426,22658,22628,23990,22628" showAddToCart="true"/>
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