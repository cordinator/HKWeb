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
        <img src="<hk:vhostImage/>/store/newyear/images/SportsFitness.jpg">
      </div>
    </div>
    <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
   <div class="wrapper">
         <s:layout-render name="/store/newyear/nyCatalogLayout.jsp" vid="20352,20357,21213,21214,20733,23104,20353,23145,23146,20343,23102,22498,20683,20684,20685,20686,38826,20470,38804,38812,45802,38783,38776,38820,22348,22349,38824,35645,40158,45300,38815,20792,20793,20333,38929,20334,23830,45454,46709,40040,20717,23817,23819,23820,46710,23823,20329,45722,45596,40046,40023,20314,20311,20335,45593,46843,40042,20720,20721,20496,21233,21241,21242,21217,21203,21203,21247,23066,21180,21193,21207,39062,21675,21493,21414,21482,21393,22693,39077,21460,21853,21668,43084,21362,21363,20500,20881,43085,43086,21843,20499,20500,24125,20450,24463,38970,38971,38972,38973,38974,38975,38976,38977,39417,39418,39419,39420,39002,39003,39004,39005,39006,39007,39008,21041,21042,21043,21044,39478,24284,24283,21050,21051,39275,39276,39277,39278,39279,23617,23619,39748,39749,39750,39665,21801,39466,39467,39469,39468,21037,21038,21039,21040,20363,20364,20365,20265,20266,20267,20268,20269,20270,20369,20370,20371,20435,20434,24312" showAddToCart="true"/>
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