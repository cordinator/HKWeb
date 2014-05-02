<%@ page import="com.hk.constants.marketing.EnumRemarketingConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.category.CategoryAction" var="categoryAction"/>
<c:set var="seoData" value="${categoryAction.categoryPage.seoContent}"/>
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
<s:layout-render name="/templates/general.m.jsp"
                 seoData="${seoData}"
                 canonicalUrl="${categoryAction.categoryPage.canonicalUrl}"
                 pageType="<%=EnumRemarketingConstants.CATEGORY.getPageType()%>"
                 primaryCategory="${categoryAction.categoryPage.breadCrumbs[1].name}"
                 secondaryCategory="${categoryAction.categoryPage.breadCrumbs[2]!=null ? categoryAction.categoryPage.breadCrumbs[2].name: ''}"
                 tertiaryCategory="${categoryAction.categoryPage.breadCrumbs[3]!=null ? categoryAction.categoryPage.breadCrumbs[3].name: ''}"
    >
    
    <s:layout-component name="htmlHead">
  <link rel="stylesheet" type="text/css" href="<hk:vhostJs/>/assets/css/pd_list.m.css"
        media="screen">
        <link rel="stylesheet" type="text/css" href="<hk:vhostJs/>/assets/css/filter.m.css"
        media="screen">
</s:layout-component>

  <s:layout-component name="content">
    <c:set var="variantGroupList" value="${categoryAction.categoryPage.variantHeaders}"/>
    <c:set var="categoryHeaderList" value="${categoryAction.categoryPage.categoryHeaders}"/>

      <h2 id="heading category page" class="pd_heading left font14 semi_bold">
         <c:if test="${seoData.h1 != null}">
            ${seoData.h1}        
        </c:if>        
       </h2>
       
       <div class="page-hldr filter_hldr">
       	
			<div class="page-hldr">
				<div class="font13 ">
										
					<c:set var="menuNode" value="${categoryAction.categoryPage.categoryMenuNodes}"/>
                  <c:forEach items="${menuNode}" var="l1child">
                      <a href="javascript:void(0);" class="list_item ellip" onclick="togglehomeMenu1('${fn:replace(l1child.name,' ','_')}');">${l1child.name} <span></span></a>
                      <c:set var="maxLeafElms" value="4"/>
                      <c:set var="leafElms"
                             value="${fn:length(l1child.childNodes)>maxLeafElms?maxLeafElms:fn:length(l1child.childNodes)}"/>
                      <c:set var="seeMore"
                             value="${fn:length(l1child.childNodes)>maxLeafElms?'true':'false'}"/>
           					<div class="filter-brand ${fn:replace(l1child.name,' ','_')}" style="display: none;">
                        <c:forEach items="${l1child.childNodes}" var="l2child" end="${leafElms}"
                                   varStatus="counter">
                          
                          <a href="${l2child.url}"
                             class="list_item1 bd_btm">${l2child.name}</a>
                          <c:if test="${counter.last && seeMore}">
                            
                            
                            <a href="${l1child.url}" class="list_item1 bd_btm">See All &raquo;</a>
                          </c:if>
                          
                        </c:forEach>
                        </div>
            
                  </c:forEach>
			    </div>


			</div>
			
			