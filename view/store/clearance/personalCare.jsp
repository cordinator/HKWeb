<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="Personal Care Products Clearance Sale online in India | HealthKart.com">
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
    <meta name="description" content="Clearance Sale of Personal Care Products online in India at HealthKart.com. Free home delivery across India on orders above Rs. 500." />
    <meta name="keywords" content="Personal Care Products Clearance sale, Personal Care branded products, Personal Care Products in India, Personal Products Online Sale" />
  </s:layout-component>

  <s:layout-component name="msHeader">
    <s:layout-render name="/store/clearance/clearanceHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
     <h1 class="headingH1">Personal Care</h1>
    <s:layout-render name="/store/clearance/clearanceCatalogLayout.jsp" vid="3937,3936,9511,16629,9502,18032,24898,24869,16537,16575,24866,24896,9941,24705,24872,45354,24999,24936,24942,24868,48204,9512,11964,9942,43453,18277,43456,43457,35927,6481,11802,11950,18050,41022,24951,37765,17203,36340,11963,43454,43458,17208,18021,18259,41020,9513,17204,11966,18132,47090,38484,38487,38526,18699,18130,41018,38469,18301,47140,38492,17178,17179,18387,38473,38472,18371,38488,18023,18025,18272,17666" showAddToCart="true"/>
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