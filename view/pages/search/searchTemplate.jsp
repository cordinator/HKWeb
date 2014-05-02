<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.hk.constants.marketing.TagConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.catalog.CatalogAjaxAction" var="catalogAction"/>





<c:set var="brandSeperator" value="<%=RequestConstants.BRAND_SEP%>"/>
<c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
<c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>


<s:layout-render name="/layouts/search/_filtersLayout.jsp" actionBean="${catalogAction}"></s:layout-render>
<s:layout-render name="/layouts/catalog/_productsLayout.jsp" actionBean="${catalogAction}" searchPage="${true}"></s:layout-render>



