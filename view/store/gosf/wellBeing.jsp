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

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
   <div class="wrapper">
     <span class="gosfH1">WELL BEING</span>
    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="12880,12827,13916,13935,13955,45266,13994,12821,13996,12847,13938,12937,15188,15178,15284,14552,15283,15189,15164,13989,13931,12886,12845,13917,14231,37931,37922,12916,13949,37934,12907,12909,45268,13991,15174,5275,12811,12870,13921,13915,12771,14232,13678,45162,48164,12830,37919,15172,12877,12810,14441,37924,44970,13988,14500,14431,15193,45165,12844,13686,13283,42640,37933,12794,12773,12866,12785,12956,45157,12872,12927,13956,12797,12908,12868,12772,37913,37914,37917,14545,37910,14546,14558,12822,15348,13676,37918,37916,15330,15345,13191,15351,15697,15352,15346,15787,15354,15865,15343,15784,15785,13042" showAddToCart="true"/>
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