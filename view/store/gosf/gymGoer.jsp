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
            <img src="<hk:vhostImage/>/assets/images/gosf/gym-goer.png">
          </div>
        </div>
        <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="39768,39494,46507,39917,39755,19798,19837,39784,20520,39778,39780,39781,39782,39783,45969,19967,19966,39776,43053,43052,39769,22919,39787,21016,48159,39528,21011,21012,21013,20796,21292,21293,21294,21290,21291,19782,39526,39521,39522,21134,21135,21136,21137,21150,21151,21152,21153,21146,21147,21148,21142,21143,21144,21145,19785,20750,45952,45953,45845,46399,45007,19682,19786,39662,39663,39664,20452,45883,45885,45887,45889,45891,45893,48289,48294,48299,48304,48314,48319,48324,48329,48338,48345,48553,48577,48591,48609" showAddToCart="true"/>
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