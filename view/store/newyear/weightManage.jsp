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

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
   <div class="wrapper">
     <span class="gosfH1">Weight Management</span>
    <s:layout-render name="/store/newyear/nyCatalogLayout.jsp" vid="44822,46429,45177,12864,13688,44796,15944,42643,12815,12880,14536,13745,13722,13748,15667,44803,45108,37315,42399" showAddToCart="true"/>
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