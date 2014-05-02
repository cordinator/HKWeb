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
     <span class="gosfH1">Shoes</span>
    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="19975,19980,19985,19993,20021,20049,20058,20067,20088,20098,20153,20168,20173,20179,20193,20204,20218,20223,20228,20234,20251,20265,20275,20298,20546,20552,20582,20590,20595,20600,20755,20764,20892,20896,20927,20932,20966,20978,21975,22010,22035,22063,22107,38843,38849,38855,38861,38879,44131,44381,44134,44377,44372,39735,44151,44154,44159,47910,40222,40230,40238,47931,45615,45626,45631,45696,45725,45677,45616,45633,46785,40345,48427,48444,48470,23186,23194,23210,23219,23245,23257,23262,23271,23280,23289,23299,23309,23330,23343,23354,23366,23374,23384,23408,23414,23424,23431,23439,23446,23453,23461,23466,23471,23476,23481,23487,23497,23517,45461,23530,23532,23541,23554,23559,23572,23581,23590,24000,24211,24214,24223,24232,24242,24254,24268" showAddToCart="true"/>
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