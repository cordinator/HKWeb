<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="HEALTH SUPPLEMENTS">
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
     <h1 class="headingH1">HEALTH SUPPLEMENTS</h1>
    <s:layout-render name="/store/weightManage/weightManageCatalogLayout.jsp" vid="15667,13688,14423,37874,14483,14536,14548,13902,14425,14409,14484,37868,14485,13819,13680,13533,14584,14594,15662,15661,13545,13547,42399,38008,13546,42548,15739,13549,42549,13722,38049,15741,38010,44187,15743,13673,46730,45247,13723,38009,46729,45248,42374,38037,38029,45280,38050,38034,38030,38033,13528,15744,45284,45108,12815,45285,42385,42386,12880,44822,42159,12825,38015,12766,45174,15161,42348,15160,13942,42572,45164,15868,42645,15247,15126,15443,15442,15444,15626,15637,13294,13296,13295,46429,12864,12839,37979,12965,37940,42192,13044,37930,13605,42581,13600,13603,45189,15446,42385,13286,12790,38006,15604,45108,15667" showAddToCart="true"/>
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