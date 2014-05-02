<%@ page import="com.hk.web.SortingConstants" %>
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
  <div class="span12 prdct-dtls-blck ">
    <c:if test="${pagination != 'true'}">
      <div class="sort-cntnr">
        <div class="filter-itms-cntnr">
                <span id="searchRelevanceFeedback" class="cont-rht fnt-sz10">
                    <c:if test="${searchPage}">
                        Found what you want? <span class="fnt-bold search-feedback-response search-feedback-response-yes" style="cursor: pointer; text-decoration: underline"> Yes</span> / <span class="fnt-bold search-feedback-response search-feedback-response-no"  style="cursor: pointer; text-decoration: underline">No</span>
                    </c:if>
                </span>
                <span id="filteredByTextView">
                   <c:if test="${actionBean.txtQ != null}">
                        <span class="filter-label search-filter-label">
                                Search
                        </span>
                        <span class="filter-box  search-filter-box">
                            ${actionBean.txtQ}
                            <span class="textFilterSpan" value="${actionBean.txtQ}">
                                <span class="icn icn-close1 remove-varnt"></span>
                            </span>
                        </span>
                   </c:if>
                </span>
                <span id="filteredByBrandView">
                    <c:set var="filterCount" value="-1"/>
                    <c:forEach items="${actionBean.brandListingItems}" var="brand">
                      <c:if test="${brand.selected}">
                        <c:set var="filterCount" value="${filterCount+1}"/>
                        <c:if test="${filterCount == 0}">
                                <span class="filter-label">
                                        Brands
                                </span>
                        </c:if>
                            <span class="filter-box">
                                ${brand.brandName}
                                <span class="brandFilterSpan" value="${brand.brandId}">
                                    <span class="icn icn-close1 remove-varnt"></span>
                                </span>
                            </span>
                      </c:if>
                    </c:forEach>
                </span>
                <span id="filteredByAttrView">
                     <c:forEach items="${actionBean.categoryFilters}" var="filter">

                       <c:set var="filterCount" value="-1"/>
                       <c:forEach items="${filter.filterValues}" var="filterValue">
                         <c:if test="${filterValue.selected}">
                           <c:set var="filterCount" value="${filterCount+1}"/>
                           <c:if test="${filterCount == 0}">
                                        <span class="filter-label">
                                            ${filter.filterName}
                                        </span>
                           </c:if>
                                    <span class="filter-box">
                                        ${filterValue.value}
                                        <span class="filterByAttrSpan" value="${filterValue.filterValue}"
                                              flinm="${filter.name}">
                                            <span class="icn icn-close1 remove-varnt"></span>
                                        </span>
                                    </span>
                         </c:if>
                       </c:forEach>
                     </c:forEach>
                </span>
                <span id="filterByAvailability">
                  <c:if test="${actionBean.excludeOOS}">
                     <span class="filter-label">
                       Availability
                     </span>
                    <span class="filter-box">
                      Exclude out of stock
                      <span class="filterByOOS">
                        <span class="icn icn-close1 remove-varnt"></span>
                      </span>
                    </span>
                  </c:if>
                </span>

        </div>
        <div class="pag-cntnr">
          <div class="cont-lft">
            Sort by:
            <select name="sortByVariants" id="sortByVariants">
                <%--<option value="">- Select One -</option>
                <option
                  value="popularity" ${actionBean.sortType=='ASC'&&actionBean.sortBy=='RANK'?'selected="selected"':''}
                  data-srt-type="ASC" data-srt-by="RANK">Popularity
              </option>
              <option
                  value="priceLH" ${actionBean.sortType=='ASC'&&actionBean.sortBy=='PRC'?'selected="selected"':''}
                  data-srt-type="ASC" data-srt-by="PRC">Price -- Low to High
              </option>
              <option
                  value="priceHL" ${actionBean.sortType=='DESC'&&actionBean.sortBy=='PRC'?'selected="selected"':''}
                  data-srt-type="DESC" data-srt-by="PRC">Price -- High to Low
              </option>
              <option
                  value="discLH" ${actionBean.sortType=='ASC'&&actionBean.sortBy=='DISC'?'selected="selected"':''}
                  data-srt-type="ASC" data-srt-by="DISC">Discount -- Low to High
              </option>
              <option
                  value="discHL" ${actionBean.sortType=='DESC'&&actionBean.sortBy=='DISC'?'selected="selected"':''}
                  data-srt-type="DESC" data-srt-by="DISC">Discount -- High to Low
              </option>--%>

              <c:set var="ascSortType" value="<%=SortingConstants.DEFAULT_SORT_TYPE%>"/>
              <c:set var="descSortType" value="<%=SortingConstants.SORT_TYPE_DESC%>"/>
              <c:set var="rankSortBy" value="<%=SortingConstants.DEFAULT_SORT_BY%>"/>
              <c:set var="priceSortBy" value="<%=SortingConstants.SORT_BY_PRICE%>"/>
              <c:set var="discSortBy" value="<%=SortingConstants.SORT_BY_DISCOUNT%>"/>
              <c:set var="ratingSortBy" value="<%=SortingConstants.SORT_BY_RATING%>"/>

              <option value="popularity"
                      data-srt-type="<%=SortingConstants.DEFAULT_SORT_TYPE%>"
                      data-srt-by="<%=SortingConstants.DEFAULT_SORT_BY%>"
                ${actionBean.sortType==ascSortType && actionBean.sortBy==rankSortBy ? 'selected="selected"' : ''}
                  >Popularity
              </option>
              <option value="priceLH"
                      data-srt-type="<%=SortingConstants.DEFAULT_SORT_TYPE%>"
                      data-srt-by="<%=SortingConstants.SORT_BY_PRICE%>"
                ${(actionBean.sortType==ascSortType || actionBean.sortType== null) && actionBean.sortBy==priceSortBy ? 'selected="selected"' : ''}
                  >Price -- Low to High
              </option>
              <option value="priceHL"
                      data-srt-type="<%=SortingConstants.SORT_TYPE_DESC%>"
                      data-srt-by="<%=SortingConstants.SORT_BY_PRICE%>"
                ${actionBean.sortType==descSortType && actionBean.sortBy==priceSortBy ? 'selected="selected"' : ''}
                  >Price -- High to Low
              </option>
              <option value="discLH"
                      data-srt-type="<%=SortingConstants.DEFAULT_SORT_TYPE%>"
                      data-srt-by="<%=SortingConstants.SORT_BY_DISCOUNT%>"
                ${(actionBean.sortType==ascSortType  || actionBean.sortType== null) && actionBean.sortBy==discSortBy ? 'selected="selected"' : ''}
                  >Discount -- Low to High
              </option>
              <option value="discHL"
                      data-srt-type="<%=SortingConstants.SORT_TYPE_DESC%>"
                      data-srt-by="<%=SortingConstants.SORT_BY_DISCOUNT%>"
                ${actionBean.sortType==descSortType && actionBean.sortBy==discSortBy ? 'selected="selected"' : ''}
                  >Discount -- High to Low
              </option>
              <option value="rtngLH"
                      data-srt-type="<%=SortingConstants.DEFAULT_SORT_TYPE%>"
                      data-srt-by="<%=SortingConstants.SORT_BY_RATING%>"
                ${(actionBean.sortType==ascSortType  || actionBean.sortType== null) && actionBean.sortBy==ratingSortBy ? 'selected="selected"' : ''}
                  >Rating -- Low to High
              </option>
              <option value="rtngHL"
                      data-srt-type="<%=SortingConstants.SORT_TYPE_DESC%>"
                      data-srt-by="<%=SortingConstants.SORT_BY_RATING%>"
                ${actionBean.sortType==descSortType && actionBean.sortBy==ratingSortBy ? 'selected="selected"' : ''}
                  >Rating -- High to Low
              </option>
            </select>
          </div>
          <div class="cont-rht">
            <div id="topPager">

              <s:layout-render name="/layouts/paginationResultCount.jsp" paginatedBean="${actionBean}"/>
              <span class="icn-sqre mrgn-lr-10"></span>
              Show  <span class="sort-items ${actionBean.perPage==24?'selectd-sort':''}">
                                <a class="resultCnt" count="24">24</a>
                            </span> |<span class="sort-items ${actionBean.perPage==48?'selectd-sort':''}"><a
                class="resultCnt" count="48">48</a></span> |
              <span class="sort-items ${actionBean.perPage==72?'selectd-sort':''}"><a class="resultCnt"
                                                                                         count="72">72</a></span> items
              per page

            </div>
          </div>
        </div>
      </div>
    </c:if>
    <div id="variantResultView">
        <c:if test="${fn:length(actionBean.variants)  == 0}" >
            <h2 class="errorH1">No product found</h2>
        </c:if>

        <c:forEach items="${actionBean.variants}" var="variant" varStatus="ctr">
        <s:layout-render name="/layouts/catalogVariantTileLayout.jsp" variant="${variant}"></s:layout-render>
      </c:forEach>

    </div>


    <div id="bottomPager" class="clr-cont">
      <c:if test="${fn:length(actionBean.variants) == actionBean.perPage}">
        <s:link href="${actionBean.finalSlug}" class="btn" data-role="load-more"
                data-curr-page="${actionBean.pageNo +1}" data-default-text="Load more" data-auto-scroll="3" data-loading-text="Loading...">
          Load more
          <s:param name="minPrice" value="${actionBean.priceRange.minPrice}"/>
          <s:param name="maxPrice" value="${actionBean.priceRange.maxPrice}"/>
          <s:param name="brands" value="${actionBean.brands}"/>
          <s:param name="navKey" value="${actionBean.navKey}"/>
          <s:param name="catPrefix" value="${actionBean.catPrefix}"/>
          <s:param name="fl" value="${actionBean.fl}"/>
          <s:param name="txtQ" value="${actionBean.txtQ}"/>
          <s:param name="pageNo" value="${actionBean.pageNo +1}"/>
        </s:link>
      </c:if>
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


</s:layout-definition>