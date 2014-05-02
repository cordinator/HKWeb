<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="com.hk.constants.marketing.TagConstants" %>
<%@ page import="com.hk.web.SortingConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.brand.BrandCatalogAction" var="brandCatalogAction"/>
<c:set var="seoData" value="${brandCatalogAction.brandPage.seoContent}"/>
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
<s:layout-render name="/templates/general.jsp" seoData="${seoData}"
                 canonicalUrl="${brandCatalogAction.brandPage.canonicalUrl}"
                 pageType="<%=TagConstants.PageType.BRAND_CATALOG%>"
                 primaryCategory="${brandCatalogAction.brandPage.breadCrumbs[1].name}"
                 secondaryCategory="${brandCatalogAction.brandPage.breadCrumbs[2]!=null ? brandCatalogAction.brandPage.breadCrumbs[2].name : ''}"
                 tertiaryCategory="${brandCatalogAction.brandPage.breadCrumbs[3]!=null ? brandCatalogAction.brandPage.breadCrumbs[3].name : ''}"
                 brand="${brandCatalogAction.brandPage.brandName}"
    >

  <s:layout-component name="content">

    <div class="mainContainer">
      <c:set var="brandSeperator" value="<%=RequestConstants.BRAND_SEP%>"/>
      <c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
      <c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>
      <div class="container clearfix topBanner">
        <div class="clearfix">
          <s:layout-render name="/layouts/bannerLayout.jsp"
                           pageBanners="${brandCatalogAction.brandPage.pageBannerList}"/>
        </div>
      </div>

      <div class="container clearfix">
        <s:layout-render name="/layouts/breadCrumbLayout.jsp"
                         breadCrumbs="${brandCatalogAction.brandPage.breadCrumbs}"/>
        <div class="ttl-cntnr">
          <span class="icn icn-sqre "></span>

          <h1 class=""> ${seoData.h1}</h1>
          <span class="icn icn-sqre"></span>
        </div>

        <s:layout-render name="/pages/compare/variantCompareWidget.jsp"/>
        <div class="row" id="catContainer">
          <div class="span4">

            <div class="fltr-box-cont no-brdr">
              <div class="hdr1">
                Browse by
              </div>
            </div>

            <div class="brand-ctgry">
              <div class="fltr-box-cont no-brdr">
                <div class="hdr2">
                                    <span class="collapsible-hdr">
                                    <span class="icn icn-collapse"></span>
                                    </span>
                  Categories
                </div>
                <div class="collapsible-cntnt">
                  <div class="head-sec">
                      <%-- <div class="fltr-inpt-box">
                      <input id="search-brands" type="text" placeholder="Search by Category" autocomplete="off"/>
                      <span class=" icn icn-search icn-search-img"></span>
                      </div>--%>
                  </div>
                  <ul id="categoryFilterView" class="fltr-items ">
                  </ul>
                </div>
              </div>

              <div class="fltr-box-cont clr-cont mrgn-t-25">
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
                  <ul id="priceFilterView" class="fltr-items scroll">

                  </ul>
                </div>
              </div>

              <div id="catalogFiltersView">

              </div>
            </div>
          </div>
          <div class="span12 ">

            <div class="sort-cntnr">
              <div class="filter-itms-cntnr">
                <span id="filteredByBrandView"></span>
                <span id="filteredByAttrView"></span>
              </div>
              <div class="pag-cntnr">
                <div class="cont-lft">
                  Sort by:
                  <select name="sortByVariants" id="sortByVariants">
                    <option value="">- Select One -</option>
                    <option value="popularity" selected="selected"
                            data-srt-type="<%=SortingConstants.DEFAULT_SORT_TYPE%>"
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


            </div>
            <div id="bottomPager" class="pagination clr-cont cont-rht">
                <%--<s:layout-render name="/layouts/paginationResultCount.jsp" paginatedBean="${brandCatalogAction}"/>
              <s:layout-render name="/layouts/pagination.jsp" paginatedBean="${brandCatalogAction}"/>--%>
            </div>
          </div>
        </div>


        <c:if test="${seoData.descriptionTitle != null}">
          <div class="container">
            <div class="row">
              <div class="span16 brdr-t-sd pad-t-10">
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
      var navKey = "${brandCatalogAction.navKey}";
    </script>

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

    <s:layout-render name="/pages/hdtemplates/brandFilterRowTemplate.jsp"/>
    <s:layout-render name="/pages/hdtemplates/categoryFilterRowTemplate.jsp"/>
    <%--<s:layout-render name="/pages/hdtemplates/catalogFilterTemplate.jsp"/>
   <s:layout-render name="/pages/hdtemplates/filteredByAttrViewTemplate.jsp"/>
   <s:layout-render name="/pages/hdtemplates/filteredByBrandViewTemplate.jsp"/>--%>
    <s:layout-render name="/pages/hdtemplates/pagerCountTemplate.jsp"/>
    <s:layout-render name="/pages/hdtemplates/pagerTemplate.jsp"/>
    <s:layout-render name="/pages/hdtemplates/pagerCountTemplate.jsp"/>
    <s:layout-render name="/pages/hdtemplates/priceSliderViewTemplate.jsp"/>
    <s:layout-render name="/pages/hdtemplates/variantResultItemViewTemplate.jsp"/>

    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/underscore-1.3.1.min.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery.history.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/backbone.min.js"></script>

    <script type="text/javascript"
            src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/compare/compare.js?v=1.0"></script>

    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalogView.js?v=1.3"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalogCore.js?v=1.3"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/brandCatalog.js?v=1.3"></script>

    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/bootstrap-slider.min.js"></script>
  </s:layout-component>
</s:layout-render>