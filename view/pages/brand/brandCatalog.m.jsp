<%@ page import="com.hk.common.constants.RequestConstants"%>
<%@ page import="com.hk.constants.marketing.TagConstants"%>
<%@ page import="com.hk.web.SortingConstants"%>
<%@ page import="com.hk.web.filter.WebContext"%>
<%@ page import="com.shiro.PrincipalImpl"%>
<%@ page import="org.apache.shiro.SecurityUtils"%>
<%@include file="/includes/taglibInclude.jsp"%>
<s:useActionBean
	beanclass="com.hk.web.action.beta.brand.BrandCatalogAction"
	var="brandCatalogAction" />
<c:set var="seoData" value="${brandCatalogAction.brandPage.seoContent}" />
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
<%!
//update the new version at point 1 and update the previous version at point 2.
	String generateRandomString(boolean flag){
	  String random = "version1.0.0"; // 1
	  if(flag){
	  	  return random;
	  }else{
		  return "version1.0.0";// 2
	  }
}
%>
<s:layout-render name="/templates/general.m.jsp" seoData="${seoData}"
	canonicalUrl="${brandCatalogAction.brandPage.canonicalUrl}"
	pageType="<%=TagConstants.PageType.BRAND_CATALOG%>"
	primaryCategory="${brandCatalogAction.brandPage.breadCrumbs[1].name}"
	secondaryCategory="${brandCatalogAction.brandPage.breadCrumbs[2]!=null ? brandCatalogAction.brandPage.breadCrumbs[2].name : ''}"
	tertiaryCategory="${brandCatalogAction.brandPage.breadCrumbs[3]!=null ? brandCatalogAction.brandPage.breadCrumbs[3].name : ''}"
	brand="${brandCatalogAction.brandPage.brandName}"
  bTags="${brandCatalogAction.brandPage.brandTag.tagList}"
    >

	<s:layout-component name="htmlHead">
		<link rel="stylesheet" type="text/css"
			href="<hk:vhostCss/>/assets/css/pd_list.m.css" media="screen">
		<link rel="stylesheet" type="text/css"
			href="<hk:vhostCss/>/assets/css/filter.m.css" media="screen">
	</s:layout-component>

	<s:layout-component name="content">
		<script type="text/javascript">
      var navKey = "${brandCatalogAction.navKey}";
    </script>

		<div class="mainContainer">
			<c:set var="brandSeperator" value="<%=RequestConstants.BRAND_SEP%>" />
			<c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>" />
			<c:set var="filterKeyValueSeperator"
				value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>" />
			<c:set var="versionNumber" value="<%=generateRandomString(true)%>"/> 

			<h2 class="pd_heading left font14 semi_bold">${seoData.h1}</h2>


			<div class="page-hldr" id="catContainer">


				<div id ="filterResult_H" class="page-hldr filter-result" style="display:none">
					<div href="javascript:void(0);" class="list_item ellip font13"
						onClick="toggleShowHide('filter-brand');">
						Categories <span></span>
					</div>

					<div id="categoryFilterView" class="filter-brand font13" style="display:none"></div>

<!-- 					<div href="javascript:void(0);" class="list_item ellip font13"
						style="cursor: pointer" onClick="toggleShowHide('fltr-items');">
						Price Range <span class="check_filter" id="Price Range"></span>
					</div>
					<div href="javascript:void(0);" class="list_item ellip font13" onClick="toggleShowHide('fltr-items');">Price range<span></span></div>

					<div id="priceFilterView" class="filter-price font13">
						<div id="priceSliderView" class="slider-cntnr"></div>

						<ul id="priceFilterView" class="fltr-items scroll">

						</ul>
					</div>
 -->

					<div id="catalogFiltersView"></div>

				</div>
				<!-- filter-result -->

				<div class="span12 ">

					<div class="sort-cntnr">
						<div class="filter-itms-cntnr">
							<span id="filteredByBrandView"></span> <span
								id="filteredByAttrView"></span>
						</div>

					</div>
					<div class="pd_list page-hldr">
						<div id="sortANDbrowse" class="refine_hldr left">
							<div class="sort_hldr left font12" onclick="togglesort(event)">Sort
								by</div>
							<div class="sort_hldr_text" style="display: none"></div>
							<a href="javascript:void(0)" id="BrowseBy" class="filter_hldr right font12">Browse
								by</a>
						</div>
						<div class="pd_listing left">
							<div class="pd_mask" onclick="togglesort(event)"
								style="display: none"></div>
							<div class="sort_menu font12" style="display: none">
								<div class="bd_btm" data-srt-type="undefined"
									data-srt-by="undefined" onClick="getSortingParameters(this);">--
									None--</div>
								<div class="bd_btm"
									data-srt-type="<%=SortingConstants.DEFAULT_SORT_TYPE%>"
									data-srt-by="<%=SortingConstants.DEFAULT_SORT_BY%>"
									onClick="getSortingParameters(this);">Popularity</div>
								<div class="bd_btm"
									data-srt-type="<%=SortingConstants.DEFAULT_SORT_TYPE%>"
									data-srt-by="<%=SortingConstants.SORT_BY_PRICE%>"
									onClick="getSortingParameters(this);">Price: low to high</div>
								<div class="bd_btm"
									data-srt-type="<%=SortingConstants.SORT_TYPE_DESC%>"
									data-srt-by="<%=SortingConstants.SORT_BY_PRICE%>"
									onClick="getSortingParameters(this);">Price: high to low</div>
								<div class="bd_btm"
									data-srt-type="<%=SortingConstants.DEFAULT_SORT_TYPE%>"
									data-srt-by="<%=SortingConstants.SORT_BY_DISCOUNT%>"
									onClick="getSortingParameters(this);">Discount: low to
									high</div>
								<div class="bd_btm"
									data-srt-type="<%=SortingConstants.SORT_TYPE_DESC%>"
									data-srt-by="<%=SortingConstants.SORT_BY_DISCOUNT%>"
									onClick="getSortingParameters(this);">Discount: high to
									low</div>
								<div class="bd_btm"
									data-srt-type="<%=SortingConstants.DEFAULT_SORT_TYPE%>"
									data-srt-by="<%=SortingConstants.SORT_BY_RATING%>"
									onClick="getSortingParameters(this);">Rating: low to high</div>
								<div class="bd_btm"
									data-srt-type="<%=SortingConstants.SORT_TYPE_DESC%>"
									data-srt-by="<%=SortingConstants.SORT_BY_RATING%>"
									onClick="getSortingParameters(this);">Rating: high to low</div>
							</div>

							<div id="variantResultView"></div>


							<div class="clear"></div>

							<div id="loadMore_H" class="load_more">
								<div class="btn grey font13">load more</div>
							</div>

						</div>
					</div>
					<div id="bottomPager" class="pagination clr-cont cont-rht">
						<%--<s:layout-render name="/layouts/paginationResultCount.jsp" paginatedBean="${brandCatalogAction}"/>
              <s:layout-render name="/layouts/pagination.jsp" paginatedBean="${brandCatalogAction}"/>--%>
					</div>
				</div>
			</div>


			<%--         <c:if test="${seoData.descriptionTitle != null}"> --%>
			<!--           <div class="container"> -->
			<!--             <div class="row"> -->
			<!--               <div class="span16 brdr-t-sd pad-t-10"> -->
			<%--                 <h2>${seoData.descriptionTitle}</h2> --%>
			<%--                 <div class="vds mrgn-t-10">${seoData.description}</div> --%>

			<!--               </div> -->
			<!--             </div> -->
			<!--           </div> -->
			<%--         </c:if> --%>


		</div>
    <div class="icn-loader-large" style="display:none"></div>
	</s:layout-component>
	<s:layout-component name="scriptComponent">

		<%--<s:layout-render--%>
		<%--name="/layouts/embed/remarketingWithCustomParams.jsp"--%>
		<%--pageType="<%=EnumRemarketingConstants.BRAND_CATALOG.getPageType()%>"--%>
		<%--primaryCategory="${brandCatalogAction.brandPage.breadCrumbs[1].name}"--%>
		<%--secondaryCategory="${brandCatalogAction.brandPage.breadCrumbs[2]!=null ? brandCatalogAction.brandPage.breadCrumbs[2].name : ''}"--%>
		<%--tertiaryCategory="${brandCatalogAction.brandPage.breadCrumbs[3]!=null ? brandCatalogAction.brandPage.breadCrumbs[3].name : ''}"--%>
		<%--gender="${gender}"--%>
		<%--orderCount="${orderCount}"--%>
		<%--brand="${brandCatalogAction.brandPage.brandName}"--%>
		<%--/>--%>
		<%--<c:if test="${not isSecure }">--%>
		<%--<iframe--%>
		<%--src="http://www.vizury.com/analyze/analyze.php?account_id=VIZVRM112&param=e200&pid=&catid='${brandCatalogAction.brandPage.breadCrumbs[1].name}'&subcat1id='${brandCatalogAction.brandPage.breadCrumbs[2]!=null ? brandCatalogAction.brandPage.breadCrumbs[2].name : ''}'&subcat2id='${brandCatalogAction.brandPage.breadCrumbs[3]!=null ? brandCatalogAction.brandPage.breadCrumbs[3].name : ''}'&section=1&level=1&uid=${user_hash}"--%>
		<%--scrolling="no" width="1" height="1" marginheight="0" marginwidth="0"--%>
		<%--frameborder="0"></iframe>--%>
		<%--</c:if>--%>

		<s:layout-render name="/pages/hdtemplates/brandFilterRowTemplate.jsp" />
		<s:layout-render
			name="/pages/hdtemplates/categoryFilterRowTemplate.m.jsp" />
		<%--<s:layout-render name="/pages/hdtemplates/catalogFilterTemplate.jsp"/>
   <s:layout-render name="/pages/hdtemplates/filteredByAttrViewTemplate.jsp"/>
   <s:layout-render name="/pages/hdtemplates/filteredByBrandViewTemplate.jsp"/>--%>
		<s:layout-render name="/pages/hdtemplates/pagerCountTemplate.jsp" />
		<s:layout-render name="/pages/hdtemplates/pagerTemplate.jsp" />
		<s:layout-render name="/pages/hdtemplates/pagerCountTemplate.jsp" />
		<s:layout-render name="/pages/hdtemplates/priceSliderViewTemplate.jsp" />
		<s:layout-render
			name="/pages/hdtemplates/variantResultItemViewTemplate.m.jsp" />

<%-- 		<script type="text/javascript"
			src="<hk:vhostJs/>/assets/js/underscore-1.3.1.js"></script>
		<script type="text/javascript"
			src="<hk:vhostJs/>/assets/js/jquery.history.js"></script>
		<script type="text/javascript"
			src="<hk:vhostJs/>/assets/js/backbone.js"></script>

		<script type="text/javascript"
			src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js"></script>
		<script type="text/javascript"
			src="<hk:vhostJs/>/assets/js/compare/compare.js"></script>
				<script type="text/javascript"
			src="<hk:vhostJs/>/assets/js/catalog/catalogView.js"></script>
		<script type="text/javascript"
			src="<hk:vhostJs/>/assets/js/catalog/catalogCore.js"></script>
		<script type="text/javascript"
			src="<hk:vhostJs/>/assets/js/bootstrap-slider.js"></script>
			
	
 --%>		<%-- <script type="text/javascript"
			src="<hk:vhostJs/>/assets/js/catalog/catalog.m.js?${versionNumber}"></script> --%>
		<script type="text/javascript"
			src="<hk:vhostJs/>/assets/js/catalog/brandCatalog.m.js?${versionNumber}"></script>

	</s:layout-component>
</s:layout-render>