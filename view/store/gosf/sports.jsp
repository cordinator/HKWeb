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
            <img src="<hk:vhostImage/>/assets/images/gosf/sportsCatBanner.png">
          </div>
        </div>
        <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="24463,38970,39417,39002,21041,39478,24284,24283,21050,39275,23617,39748,39665,21801,39466,21037,20352,20357,21213,20733,23104,20353,23145,21190,23102,22498,20343,20683,38826,20470,38804,38812,45802,38783,22698,38776,38820,22348,38824,35645,40158,45300,38815,20792,20793,20333,38929,20334,23830,46709,40040,20717,23817,23819,23820,46710,23823,20329,45722,20485,45596,40046,40023,20314,20311,20335,45593,46843,40042,20720,20721,20496,21233,21241,21217,21252,21203,21247,23066,21180,21193,21207,39062,21675,21493,21414,21482,21393,22693,39077,21460,21853,21668,43084,21362,21363,24145,20500,20881,43085,21843,20499,24125,20450,20435,20434,24312,21966,44690,44688,44691,39996,20399" showAddToCart="true"/>
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