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
  <div class="container clearfix">
    <div id="logo" class="span7 offset4" >
      <div class="" >
        <div class="mrgn-t-50">
          <a href="/${pageContext.request.contextPath}" title="healthkart">
              <img src="<hk:vhostImage/>/assets/images/HK-Logo.png" alt="HealthKart" style="padding-left:19px"/>
          </a>
        </div>
      </div>

      
    </div>
    </div>
</s:layout-definition>