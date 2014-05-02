<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp" title="Top 50 Nutrition Products - Healthkart">
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
    <s:layout-render name="/store/topNutrition/topNutritionHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">
    <div class="container clearfix topBanner">
      <div class="bnr-main-cnt">
        <img src="<hk:vhostImage/>/store/topNutrition/images/nutTop50Banner.jpg" style="max-width:960px;" alt="One Touch">
      </div>
    </div>

  </s:layout-component>

  <s:layout-component name="msContent">
    <s:layout-render name="/store/topNutrition/topNutCatalogLayout.jsp" vid = "14673,14331,13475,15397,37897,13479,15003,13358,13218,49763,45028,14838,15226,15077,15424,14850,15817,12982,14949,15462,42290,42650,48721,42533,42168,38022,15151,15830,13378,12969,47219,14334,15502,44665,13489,13030,42275,37888,15913,42646,45106,14293,13013,13560,42654,13780,48620,48658,42307,15826" showAddToCart="true"/>
  </s:layout-component>


  <s:layout-component name="msFooter">
    <s:layout-render name="/store/topNutrition/topNutritionFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>