<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="Indoor Gym">
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
     <h1 class="headingH1">Indoor Gym</h1>
    <s:layout-render name="/store/weightManage/weightManageCatalogLayout.jsp" vid="45401,47676,47677,39705,44683,44686,39706,40181,40190,39704,46572,47417,40184,47396,39706,40185,47386,40187,45748,21490,48770,46412,44719,47677,40197,46535,40196,40198,46537,21452,40199,21487,46852,21480,44713,40200,46557,44714,46509,47458,46561,39924,40206,44681,24352,46531,40202,39923,40201,46528,46531,46514,46513,46512,39741" showAddToCart="true"/>
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