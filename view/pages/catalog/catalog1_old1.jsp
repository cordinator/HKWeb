<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@ page import="com.hk.constants.marketing.TagConstants" %>
<%@ page import="com.hk.web.SortingConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.catalog.CatalogActionNew" var="catalogAction"/>
<c:set var="seoData" value="${catalogAction.catalogPage.seoContent}"/>


<s:layout-render name="/templates/general.jsp"
                 seoData="${seoData}"
                 canonicalUrl="${catalogAction.catalogPage.canonicalUrl}"
                 pageType="<%=TagConstants.PageType.MENU_LANDING%>"
                 primaryMenu="${catalogAction.catalogPage.breadCrumbs[1].name}"
                 secondaryMenu="${catalogAction.catalogPage.breadCrumbs[2]!=null ? catalogAction.catalogPage.breadCrumbs[2].name : ''}"
                 tertiaryMenu="${catalogAction.catalogPage.breadCrumbs[3]!=null ? catalogAction.catalogPage.breadCrumbs[3].name : ''}"
                 quaternaryMenu="${catalogAction.catalogPage.breadCrumbs[4]!=null ? catalogAction.catalogPage.breadCrumbs[4].name : ''}"
                 breadCrumbs="${catalogAction.catalogPage.breadCrumbs}"
                 categoryBrowseNodeList="${catalogAction.categoryBrowseNodeList}"
                 navKey="${catalogAction.catalogPage.canonicalUrlIdentifiers.navKey}"
    >
<%
  boolean isSecure = WebContext.isSecure();
  pageContext.setAttribute("isSecure", isSecure);
%>
<s:layout-component name="content">


<div class="mainContainer">
<c:set var="brandSeperator" value="<%=RequestConstants.BRAND_SEP%>"/>
<c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
<c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>

<div class="container clearfix topBanner">
  <s:layout-render name="/layouts/breadCrumbLayout.jsp" breadCrumbs="${catalogAction.catalogPage.breadCrumbs}"/>

  <div class="clearfix">
    <s:layout-render name="/layouts/bannerLayout.jsp" pageBanners="${catalogAction.catalogPage.pageBannerList}"/>
  </div>
</div>


<div class="container clearfix">

<c:if test="${seoData.h1 != null}">
  <div class="ttl-cntnr">
    <span class="icn icn-sqre "></span>

    <h1 class="">${seoData.h1}</h1>
    <span class="icn icn-sqre"></span>
  </div>
</c:if>
<s:layout-render name="/pages/compare/variantCompareWidget.jsp"/>
<div class="row " id="catContainer">
<div class="span4 ">

  <div class="fltr-box-cont no-brdr">
    <div class="hdr1">
      browse by
    </div>
    <ul class="fltr-menu">
      <c:forEach items="${catalogAction.categoryBrowseNodeList}" var="categoryBrowseNode">
        <li class="">
        <span class="collapsible-hdr">
          <span class="icn icn-collapse"></span>
        </span>
          <a href="${categoryBrowseNode.url}"
             class="gm-mc-nm">${categoryBrowseNode.name}</a>
          <ul class="collapsible-cntnt">
            <c:forEach items="${categoryBrowseNode.children}" var="l1child">
              <li class="">
                <a href="${l1child.url}" class="gm-mc-nm">${l1child.name}</a>
                <ul class="">
                  <c:forEach items="${l1child.children}" var="l2child">
                    <li class="">
                      <a href="${l2child.url}" class="gm-mc-nm">${l2child.name}</a>
                      <ul class="">
                        <c:forEach items="${l2child.children}" var="l3child">
                          <li class="">
                            <a href="${l3child.url}"
                               class="gm-mc-nm">${l3child.name}</a>
                              <ul class="">
                                  <c:forEach items="${l3child.children}" var="l4child">
                                      <li class="">
                                          <a href="${l4child.url}"
                                             class="gm-mc-nm">${l4child.name}</a>
                                      </li>
                                  </c:forEach>
                              </ul>
                          </li>
                        </c:forEach>
                      </ul>
                    </li>
                  </c:forEach>
                </ul>
              </li>
            </c:forEach>
          </ul>
        </li>
      </c:forEach>
    </ul>
  </div>

  <div id="accordion">
    <div class="brwse-cont">
      Filter by
      <span id="refresh-all">Reset all</span>
    </div>

    <div class="fltr-box-cont">
      <div class="hdr2">
      <span class="collapsible-hdr">
        <span class="icn icn-collapse"></span>
      </span>
        Brand
      </div>
      <div class="collapsible-cntnt">
        <div class="head-sec">
          <div class="fltr-inpt-box">
            <input id="search-brands" type="text" placeholder="Search by Brand" autocomplete="off"/>
            <span class=" icn icn-search icn-search-img"></span>
          </div>
        </div>
        <ul id="brandFilterView" class="fltr-items scroll">
          <noscript>
            <c:forEach items="${catalogAction.brandListingItems}" var="brand">
              <c:choose>
                <c:when test="${brand.selected}">
                  <s:link event="filterByBrand" href="${catalogAction.finalSlug}" class="sel-brand">
                    <input checked="checked" type="checkbox" value="${brand.brandId}"/>
                    <s:param name="currBrandId" value="${brand.brandId}"/>
                    <s:param name="catPrefix" value="${catalogAction.catPrefix}"/>
                    <s:param name="navKey" value="${catalogAction.navKey}"/>
                    <%--<s:param name="selectedBrands" value="${catalogAction.selectedBrands}"/>--%>
                    <s:param name="brands" value="${catalogAction.brands}"/>
                    <s:param name="fl" value="${catalogAction.fl}"/>
                    ${brand.brandName} (${brand.noOfVariants})
                  </s:link>
                </c:when>
                <c:otherwise>
                  <s:link href="${catalogAction.finalSlug}" event="filterByBrand" class="sel-brand">
                    <input type="checkbox" value="${brand.brandId}"/>
                    <s:param name="currBrandId" value="${brand.brandId}"/>
                    <s:param name="catPrefix" value="${catalogAction.catPrefix}"/>
                    <s:param name="navKey" value="${catalogAction.navKey}"/>
                    <%--<s:param name="selectedBrands" value="${catalogAction.selectedBrands}"/>--%>
                    <s:param name="brands" value="${catalogAction.brands}"/>
                    <s:param name="fl" value="${catalogAction.fl}"/>
                    ${brand.brandName} (${brand.noOfVariants})
                  </s:link>
                </c:otherwise>
              </c:choose>
              <div class="clear"></div>
            </c:forEach>
          </noscript>
        </ul>
      </div>
    </div>

    <div class="fltr-box-cont clr-cont">
      <div class="hdr2 ">
      <span class="collapsible-hdr">
        <span class="icn icn-collapse"></span>
      </span>
        Price range
      </div>
      <div class="collapsible-cntnt">
        <div class="head-sec">
          <div id="priceSliderView" class="slider-cntnr"></div>
        </div>
        <noscript>
          <ul id="priceFilterView" class="fltr-items scroll">
            <c:set var="priceDivide"
                   value="${(catalogAction.priceRange.maxPrice - catalogAction.priceRange.minPrice)/4}"/>
            <c:forEach var="i" begin="1" end="4">

              <s:link href="${catalogAction.finalSlug}">
                Filter under ${catalogAction.priceRange.minPrice + priceDivide*i}
                <s:param name="minPrice" value="${catalogAction.priceRange.minPrice}"/>
                <s:param name="maxPrice" value="${catalogAction.priceRange.minPrice + priceDivide*i}"/>
                <s:param name="brands" value="${catalogAction.brands}"/>
                <s:param name="navKey" value="${catalogAction.navKey}"/>
                <s:param name="catPrefix" value="${catalogAction.catPrefix}"/>
                <s:param name="fl" value="${catalogAction.fl}"/>
              </s:link>
              <br/>
            </c:forEach>
          </ul>
        </noscript>
      </div>
    </div>

    <div id="catalogFiltersView">
      <noscript>
        <c:forEach items="${catalogAction.categoryFilters}" var="filter">
          <div class="fltr-box-cont">
            <div class="hdr2 collapsible-hdr">${filter.filterName}
            </div>
            <div class="collapsible-cntnt">

              <ul class="fltr-items scroll">
                <c:forEach items="${filter.filterValues}" var="filterValue">
                  <li>
                    <c:choose>
                      <c:when test="${filterValue.selected}">
                        <s:link href="${catalogAction.finalSlug}" event="filterByAttr">
                          <input checked="checked" class="filterChk" type="checkbox"/>
                          <s:param name="catPrefix" value="${catalogAction.catPrefix}"/>
                          <s:param name="navKey" value="${catalogAction.navKey}"/>
                          <s:param name="brands" value="${catalogAction.brands}"/>
                          <s:param name="fl" value="${catalogAction.fl}"/>
                          <s:param name="currFilterKey" value="${filter.name}"/>
                          <s:param name="currFilterVal" value="${filterValue.filterValue}"/>
                          <span>${filterValue.value}</span>
                          <span class="cont-rht">${filterValue.noOfVariants}</span>
                        </s:link>
                      </c:when>
                      <c:otherwise>
                        <s:link href="${catalogAction.finalSlug}" event="filterByAttr">
                          <input class="filterChk" type="checkbox"/>
                          <s:param name="catPrefix" value="${catalogAction.catPrefix}"/>
                          <s:param name="navKey" value="${catalogAction.navKey}"/>
                          <s:param name="brands" value="${catalogAction.brands}"/>
                          <s:param name="fl" value="${catalogAction.fl}"/>
                          <s:param name="currFilterKey" value="${filter.name}"/>
                          <s:param name="currFilterVal" value="${filterValue.filterValue}"/>
                          <span class="fnt-sz10">${filterValue.value}</span>
                          <span class="cont-rht">${filterValue.noOfVariants}</span>
                        </s:link>
                      </c:otherwise>
                    </c:choose>
                  </li>
                </c:forEach>
              </ul>
            </div>
          </div>
        </c:forEach>
      </noscript>
    </div>
  </div>
</div>
<div class="span12 prdct-dtls-blck ">

  <div class="sort-cntnr">
    <div class="filter-itms-cntnr">
      <span id="filteredByTextView"></span>
      <span id="filteredByBrandView"></span>
      <span id="filteredByAttrView"></span>

    </div>
    <div class="pag-cntnr">
      <div class="cont-lft">
        Sort by:
        <select name="sortByVariants" id="sortByVariants">
          <option value="">- Select One -</option>
          <option value="popularity" selected="selected" data-srt-type="<%=SortingConstants.DEFAULT_SORT_TYPE%>"
                  data-srt-by="<%=SortingConstants.DEFAULT_SORT_BY%>">Popularity
          </option>
          <option value="priceLH" data-srt-type="<%=SortingConstants.DEFAULT_SORT_TYPE%>"
                  data-srt-by="<%=SortingConstants.SORT_BY_PRICE%>">Price -- Low to High
          </option>
          <option value="priceHL" data-srt-type="<%=SortingConstants.SORT_TYPE_DESC%>"
                  data-srt-by="<%=SortingConstants.SORT_BY_PRICE%>">Price -- High to Low
          </option>                     
          <option value="discLH" data-srt-type="<%=SortingConstants.DEFAULT_SORT_TYPE%>"
                  data-srt-by="<%=SortingConstants.SORT_BY_DISCOUNT%>">Discount -- Low to High
          </option>
          <option value="discHL" data-srt-type="<%=SortingConstants.SORT_TYPE_DESC%>"
                  data-srt-by="<%=SortingConstants.SORT_BY_DISCOUNT%>">Discount -- High to Low
          </option>
          <option value="rtngLH" data-srt-type="<%=SortingConstants.DEFAULT_SORT_TYPE%>"
                  data-srt-by="<%=SortingConstants.SORT_BY_RATING%>">Rating -- Low to High
          </option>
          <option value="rtngHL" data-srt-type="<%=SortingConstants.SORT_TYPE_DESC%>"
                  data-srt-by="<%=SortingConstants.SORT_BY_RATING%>">Rating -- High to Low
          </option>
        </select>
      </div>
      <div class="cont-rht">
        <div id="topPager"></div>
      </div>
    </div>
  </div>
  <div id="variantResultView">
    <noscript>
      <c:forEach items="${catalogAction.variants}" var="variant" varStatus="ctr">
        <div class="varnt-cont">
          <s:link class="product-img" href="/sv${variant.urlFragment}">
            <img alt="${variant.name}" src="${variant.medImg.mlink}"
                 width="200" height="200"/>
            <s:param name="navKey" value="${variant.navKey}"/>
          </s:link>
          <div class="mrgn-t-10">
            <s:link href="/sv${variant.urlFragment}">
            <span class="varnt-title">${variant.name}</span>

            <div>Rating: ${variant.rating}
            </div>
          </div>
          <s:param name="navKey" value="${variant.navKey}"/>
          </s:link>

          <div class="varnt-detail">
            <c:if test="${variant.siblingVariants > 0}">
              <div class="varnt-availble">(${variant.siblingVariants} more variants available)</div>
            </c:if>
            <div class="">
              <c:if test="${variant.discount > 0}">
                <span class="strikethrough">Rs. ${variant.mrp}</span> | <span
                  class="fnt-sz10">${variant.discount}% off</span>
              </c:if>
            </div>
            <div class="final-price">
              Rs. ${variant.offerPrice}
            </div>

          </div>
        </div>
      </c:forEach>
    </noscript>
  </div>


  <div id="bottomPager" class="pagination clr-cont cont-rht">
    <noscript>
      <s:layout-render name="/layouts/paginationResultCount.jsp" paginatedBean="${catalogAction}"/>
      <s:layout-render name="/layouts/pagination.jsp" paginatedBean="${catalogAction}"/>
    </noscript>
  </div>
</div>
</div>

<c:if test="${seoData.descriptionTitle != null}">
  <div class="container">
    <div class="row">
      <div class="span16  brdr-t-sd pad-t-10">
        <h2>${seoData.descriptionTitle}</h2>

        <div class="vds mrgn-t-10">${seoData.description}</div>

      </div>
    </div>
  </div>
</c:if>
</div>

</div>

</s:layout-component>
<s:layout-component name="scriptComponent">
  <script type="text/javascript">
    var navKey = "${catalogAction.navKey}";
  </script>
  <s:layout-render name="/pages/hdtemplates/brandFilterRowTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/catalogFilterTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/filteredByAttrViewTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/filteredByBrandViewTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/pagerCountTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/pagerTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/pagerCountTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/priceSliderViewTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/variantResultItemViewTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/filteredByTextTemplate.jsp"/>

  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/underscore-1.3.1.min.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery.history.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/backbone.min.js"></script>

  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/compare/compare.js"></script>

  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalogView.js?v=1.4"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalogCore.js?v=1.4"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalog.js?v=1.4"></script>

  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/bootstrap-slider.min.js"></script>

</s:layout-component>
</s:layout-render>