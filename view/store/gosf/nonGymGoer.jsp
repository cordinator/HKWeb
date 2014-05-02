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
            <img src="<hk:vhostImage/>/assets/images/gosf/nonGymGoerCatBanner.png">
          </div>
        </div>
        <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="21478,40181,40190,40182,40184,45748,40185,40004,47382,40180,21490,47460,44719,47677,40198,21452,39767,47446,46515,47458,21479,44714,44717,46509,46505,40206,21454,46503,21477,39922,47468,47404,40201,39923,40202,46514,45857,22236,47471,21468,22239,47012,21472,22237,46511,39575,39576,39577,39578,21532,21533,21526,21527,21528,21529,21530,21404,21405,21406,21407,21408,20745,20746,20747,20748,20749,45936,45937,45938,45939,45940,21494,21495,21496,21497,21498,21499,21500,21501,21502,21503,21504,39123,39124,39125,39126,39127,39128,24148,39531,39532,39533,39536,39537,39538,39539,21505,21506,21507,21508,21509,21510,21511,21512,39101,39102,39103,39104,39105,39106,39107,23951,23953,20201,39397,39745,45344,20073,19705,20796,39507,20797,21783,45423,45424,45425,45426,45427,45428,45429,45430,45433,45434,38827,38832,39773,39744,48165,48166,19963,19964,20315,20316,20317,39137,39723,20459,22140,39655,19961,19698,19811,22248,22249,45860,45862,45863,45864,23972,23974,23975,19962,39974,19820,23168,19824,47525,19700,47802,39133,39709,45922,45923,45924,39746,39747,46516,40194,39937,45479,47886,39935,39704,46566,39938,46520,46521,46510,21445,46502,46513,46512,39741,40340,21169,48077,48078,48079,48080,39765" showAddToCart="true"/>
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