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
     <span class="gosfH1">Monitoring &amp; Testing</span>

    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="37431,6716,45000,9845,6698,16691,6823,7023,6858,9856,6699,36311,16687,47046,6705,7019,46642,6711,16686,47777,7017,46638,44999,6710,7018,7021,16689,16685,6830,6822,6859,6843,6833,16690,6828,6825,6821,6847,6831,18754,6725,37769,6733,3870" showAddToCart="true"/>
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