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
            <img src="<hk:vhostImage/>/assets/images/gosf/beautyCatBanner.jpg">
          </div>
        </div>
        <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="46475,46467,46464,46463,46460,46458,46325,24522,47156,5707,42896,41403,5708,44705,47093,47160,25467,44706,41404,42117,16948,18772,44707,36419,44708,35734,16949,37825,35738,25465,10816,11679,11680,42887,334,48201,37824,40610,5046,5642,24539,44633,8667,10815,10932,11681,42111,46322,10840,44416,37826,11683,42888,19397,46254,47187,45965,4304,4484,47772,33481,33678,37405,47194,47848,46241,42868,42901,24527,47851,40698,25575,36493,5506,40355,3703,38420,11217,40622,12364,5178,6403,12368,3674,48069,41726,41158,47507,12366,47780,47029,47207,38421,47781,38424,12367,38427,38428,48107,48109,47779,40363,5018,37142,34436,38260,12227,12618,46217,34686,47035,12624,46181,12625,47034,5041,12620" showAddToCart="true"/>
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