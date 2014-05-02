<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <%
    PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
    if (principal != null) {
      pageContext.setAttribute("userId", principal.getId());
    } else {
      pageContext.setAttribute("userId", null);
    }

    String roles = RoleConstants.HK_USER + "," + RoleConstants.HK_UNVERIFIED;

  %>
  <div class="container">

      <!--center style="font-size:36px">HEALTHKART</center><BR-->
      <div class="text-right txt-light">
          <span class="">14 day return policy</span> |
          <span class="">contact us</span> |
          Hi <shiro:principal property="firstName"/> |
          <a href="/${pageContext.request.contextPath}">Logout</a>

      </div>
      <div class="mrgn-b-10"><a href="/" ><img src="<hk:vhostImage/>/assets/images/HK-Logo.png" alt="HealthKart"/></a> </div>

    <div id="logo" class="span7 alpha">
</div>
  </div>

</s:layout-definition>