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
            <img src="<hk:vhostImage/>/assets/images/gosf/sports-nutrition.png">
          </div>
        </div>
        <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="13475,15016,37892,15003,13347,15227,47072,45028,15076,14838,42307,15817,37897,42536,42293,42646,13218,13378,15135,13030,44861,44861,12756,37946,13424,42610,13974,14162,42304,42528,38019,14129,14323,42275,42534,14170,15293,47051,13960,13977,14324,14381,42206,42281,13015,13965,13559,13944,15204,13018,15222,15209,15202,13266,13016,47385,15206,14952,13489,3840,13947,15145,48381,46681,13514,45010,15459,14334,13263,45105,42662,42650,15799,15286,37829,42605,37948,15508,14160,42598,37951,37840,14129,42209,13523,14396,42309,44972,15223,15224,42312,15448,12895,12982,13828,13049,14833,42654,42308,13956,14848,42533,13479,13259,13472,42308,42306,38022,47052,42604,38025,14350,37843,15515,15802" showAddToCart="true"/>
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