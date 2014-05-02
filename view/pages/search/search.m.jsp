<%@ page import="com.hk.common.constants.RequestConstants"%>
<%@ page import="com.hk.web.SortingConstants"%>
<%@include file="/includes/taglibInclude.jsp"%>
<s:useActionBean beanclass="com.hk.web.action.beta.search.SearchAction"
	var="searchAction" />
<%--<c:set var="seoData" value="${brandCatalogAction.brandPage.seoContent}"/>--%>
<s:layout-render name="/templates/general.m.jsp">

	<s:layout-component name="htmlHead">
		<link rel="stylesheet" type="text/css"
			href="<hk:vhostJs/>/assets/css/pd_list.m.css" media="screen">
		<link rel="stylesheet" type="text/css"
			href="<hk:vhostJs/>/assets/css/filter.m.css" media="screen">
	</s:layout-component>

	<s:layout-component name="content">
		<%!
//update the new version at point 1 and update the previous version at point 2.
	String generateRandomString(boolean flag){
	  String random = "version1.0.0"; // for new version to be deployed
	  if(flag){
	  	  return random;
	  }else{
		  return "version1.0.0";// for previous version to retain
	  }
}
%>
		<script type="text/javascript">
      var query = "${searchAction.txtQ}";
    </script>


		<c:set var="brandSeperator" value="<%=RequestConstants.BRAND_SEP%>" />
		<c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>" />
		<c:set var="filterKeyValueSeperator"
			value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>" />
		<c:set var="versionNumber" value="<%=generateRandomString(true)%>" />

		<div class="page-hldr" id="catContainer">
			<%--         <s:layout-render name="/layouts/breadCrumbLayout.jsp" breadCrumbs="${brandCatalogAction.brandPage.breadCrumbs}"/>--%>

			<%--           <s:layout-render name="/pages/compare/variantCompareWidget.jsp"/> --%>

			<div id="filterResultSearch_H" class="page-hldr filter-result"
				style="display: none">
				<div href="javascript:void(0);" class="list_item ellip font13"
					onClick="toggleShowHide('filter-brand');">
					Categories <span></span>
				</div>
				<div id="categoryFilterView" class="filter-brand font13"
					style="display: none"></div>


				<!-- <div href="javascript:void(0);" class="list_item ellip font13"  onClick="toggleShowHide('fltr-items');">Price range<span></span></div>
                
                    <div id="priceSliderView" class="slider-cntnr">
                    
                    </div>
                  
                  <ul id="priceFilterView" class="fltr-items scroll" style="display:none">

                  </ul>
 -->
				<div id="catalogFiltersView"></div>

			</div>
			<!-- filter-result -->

			<div class="pd_list page-hldr">
				<div id="sortANDbrowse" class="refine_hldr left">
					<div class="sort_hldr left font12" onclick="togglesort(event)">Sort
						by</div>
					<div class="sort_hldr_text" style="display: none"></div>
					<a id="BrowseBySearch_H" href="javascript:void(0)"
						class="filter_hldr right font12">Browse by</a>
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
							onClick="getSortingParameters(this);">Discount: low to high</div>
						<div class="bd_btm"
							data-srt-type="<%=SortingConstants.SORT_TYPE_DESC%>"
							data-srt-by="<%=SortingConstants.SORT_BY_DISCOUNT%>"
							onClick="getSortingParameters(this);">Discount: high to low</div>
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

					<div class="load_more">
						<div id="loadMore_H" class="btn grey font13">load more</div>
					</div>

				</div>
			</div>
			<!-- pd_list -->
			<div id="bottomPager" class="pagination clr-cont cont-rht">
				<!--   <s:layout-render name="/layouts/paginationResultCount.m.jsp" paginatedBean="${brandCatalogAction}"/>
              <s:layout-render name="/layouts/pagination.m.jsp" paginatedBean="${brandCatalogAction}"/>
               -->
			</div>

		</div>
		<div class="icn-loader-large" style="display: none"></div>

	</s:layout-component>
	<s:layout-component name="scriptComponent">


		<s:layout-render
			name="/pages/hdtemplates/brandFilterRowTemplate.m.jsp" />
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

		<%--     <script type="text/javascript" src="<hk:vhostJs/>/assets/js/underscore-1.3.1.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery.history.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/backbone.js"></script>

    <script type="text/javascript"
            src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/compare/compare.js"></script>

    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalogView.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalogCore.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/bootstrap-slider.js"></script>
 --%>
		<%--       <script type="text/javascript" src="<hk:vhostJs/>/assets/js/compare/compare.js"></script> --%>
		<script type="text/javascript"
			src="<hk:vhostJs/>/assets/js/catalog/search.m.js?${versionNumber}"></script>


	</s:layout-component>
</s:layout-render>