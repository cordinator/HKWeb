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
            <img src="<hk:vhostImage/>/store/newyear/images/Health-Nutrition.jpg">
          </div>
        </div>
        <!--- banner close --->

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->

  <s:layout-component name="msContent">

   <div class="wrapper">
    <s:layout-render name="/store/newyear/nyCatalogLayout.jsp" vid="45166,13386,12941,12821,13184,12789,12938,13186,15873,13190,42642,45165,13955,15666,15658,44109,15673,15657,15672,13553,14481,42548,15661,42549,15662,15735,13958,45103,45102,37207,45277,15334,12960,42631,15671,46478,15737,44822,46429,45177,12864,13688,44796,15944,42643,12815,12880,14536,13745,13722,13748,15667,44803,45108,37315,42399,12911,12773,12903,12899,13925,15870,12909,12841,15697,13286,13285,12956,15341,46501,12952,13385,12955,14272,47255,13552,38066,47256,14534,13544,13006,47271,15734" showAddToCart="true"/>
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