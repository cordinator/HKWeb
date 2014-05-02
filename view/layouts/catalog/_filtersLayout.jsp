<%--
  Created by IntelliJ IDEA.
  User: Sunit
  Date: 9/13/13
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
    <div class="span4 ">

        <div class="fltr-box-cont no-brdr">
            <div class="hdr1">
                browse by
            </div>
            <ul class="fltr-menu">
                <c:forEach items="${actionBean.categoryBrowseNodeList}" var="categoryBrowseNode">
                    <li class="">
        <span class="collapsible-hdr">
          <span class="icn icn-collapse"></span>
        </span>
                        <a href="${categoryBrowseNode.url}"
                           class="gm-mc-nm">${categoryBrowseNode.name}</a>
                        <ul class="collapsible-cntnt">
                            <c:forEach items="${categoryBrowseNode.children}" var="l1child">
                                <li class="">
                                    <a href="${l1child.url}" class="">${l1child.name}</a>
                                    <ul class="">
                                        <c:forEach items="${l1child.children}" var="l2child">
                                            <li class="">
                                                <a href="${l2child.url}" class="">${l2child.name}</a>
                                                <ul class="">
                                                    <c:forEach items="${l2child.children}" var="l3child">
                                                        <li class="">
                                                            <a href="${l3child.url}"
                                                               class="">${l3child.name}</a>
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
                    <span class=" collapsible-hdr">
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

                        <c:forEach items="${actionBean.brandListingItems}" var="brand">
                            <li>
                            <c:set var="isDisabled" value="${brand.noOfVariants == 0 ? true : false}"/>
                            <c:choose>
                                <c:when test="${brand.selected}">
                                    <s:link event="filterByBrand" href="${actionBean.finalSlug}" class="sel-brand ${isDisabled ? 'inactive':''}">
                                        <input checked="checked" type="checkbox" value="${brand.brandId}" ${isDisabled ? 'disabled="disabled"' : ''} />
                                        <s:param name="currBrandId" value="${brand.brandId}"/>
                                        <s:param name="catPrefix" value="${actionBean.catPrefix}"/>
                                        <s:param name="navKey" value="${actionBean.navKey}"/>
                                        <%--<s:param name="selectedBrands" value="${actionBean.selectedBrands}"/>--%>
                                        <s:param name="brands" value="${actionBean.brands}"/>
                                        <s:param name="fl" value="${actionBean.fl}"/>
                                        <span class="fltr-value">${brand.brandName}</span>
                                        <span class="cont-rht">${brand.noOfVariants}</span>
                                    </s:link>
                                </c:when>
                                <c:otherwise>
                                    <s:link event="filterByBrand" href="${actionBean.finalSlug}" class="sel-brand ${isDisabled ? 'inactive':''}">
                                        <input type="checkbox" value="${brand.brandId}" ${isDisabled ? 'disabled="disabled"' : ''} />
                                        <s:param name="currBrandId" value="${brand.brandId}"/>
                                        <s:param name="catPrefix" value="${actionBean.catPrefix}"/>
                                        <s:param name="navKey" value="${actionBean.navKey}"/>
                                        <s:param name="brands" value="${actionBean.brands}"/>
                                        <s:param name="fl" value="${actionBean.fl}"/>
                                        <span class="fltr-value">${brand.brandName}</span>
                                        <span class="cont-rht">${brand.noOfVariants}</span>
                                    </s:link>
                                </c:otherwise>
                            </c:choose>
                            </li>
                        </c:forEach>

                    </ul>
                </div>
            </div>

            <div class="fltr-box-cont clr-cont">
                <div class="hdr2 ">
                  <input type=hidden name="minSelectedPrice" value="${actionBean.minPrice}"/>
                  <input type=hidden name="maxSelectedPrice" value="${actionBean.maxPrice}"/>
                  <span class="collapsible-hdr">
                    <span class="icn icn-collapse"></span>
                  </span>
                    Price range
                </div>
                <div class="collapsible-cntnt">
                    <div class="head-sec">
                        <div id="priceSliderView" class="slider-cntnr">
                            <c:set var="priceDivide"
                                   value="${(actionBean.priceRange.maxPrice - actionBean.priceRange.minPrice)/4}"/>
                            <c:forEach var="i" begin="1" end="4">

                                <s:link href="${actionBean.finalSlug}">
                                    Filter under ${actionBean.priceRange.minPrice + priceDivide*i}
                                    <s:param name="minPrice" value="${actionBean.priceRange.minPrice}"/>
                                    <s:param name="maxPrice" value="${actionBean.priceRange.minPrice + priceDivide*i}"/>
                                    <s:param name="brands" value="${actionBean.brands}"/>
                                    <s:param name="navKey" value="${actionBean.navKey}"/>
                                    <s:param name="catPrefix" value="${actionBean.catPrefix}"/>
                                    <s:param name="fl" value="${actionBean.fl}"/>
                                </s:link>
                                <br/>
                            </c:forEach>
                        </div>
                    </div>



                </div>
            </div>

            <div id="catalogFiltersView" data-role="filterGroup">

                <c:forEach items="${actionBean.categoryFilters}" var="filter">
                    <div class="fltr-box-cont">
                        <div class="hdr2">
                            <span class=" collapsible-hdr">
                                <span class="icn icn-collapse"></span>
                            </span>
                            ${filter.filterName}
                        </div>
                        <div class="collapsible-cntnt">
                            <ul class="fltr-items scroll" data-name="${filter.name}">
                                <c:forEach items="${filter.filterValues}" var="filterValue">
                                    <li>
                                        <c:set var="isDisabled" value="${filterValue.noOfVariants == 0 ? true : false}"/>
                                        <c:choose>
                                            <c:when test="${filterValue.selected}" >
                                                <s:link href="${actionBean.finalSlug}" event="filterByAttr" class="${isDisabled ? 'inactive':''}">
                                                    <input checked="checked" class="filterChk" value="${filterValue.filterValue}" ${isDisabled ? 'disabled="disabled"' : ''} type="checkbox"/>
                                                    <s:param name="catPrefix" value="${actionBean.catPrefix}"/>
                                                    <s:param name="navKey" value="${actionBean.navKey}"/>
                                                    <s:param name="brands" value="${actionBean.brands}"/>
                                                    <s:param name="fl" value="${actionBean.fl}"/>
                                                    <s:param name="currFilterKey" value="${filter.name}"/>
                                                    <s:param name="currFilterVal" value="${filterValue.filterValue}"/>
                                                    <span class="fltr-value">${filterValue.value}</span>
                                                    <span class="cont-rht">${filterValue.noOfVariants}</span>
                                                </s:link>
                                            </c:when>
                                            <c:otherwise>

                                                <s:link href="${actionBean.finalSlug}" event="filterByAttr" class="${isDisabled ? 'inactive':''}">
                                                  <input class="filterChk" value="${filterValue.filterValue}" type="checkbox" ${isDisabled ? 'disabled="disabled"' : ''} />
                                                    <s:param name="catPrefix" value="${actionBean.catPrefix}"/>
                                                    <s:param name="navKey" value="${actionBean.navKey}"/>
                                                    <s:param name="brands" value="${actionBean.brands}"/>
                                                    <s:param name="fl" value="${actionBean.fl}"/>
                                                    <s:param name="currFilterKey" value="${filter.name}"/>
                                                    <s:param name="currFilterVal" value="${filterValue.filterValue}"/>
                                                    <span class="fltr-value">${filterValue.value}</span>
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

            <div class="fltr-box-cont">
                <div class="hdr2">
                    <span class=" collapsible-hdr">
                        <span class="icn icn-collapse"></span>
                    </span>
                    Stock Availability
                </div>
                <div class="collapsible-cntnt">
                    <ul id="excludeOOSFilterView" class="fltr-items scroll">
                        <li>
                        <a>
                        <c:choose>
                            <c:when test="${actionBean.excludeOOS}">
                                <input checked="checked" type="checkbox" value="true"/>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" value="true"/>
                            </c:otherwise>
                        </c:choose>
                        <span class="fltr-value">Exclude Out Of Stock</span>
                        </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</s:layout-definition>