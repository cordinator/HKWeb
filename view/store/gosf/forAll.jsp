<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp">
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


  <s:layout-component name="msHeader">
    <s:layout-render name="/store/gosf/gosfHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

        <div class="gosfBanner">
          <div class="wrapper">
            <img src="<hk:vhostImage/>/assets/images/gosf/forAllCatBanner.png">
          </div>
        </div>
        <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="19816,19790,19791,39357,39358,23166,23167,19799,19800,19801,39355,39357,39358,23166,23167,23649,23663,23693,23694,23695,23696,23741,23743,23744,23688,23689,23690,23672,23673,23697,23674,23686,23665,19755,19756,19757,19758,19759,19760,19761,19762,23664,23679,39971,46588,21080,21079,39787,39600,39601,39602,43056,43057,43058,43059,43060,45824,45825,45826,45794,45795,45797,45798,45799,45800,22167,22168,22169,22170,22171,22172,22173,22174,22175,22176,45287,45288,45289,48651,47291,47292,47293,47295,47296,47297,47298,47299,47300,47301,47302,47303,47304,47305,47306,47307,47308,47309,40170,40171,40172,40173,48289,48294,48299,48304,48314,48319,48324,48329,48338,48345,48553,48577,48591,48609" showAddToCart="true"/>
   </div>
  </s:layout-component>

  <s:layout-component name="msFooter">
    <s:layout-render name="/store/gosf/gosfFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>