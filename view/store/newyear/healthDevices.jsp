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

  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
     <span class="gosfH1">Health Devices</span>
    <s:layout-render name="/store/newyear/nyCatalogLayout.jsp" vid="389,417,418,423,6484,6591,36527,7017,7018,7021,37117,9845,9847,9856,9860,9867,46457,46638,46639,46642,9919,10050,10273,10274,10321,10325,10394,10426,47063,37431,44999,45000,47777,10681,37533,37551,12198,12587,16685,16686,16688,38344,18493,18500,18752,43247,25672" showAddToCart="true"/>
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