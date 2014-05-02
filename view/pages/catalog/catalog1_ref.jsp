<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.hk.constants.marketing.TagConstants" %>
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
                 navKey="${catalogAction.navKey}"
    >
<%
  boolean isSecure = WebContext.isSecure();
  pageContext.setAttribute("isSecure", isSecure);
%>
<s:layout-component name="content">
<script type="text/javascript">
  var navKey = "${catalogAction.navKey}";
</script>

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
          <%--<s:link beanclass="com.hk.web.action.beta.catalog.CatalogActionNew" event="clickCategoryNode" class="sc-cat-nm">

          --%><%--<s:param name="clickCatPrefix" value="${categoryBrowseNode.categoryPrefix}"/>--%><%--
          <s:param name="navKey" value="${catalogAction.navKey}"/>

        </s:link>--%>
        <ul class="collapsible-cntnt">
          <c:forEach items="${categoryBrowseNode.children}" var="l1child">
            <li class="">
              <a href="${l1child.url}" class="gm-mc-nm">${l1child.name}</a>
                <%--<s:link beanclass="com.hk.web.action.beta.catalog.CatalogActionNew" event="clickCategoryNode">
                ${l1child.name}
                --%><%--<s:param name="clickCatPrefix" value="${l1child.categoryPrefix}"/>--%><%--
                <s:param name="navKey" value="${catalogAction.navKey}"/>

              </s:link>--%>
              <ul class="">
                <c:forEach items="${l1child.children}" var="l2child">
                  <li class="">
                    <a href="${l2child.url}" class="gm-mc-nm">${l2child.name}</a>
                      <%--  <s:link beanclass="com.hk.web.action.beta.catalog.CatalogActionNew" event="clickCategoryNode">
                        ${l2child.name}
                        <s:param name="clickCatPrefix" value="${l2child.categoryPrefix}"/>
                        <s:param name="navKey" value="${catalogAction.navKey}"/>

                      </s:link>--%>
                    <ul class="">
                      <c:forEach items="${l2child.children}" var="l3child">
                        <li class="">
                          <a href="${l3child.url}"
                             class="gm-mc-nm">${l3child.name}</a>
                            <%--<s:link beanclass="com.hk.web.action.beta.catalog.CatalogActionNew"
                                    event="clickCategoryNode">
                              ${l3child.name}
                              <s:param name="clickCatPrefix" value="${l3child.categoryPrefix}"/>
                              <s:param name="navKey" value="${catalogAction.navKey}"/>

                            </s:link>--%>
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
      <%--<span id="browse-all">collapse </span>--%>
    <span id="refresh-all">Reset all</span>

  </div>

  <div class="fltr-box-cont">
    <div class="hdr2">
      <span class="collapsible-hdr">
        <span class="icn icn-collapse"></span>
      </span>
      Brand

        <%--<a href="javascript:void(0)" class="clr-brands"> clear</a>--%>
    </div>
    <div class="collapsible-cntnt">
      <div class="head-sec">
        <div class="fltr-inpt-box">
          <input id="search-brands" type="text" placeholder="Search by Brand" autocomplete="off"/>
          <span class=" icn icn-search icn-search-img"></span>
        </div>
      </div>
      <ul id="brandFilterView" class="fltr-items scroll">
        <c:forEach items="${catalogAction.brandListingItems}" var="brand">
          <c:choose>
            <c:when test="${brand.selected}">
              <s:link beanclass="com.hk.web.action.beta.catalog.CatalogActionNew" event="filterByBrand"
                      class="sel-brand">
                <input checked="checked" type="checkbox" value="${brand.brandId}"/>
                <s:param name="currBrandId" value="${brand.brandId}"/>
                <%--<s:param name="clickCatPrefix" value="${catalogAction.clickCatPrefix}"/>--%>
                <s:param name="navKey" value="${catalogAction.navKey}"/>

                <s:param name="selectedBrands" value="${catalogAction.selectedBrands}"/>
                <s:param name="fl" value="${catalogAction.fl}"/>
                <%--<s:param name="minPrice" value="${catalogAction.minPrice}"/>
              <s:param name="maxPrice" value="${catalogAction.maxPrice}"/>--%>
                <%--<s:param name="selectedCatPrefix" value="${catalogAction.selectedCatPrefix}"/>
              <s:param name="filterStr" value="${catalogAction.filterStr}"/>--%>
              </s:link>
            </c:when>
            <c:otherwise>
              <s:link beanclass="com.hk.web.action.beta.catalog.CatalogActionNew" event="filterByBrand"
                      class="sel-brand">
                <input type="checkbox" value="${brand.brandId}"/>
                <s:param name="currBrandId" value="${brand.brandId}"/>

                <%--<s:param name="clickCatPrefix" value="${catalogAction.clickCatPrefix}"/>--%>
                <s:param name="navKey" value="${catalogAction.navKey}"/>
                <s:param name="selectedBrands" value="${catalogAction.selectedBrands}"/>
                <s:param name="fl" value="${catalogAction.fl}"/>
                <%--<s:param name="minPrice" value="${catalogAction.minPrice}"/>
              <s:param name="maxPrice" value="${catalogAction.maxPrice}"/>--%>
                <%--<s:param name="selectedCatPrefix" value="${catalogAction.selectedCatPrefix}"/>
              <s:param name="filterStr" value="${catalogAction.filterStr}"/>--%>
              </s:link>
            </c:otherwise>
          </c:choose>
          ${brand.brandName} (${brand.noOfVariants})
          <div class="clear"></div>
        </c:forEach>
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
        <%-- <ul id="priceFilterView" class="fltr-items scroll">
    <c:set var="priceDivide"
           value="${(catalogAction.priceRange.maxPrice - catalogAction.priceRange.minPrice)/4}"/>
    <c:forEach var="i" begin="1" end="4">
      <s:link beanclass="com.hk.web.action.beta.catalog.CatalogAction" event="filterResults">
        Filter under ${catalogAction.priceRange.minPrice + priceDivide*i}
        <s:param name="minPrice" value="${catalogAction.priceRange.minPrice}"/>
        <s:param name="maxPrice" value="${catalogAction.priceRange.minPrice + priceDivide*i}"/>
        --%><%--<s:param name="selectedCatPrefix" value="${catalogAction.selectedCatPrefix}"/>
          <s:param name="brandStr" value="${catalogAction.brandStr}"/>
          <s:param name="filterStr" value="${catalogAction.filterStr}"/>--%><%--
          </s:link>
          <br/>
        </c:forEach>
      </ul>--%>
    </div>
  </div>

  <div id="catalogFiltersView">
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
                    <s:link beanclass="com.hk.web.action.beta.catalog.CatalogActionNew" event="filterByAttr">
                      <input checked="checked" class="filterChk" type="checkbox"/>
                      <s:param name="currFilterKey" value="${filter.name}"/>
                      <s:param name="currFilterVal" value="${filterValue.filterValue}"/>
                      <%--<s:param name="clickCatPrefix" value="${catalogAction.clickCatPrefix}"/>--%>
                      <s:param name="navKey" value="${catalogAction.navKey}"/>

                      <s:param name="selectedBrands" value="${catalogAction.selectedBrands}"/>
                      <s:param name="fl" value="${catalogAction.fl}"/>
                      <span>${filterValue.value}</span>
                      <span class="cont-rht">${filterValue.noOfVariants}</span>
                    </s:link>
                  </c:when>
                  <c:otherwise>
                    <s:link beanclass="com.hk.web.action.beta.catalog.CatalogActionNew" event="filterByAttr">
                      <input class="filterChk" type="checkbox"/>
                      <s:param name="currFilterKey" value="${filter.name}"/>
                      <s:param name="currFilterVal" value="${filterValue.filterValue}"/>
                      <%--<s:param name="clickCatPrefix" value="${catalogAction.clickCatPrefix}"/>--%>
                      <s:param name="navKey" value="${catalogAction.navKey}"/>

                      <s:param name="selectedBrands" value="${catalogAction.selectedBrands}"/>
                      <s:param name="fl" value="${catalogAction.fl}"/>
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
        <%--  <div class="cont-lft">
          Sort by
          <select>
            <option value="">- Select One -</option>
            <option value="1">Price</option>
            <option value="2">Brand</option>
            <option value="3">Size</option>
          </select>
        </div>--%>
      <div class="cont-rht">
        <div id="topPager"></div>
      </div>
    </div>
  </div>
  <div id="variantResultView">

    <c:forEach items="${catalogAction.variants}" var="variant" varStatus="ctr">
      <div class="varnt-cont">
        <s:link beanclass="com.hk.web.action.beta.variant.StoreVariantAction" class="product-img" event="pre">
          <img alt="${variant.name}" src="${variant.medImg.mlink}"
               width="200" height="200"/>
        </s:link>
        <div class="mrgn-t-10">
          <s:link beanclass="com.hk.web.action.beta.variant.StoreVariantAction" event="pre">
          <span class="varnt-title">${variant.name}</span>

          <div>Rating: ${variant.rating}
          </div>
        </div>
        <s:param name="storeVariantId" value="${variant.id}"/>
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
    <s:layout-render name="/layouts/paginationResultCount.jsp" paginatedBean="${catalogAction}"/>
    <s:layout-render name="/layouts/pagination.jsp" paginatedBean="${catalogAction}"/>
  </div>
</div>
</div>
</div>

</div>

</s:layout-component>
<s:layout-component name="scriptComponent">

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

  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/underscore-1.3.1.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery.history.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/backbone.js"></script>

  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/compare/compare.js"></script>

  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalogView.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalogCore.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalog.js"></script>

  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/bootstrap-slider.js"></script>

</s:layout-component>
</s:layout-render>