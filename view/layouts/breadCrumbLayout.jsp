<%@ page import="com.hk.api.response.ui.base.breadcrumb.BreadCrumbType" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-definition>
    <div class="hk-breadcrumb-cntnr">
  <c:set var="lastbreadCrumb" value="<%=BreadCrumbType.LAST%>"/>
  <c:if test="${breadCrumbs != null}">
    <c:forEach items="${breadCrumbs}" var="breadCrumb">
      <c:choose>
        <c:when test="${breadCrumb.type != lastbreadCrumb}">
         <span itemprop="breadcrumb" itemscope itemtype="http://schema.org/Breadcrumb">
          <a href="${breadCrumb.url}" itemprop="url">
            <span itemprop="title">${breadCrumb.name}</span>
          </a>
         </span>
        <span>&raquo;</span>
        </c:when>
        <c:otherwise>
          <span class="fnt-bold fnt-ttl">${breadCrumb.name}</span>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </c:if>
    </div>
</s:layout-definition>