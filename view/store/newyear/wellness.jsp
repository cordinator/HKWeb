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
        <img src="<hk:vhostImage/>/store/newyear/images/wellness.jpg">
      </div>
    </div>
    <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
   <div class="wrapper">
     <s:layout-render name="/store/newyear/nyCatalogLayout.jsp" vid="249,252,572,41171,3703,4074,45393,5198,47703,5384,35353,41403,41404,36419,6527,44709,48401,9835,48201,44249,41735,41839,46113,47893,11518,41875,11679,11680,11681,11683,12148,42117,37824,37825,37826,16187,46046,46147,42674,42675,38260,47034,47035,42887,42888,25259,46325,47491,47144,48734,47872,47873,9277,44726,10424,45293,46408,11083,37620,45310,12208,12209,12211,37764,16591,16592,16634,16978,16979,16983,17488,17489,17636,48695,17860,17898,25177,40596,48618,844,2758,35986,35991,36082,36086,44525,44527,44528,44529,46404,44605,46878,46882,46883,2924,3013,9287,9288" showAddToCart="true"/>
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