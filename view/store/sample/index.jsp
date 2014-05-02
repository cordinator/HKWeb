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
    <s:layout-render name="/store/onetouch/onetouchHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">
    <div class="container clearfix topBanner">
      <div class="bnr-main-cnt">
        <img src="<hk:vhostImage/>/store/sample/images/onetouch-banner.jpg" style="max-width:960px;" alt="One Touch">
      </div>
    </div>

  </s:layout-component>

  <s:layout-component name="msContent">
    <s:layout-render name="/store/msCatalogLayout.jsp" vid = "6858,6675,6705,6829,6676,6833,6698,6830,6859,6832,6831" showAddToCart="true"/>
  </s:layout-component>


  <s:layout-component name="msFooter">
    <s:layout-render name="/store/onetouch/onetouchFooter.jsp"/>
  </s:layout-component>

  <s:layout-component name="msScriptComponent">
    <script>
      $(document).ready(function () {

      });

    </script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
  </s:layout-component>
</s:layout-render>