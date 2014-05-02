<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="Diabetes Care Products Clearance Sale online in India | HealthKart.com">
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
  <s:layout-component name="htmlHead">
    <meta name="description" content="Clearance Sale of Diabetes Care Products online in India at HealthKart.com. Free home delivery across India on orders above Rs. 500." />
    <meta name="keywords" content="Diabetes Care Products Clearance sale, Diabetes Care branded products, Diabetes Care Products in India, Diabetes Care Products Online Sale" />
  </s:layout-component>

  <s:layout-component name="msHeader">
    <s:layout-render name="/store/clearance/clearanceHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
     <h1 class="headingH1">Diabetes</h1>
    <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="24656,24663,6710,40998,6713,38346,6724,38338,17591,24657,37355,6723,6712,6707,6731,6887,24660,24664,24665,24667,24666,35897,24661,24662,6700,6703,24659,24658,6729,6730,6727,36522,6704,6708,24669,6701,35898,36537,45404,44699,9262,9265,9263,36312,6863,36311,6882,6683,36531,36536,24639,6883,6866,9258,9259,6722,6726,6855,35593,9266,46978,46979,48402,24640,44677,6717,6853" showAddToCart="true"/>
   </div>
  </s:layout-component>

  <s:layout-component name="msFooter">
    <s:layout-render name="/store/clearance/clearanceFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>