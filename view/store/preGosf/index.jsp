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
    <s:layout-render name="/store/preGosf/preGosfHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">
    <div class="gosfBanner">
    <div class="wrapper">
    <img src="<hk:vhostImage/>/assets/images/gosf/preGosfBanner.jpg"> </div>  </div>
    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
   <div class="wrapper">
     <span class="gosfH1">Beauty</span>
    <s:layout-render name="/store/preGosf/gosfCatalogLayout.jsp" vid="11683,11679,11680,46458,46241,46463,35408,42894,6012,248,42895,247,252,10025,48201" showAddToCart="true"/>



     <span class="gosfH1">Sports Nutrition</span>
     <s:layout-render name="/store/preGosf/gosfCatalogLayout.jsp" vid="15817,15226,15003,42296,37943,15801,15462,13256,13257,13177" showAddToCart="true"/>






     <span class="gosfH1">Health Nutrition</span>
     <s:layout-render name="/store/preGosf/gosfCatalogLayout.jsp" vid="12941,14425,15163,13576,42555,37857,15873,38085,45108,14431" showAddToCart="true"/>




     <span class="gosfH1">Health Devices</span>
     <s:layout-render name="/store/preGosf/gosfCatalogLayout.jsp" vid="18752,3938,9867,10395,7016,24559,16679,16681,16688,40991,43488,10393,43484,10092,9865,37117,10781,18492,9856" showAddToCart="true"/>





     <span class="gosfH1">Diabetes</span>
     <s:layout-render name="/store/preGosf/gosfCatalogLayout.jsp" vid="6731,6729,6730,6887,6827,16690,36312,36311,6733,6854,6828,6821,6701,43461,37204,37355,6716,13394,41008" showAddToCart="true"/>



     <span class="gosfH1">Personal Care</span>
     <s:layout-render name="/store/preGosf/gosfCatalogLayout.jsp" vid="17605,17523,17522,37815,37429,37764,6938" showAddToCart="true"/>





     <span class="gosfH1">Parenting</span>
     <s:layout-render name="/store/preGosf/gosfCatalogLayout.jsp" vid="36079,36010,44542,1739,2865,2546,46881,45095,2725" showAddToCart="true"/>



     <span class="gosfH1">Eye</span>
     <s:layout-render name="/store/preGosf/gosfCatalogLayout.jsp" vid="7672,8126,33283,7568,7570,36616,7850,7851,7680,32984,8497,8541,36629,47454,33272,36741,36650,36658,36763" showAddToCart="true"/>








   </div>
  </s:layout-component>

  <s:layout-component name="msFooter">
    <s:layout-render name="/store/preGosf/preGosfFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>