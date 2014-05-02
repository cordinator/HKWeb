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
            <img src="<hk:vhostImage/>/store/newyear/images/Sports-Nutrition.jpg">
          </div>
        </div>
        <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
    <s:layout-render name="/store/newyear/nyCatalogLayout.jsp" vid="15138,30770,14162,14170,13266,13444,14400,35475,15072,13974,13967,35531,30592,15308,15286,47771,13523,13390,30699,15965,15145,13977,35746,13177,13462,15150,42290,15793,15936,44909,15808,13176,42531,30594,47718,47056,13956,42544,47000" showAddToCart="true"/>
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