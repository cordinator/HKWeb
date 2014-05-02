<%@ page import="com.hk.common.constants.RequestConstants"%>
<%@ page import="com.hk.constants.marketing.TagConstants"%>
<%@ page import="com.hk.web.SortingConstants"%>
<%@ page import="com.hk.web.filter.WebContext"%>
<%@ page import="com.shiro.PrincipalImpl"%>
<%@ page import="org.apache.shiro.SecurityUtils"%>
<%@include file="/includes/taglibInclude.jsp"%>
<s:useActionBean
	beanclass="com.hk.web.action.beta.catalog.CatalogActionNew"
	var="catalogAction" />
<c:set var="seoData" value="${catalogAction.catalogPage.seoContent}" />



<s:layout-render name="/templates/general.m.jsp" seoData="${seoData}"
	canonicalUrl="${catalogAction.catalogPage.canonicalUrl}"
	pageType="<%=TagConstants.PageType.MENU_LANDING%>"
	primaryMenu="${catalogAction.catalogPage.breadCrumbs[1].name}"
	secondaryMenu="${catalogAction.catalogPage.breadCrumbs[2]!=null ? catalogAction.catalogPage.breadCrumbs[2].name : ''}"
	tertiaryMenu="${catalogAction.catalogPage.breadCrumbs[3]!=null ? catalogAction.catalogPage.breadCrumbs[3].name : ''}"
	quaternaryMenu="${catalogAction.catalogPage.breadCrumbs[4]!=null ? catalogAction.catalogPage.breadCrumbs[4].name : ''}"
	breadCrumbs="${catalogAction.catalogPage.breadCrumbs}"
	categoryBrowseNodeList="${catalogAction.categoryBrowseNodeList}"
	navKey="${catalogAction.catalogPage.canonicalUrlIdentifiers.navKey}"
  cTagList="${catalogAction.catalogPage.categoryTagList}"
  bTagList="${catalogAction.catalogPage.brandTagList}"
    >
	<s:layout-component name="htmlHead">
		<link rel="stylesheet" type="text/css"
			href="<hk:vhostCss/>/assets/css/pd_list.m.css" media="screen">
		<link rel="stylesheet" type="text/css"
			href="<hk:vhostCss/>/assets/css/filter.m.css" media="screen">			
		<link rel="stylesheet" type="text/css"
			href="<hk:vhostCss/>/assets/css/no-ui-slider.m.css" media="screen">
			<script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript"
			src="<hk:vhostJs/>/assets/js/no-ui-slider.m.js"></script>
			<script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/common.m.js"></script> 
	</s:layout-component>
	<%
  boolean isSecure = WebContext.isSecure();
  pageContext.setAttribute("isSecure", isSecure);
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
	<s:layout-component name="content">
		<script type="text/javascript">
  var navKey = "${catalogAction.navKey}";
  var catPrefixStr = "${catalogAction.catPrefix}";
  var filterString = "${catalogAction.fl}";
  var maxPrice = "${catalogAction.priceRange.maxPrice}";
  var minPrice = "${catalogAction.priceRange.minPrice}";  
</script>

		<div class="mainContainer">
			<c:set var="brandSeperator" value="<%=RequestConstants.BRAND_SEP%>" />
			<c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>" />
			<c:set var="filterKeyValueSeperator"
				value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>" />
			<c:set var="versionNumber" value="<%=generateRandomString(true)%>" />
			<c:if test="${seoData.h1 != null}">
				<h2 class="pd_heading left font14 semi_bold">${seoData.h1}</h2>
			</c:if>

			<div class="page-hldr filter-result" style="display: none;">
				<div class="refine_hldr left font12">
					<div class="filter_hldr left blue_text">Filter by</div>
					<a class="btn grey right filter" id="cancel-all"> Cancel </a> <a
						class="btn grey right filter" id="refresh-all"> Reset </a>
					<div class="btn blue right filter">Apply</div>
				</div>
				<div href="javascript:void(0);" class="list_item ellip font13"
					style="cursor: pointer" onClick="toggleShowHide('Brand1');">
					Brand <span class="check_filter" id="Brand"></span>
				</div>
				<div id="Brand1" class="filter-brand font13 Brand hide_H"
					style="display: none">
					<c:forEach items="${catalogAction.brandListingItems}" var="brand"
						varStatus="loop">
						<c:choose>
							<c:when test="${brand.selected}">
								<div event="filterByBrand" href="javascript:return false;"
									class="filter-brand list_item1 bd_btm"
									onClick="javascript:checkBox('anchorDivBrand_${loop.index}');formClickEventArrayBrand('anchorDivBrand_${loop.index}');updateFilterValues('anchorDivBrand_${loop.index}','Brand1');">
									<input filterNot="Brand" checked="checked" type="checkbox"
										name="${brand.brandId}" value="${brand.brandId}"
										class="left seeCheck_H anchorDivBrand_${loop.index}" onClick="javascript:checkBox('anchorDivBrand_${loop.index}');" /> <span
										class="left">${brand.brandName}</span> <span class="right">(${brand.noOfVariants})</span>
									<div class="clear"></div>
								</div>
							</c:when>
							<c:otherwise>
								<div href="javascript:return false;" event="filterByBrand"
									class="sel-brand list_item1 bd_btm"
									onClick="javascript:checkBox('anchorDivBrand_${loop.index}');formClickEventArrayBrand('anchorDivBrand_${loop.index}');updateFilterValues('anchorDivBrand_${loop.index}','Brand1');">
									<input filterNot="Brand" type="checkbox"
										name="${brand.brandId}" value="${brand.brandId}"
										class="left seeCheck_H anchorDivBrand_${loop.index}" onClick="javascript:checkBox('anchorDivBrand_${loop.index}');" /> <span
										class="left">${brand.brandName}</span> <span class="right">(${brand.noOfVariants})</span>
									<div class="clear"></div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<div href="javascript:void(0);" class="list_item ellip font13"
					style="cursor: pointer" onClick="toggleShowHide('PriceRange');">
					Price Range <span class="check_filter" id="Price Range"></span>
				</div>
				<div id="PriceRange" class="filter-price font13 PriceRange hide_H"
					style="display: none">
					<%-- <ul id="priceFilterView" class="fltr-items scroll">
            <c:set var="priceDivide"
                   value="${(catalogAction.priceRange.maxPrice - catalogAction.priceRange.minPrice)/4}"/>
            <c:forEach var="i" begin="1" end="4">

              <div href="javascript:void(0);">
                Filter under ${catalogAction.priceRange.minPrice + priceDivide*i}
               
              </div>
              <br/>
            </c:forEach>
          </ul> --%>

					<div style="height: 40px; width: 90%; margin: 0 5%;">


						<span id="exTO" class="slider-input">${catalogAction.priceRange.minPrice}</span>
						<span id="exFR" class="slider-input">${catalogAction.priceRange.maxPrice}</span>

					</div>
					<div class="noUiSlider"></div>
					<input type="text" id="value-input-min" hidden /> <input
						type="text" id="value-input-max" hidden />

				</div>
				<!-- filter-price -->
				<div id="filterWrapper">
					<c:forEach items="${catalogAction.categoryFilters}" var="filter"
						varStatus="loop_out">
						<c:if test="${fn:length(filter.filterValues) > 0}">
							<!--This is to make sure that only filter names with values should appear  -->
							<div href="javascript:void(0);" class="list_item ellip font13"
								style="cursor: pointer"
								onClick="toggleShowHide('${fn:replace(filter.filterName,' ','_')}ID');">
								${filter.filterName}<span class="check_filter"
									id="${filter.filterName}"></span>
							</div>
							<div class="filter-list font13 hide_H "
								id="${fn:replace(filter.filterName,' ','_')}ID"
								style="display: none">
								<c:forEach items="${filter.filterValues}" var="filterValue"
									varStatus="loop">
									<c:choose>
										<c:when test="${filterValue.selected}">
											<div event="filterByAttr" class="list_item1 bd_btm"
												onClick="javascript:checkBox('anchorDiv_${loop.index}${loop_out.index}');formClickEventArrayFilter('anchorDiv_${loop.index}${loop_out.index}');updateFilterValues('anchorDiv_${loop.index}${loop_out.index}','${fn:replace(filter.filterName,' ','_')}ID');">
												<input filterNot="${filter.filterName}" checked="checked"
													class="filterChk left seeCheck_H anchorDiv_${loop.index}${loop_out.index}"
													id="${filter.name}"
													name=" ${filter.name}#:${filterValue.filterValue}"
													value="${filterValue.value}" type="checkbox" onClick="javascript:checkBox('anchorDiv_${loop.index}${loop_out.index}');" /> <span
													class="left">${filterValue.value}</span> <span
													class="right">(${filterValue.noOfVariants})</span>
												<div class="clear"></div>
											</div>
										</c:when>
										<c:otherwise>
											<div event="filterByAttr" class="list_item1 bd_btm"
												onClick="javascript:checkBox('anchorDiv_${loop.index}${loop_out.index}');formClickEventArrayFilter('anchorDiv_${loop.index}${loop_out.index}');updateFilterValues('anchorDiv_${loop.index}${loop_out.index}','${fn:replace(filter.filterName,' ','_')}ID');">
												<input filterNot="${filter.filterName}"
													class="filterChk left seeCheck_H anchorDiv_${loop.index}${loop_out.index}"
													id="${filter.name}"
													name=" ${filter.name}#:${filterValue.filterValue}"
													value="${filterValue.value}" type="checkbox" onClick="javascript:checkBox('anchorDiv_${loop.index}${loop_out.index}');" /> <span
													class="left">${filterValue.value}</span> <span
													class="right">(${filterValue.noOfVariants})</span>
												<div class="clear"></div>
											</div>
										</c:otherwise>
									</c:choose>

								</c:forEach>

							</div>
						</c:if>
					</c:forEach>
				</div>

			</div>
			<!-- filter-result -->
			<div class="row " id="catContainer">


				<div class="pd_list page-hldr">
					<div id="sortANDfilter" class="refine_hldr left">
						<div class="sort_hldr left font12" onclick="togglesort(event)">Sort
							by</div>
						<div class="sort_hldr_text" style="display: none"></div>
						<a href="javascript:void(0)" class="filter_hldr right font12">Filter
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

						<div class="load_more">
							<div class="btn grey font13">load more</div>
						</div>

					</div>
				</div>



				<div class="span12 prdct-dtls-blck ">

					<div class="sort-cntnr">
						<div class="filter-itms-cntnr">
							<span id="filteredByTextView"></span> <span
								id="filteredByBrandView"></span> <span id="filteredByAttrView"></span>

						</div>
						<!-- <div class="pag-cntnr">
      <div class="cont-rht">
        <div id="topPager"></div>
      </div>
    </div> -->
					</div>

					<%--<s:layout-render--%>
					<%--name="/layouts/embed/remarketingWithCustomParams.jsp"--%>
					<%--pageType="<%=EnumRemarketingConstants.MENU_LANDING.getPageType()%>"--%>
					<%--primaryMenu="${catalogAction.catalogPage.breadCrumbs[1].name}"--%>
					<%--secondaryMenu="${catalogAction.catalogPage.breadCrumbs[2]!=null ? catalogAction.catalogPage.breadCrumbs[2].name : ''}"--%>
					<%--tertiaryMenu="${catalogAction.catalogPage.breadCrumbs[3]!=null ? catalogAction.catalogPage.breadCrumbs[3].name : ''}"--%>
					<%--gender="${gender}"--%>
					<%--orderCount="${orderCount}"--%>
					<%--/>--%>
					<%--<c:if test="${not isSecure }">--%>
					<%--<iframe--%>
					<%--src="http://www.vizury.com/analyze/analyze.php?account_id=VIZVRM112&param=e200&pid=&catid='${catalogAction.catalogPage.breadCrumbs[1].name}'&subcat1id='${catalogAction.catalogPage.breadCrumbs[2]!=null ? catalogAction.catalogPage.breadCrumbs[2].name : ''}'&subcat2id='${catalogAction.catalogPage.breadCrumbs[3]!=null ? catalogAction.catalogPage.breadCrumbs[3].name : ''}'&section=1&level=1&uid=${user_hash}"--%>
					<%--scrolling="no" width="1" height="1" marginheight="0" marginwidth="0"--%>
					<%--frameborder="0"></iframe>--%>
					<%--</c:if>--%>
					<div id="bottomPager" class="pagination clr-cont cont-rht">
						<s:layout-render name="/layouts/paginationResultCount.m.jsp"
							paginatedBean="${catalogAction}" />
						<s:layout-render name="/layouts/pagination.m.jsp"
							paginatedBean="${catalogAction}" />
					</div>
				</div>
			</div>
		</div>

		<div class="icn-loader-large" style="display: none"></div>
		<script type="text/javascript">
$(".noUiSlider").noUiSlider({
 range: [minPrice, maxPrice]
,start: [minPrice, maxPrice]
,handles: 2
,step: 10
,margin: 20
,connect: true
,direction: 'rtl'
,orientation: 'horizontal'
,behaviour: 'tap-drag'
, slide:function()
{	
	//deselecting price range checkbox		
	 var a =document.querySelectorAll('.range');
	 /* for(var i=0;i<a.length;i++)
	{
		document.getElementsByClassName('range')[i].checked = false;
	}  */

	var value = $(this).val();
	 var from = value[0];
	 var to = value[1];
	    $("#exTO").text(value[0]);
		$("#exFR").text(value[1]);
	document.getElementById('value-input-min').value = from;
	document.getElementById('value-input-max').value = to; 
	
	
	 
	var left = $($(".noUiSlider").find("a")[0]).offset().left;
	var right = $($(".noUiSlider").find("a")[1]).offset().left;
	var width = $(".noUiSlider").width(); 
	
	 if((right - left) > 100)
	{
		$("#exTO").css({
			left: ((left/width * 100)) + '%'
		});
		$("#exFR").css({
			left: ((right/width * 100)-8) + '%'
		})	
	} 
	 formClickEventArrayPrice();
}

  });
if(sessionStorage.val != undefined){
	document.getElementsByClassName('search')[0].value = sessionStorage.val;
	}else{
		document.getElementsByClassName('search')[0].value = "";
	}
</script>

	</s:layout-component>
	<s:layout-component name="scriptComponent">
		<script type="text/javascript"
			src="<hk:vhostJs/>/assets/js/catalog/catalog.m.js?${versionNumber}"></script>
	</s:layout-component>
</s:layout-render>