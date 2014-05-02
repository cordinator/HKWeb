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
    <s:layout-render name="/store/newyear/newyearHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">
    <div class="nyBanner">
      <div class="wrapper">
        <img src="<hk:vhostImage/>/store/newyear/images/Fitness.jpg">
      </div>
    </div>
    <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
   <div class="wrapper">
     <span class="gosfH1">Wellness</span>
    <s:layout-render name="/store/newyear/nyCatalogLayout.jsp" vid="21452,21490,39767,40196,44719,47446,47460,46515,47677,21454,21479,21484,40206,44714,44717,47458,47100,46505,46503,46509,19798,19837,39494,39755,39768,39769,39770,39771,39778,39779,39780,39781,39782,39783,39784,39785,39786,45969,45970,45971,46507,19705,20796,20797,21468,21472,22237,22239,46511,47012,21477,22236,39922,39923,40201,40202,47468,47471,47404,45857,46514,21478,39704,40004,40180,40181,40182,40184,40185,40190,40194,45748,45479" showAddToCart="true"/>
   </div>
  </s:layout-component>

  <s:layout-component name="msFooter">
    <s:layout-render name="/store/newyear/newyearFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>