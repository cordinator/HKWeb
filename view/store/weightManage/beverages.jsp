<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="BEVERAGES/ORGANIC DRINKS">
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
     <h1 class="headingH1">BEVERAGES/ORGANIC DRINKS</h1>
    <s:layout-render name="/store/weightManage/weightManageCatalogLayout.jsp" vid="15662,15661,13545,13547,42399,38008,13546,42548,15739,13549,42549,13722,38049,15741,38010,44187,15743,13673,46730,45247,13723,38009,46729,45248,42374,38037,38029,45280,38050,38034,38030,38033,13528,15744,45284,45108,12815,45285" showAddToCart="true"/>
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