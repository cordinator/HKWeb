<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.hk.constants.marketing.TagConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.catalog.CatalogAjaxAction" var="catalogAction"/>

<c:set var="brandSeperator" value="<%=RequestConstants.BRAND_SEP%>"/>
<c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
<c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>
<c:if test="${catalogAction.pageNo>1 && fn:length(catalogAction.variants)>0}">
<div class="row">
<div class="paginationBar span12 fnt-sz10">PAGE ${catalogAction.pageNo}</div>
</div>
</c:if>
<c:forEach items="${catalogAction.variants}" var="variant" varStatus="ctr">
    <s:layout-render name="/layouts/catalogVariantTileLayout.jsp" variant="${variant}"></s:layout-render>
</c:forEach>