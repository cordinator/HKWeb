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

  <%--<s:layout-component name="htmlHead">--%>
    <%--<meta name="description" content="Clearance Sale of Sports Nutrition & Supplements Online in India at HealthKart.com. Free home delivery across India on orders above Rs. 500" />--%>
    <%--<meta name="keywords" content="Sports Supplement Clearance sale, branded products, Bodybuilding Supplements in India, Supplements Online Sale" />--%>
  <%--</s:layout-component>--%>


  <s:layout-component name="msHeader">
    <s:layout-render name="/store/weightManage/weightManageHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

        <%--<div class="nyBanner">--%>
          <%--<div class="wrapper">--%>
            <%--<img src="<hk:vhostImage/>/store/clearance/images/Sports-Nutrition.jpg">--%>
          <%--</div>--%>
        <%--</div>--%>
        <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
     <h1 class="headingH1">Sports Nutrition</h1>
    <s:layout-render name="/store/weightManage/weightManageCatalogLayout.jsp" vid="42605,46681,37949,42609,42604,44493,13266,37832,37829,13977,14191,42611,13093,12884,14227,14167,14158,42613,14171,13263,46658,46665,42319,14192,14160,14155,13965,42610,42598,42270,14195,14170,14162,13978,13970,13960,13947,13256,44980,13253" showAddToCart="true"/>
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