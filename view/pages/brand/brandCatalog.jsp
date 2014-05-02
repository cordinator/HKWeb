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
                 bTags="${brandCatalogAction.brandPage.brandTag.tagList}"
    >

  <s:layout-component name="content">

    <div class="mainContainer">
      <c:set var="brandSeperator" value="<%=RequestConstants.BRAND_SEP%>"/>
      <c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
      <c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>
      <div class="container clearfix topBanner">
        <s:layout-render name="/layouts/breadCrumbLayout.jsp"
                           breadCrumbs="${brandCatalogAction.brandPage.breadCrumbs}"/>
        <div class="clearfix">
          <s:layout-render name="/layouts/bannerLayout.jsp"
                           pageBanners="${brandCatalogAction.brandPage.pageBannerList}"/>
        </div>
      </div>

      <div class="container clearfix">
          <input type="hidden" name="navKey" value="${brandCatalogAction.navKey}"/>
        <div class="ttl-cntnr">
          <span class="icn icn-sqre "></span>

          <h1 class=""> ${seoData.h1}</h1>
          <span class="icn icn-sqre"></span>
        </div>
          <input type=hidden name="minPrice" value="${brandCatalogAction.minPrice}"/>
          <input type=hidden name="maxPrice" value="${brandCatalogAction.maxPrice}"/>
          <input type="hidden" name="perPage" value="${brandCatalogAction.perPage}"/>
        <s:layout-render name="/pages/compare/variantCompareWidget.jsp"/>
          <div class="row js-hvr-rvw" id="catContainer" data-page-type="catalog">
              <s:layout-render name="/layouts/brand/_filtersLayout.jsp" actionBean="${brandCatalogAction}"/>
              <s:layout-render name="/layouts/catalog/_productsLayout.jsp" actionBean="${brandCatalogAction}"/>
          </div>
      </div>
        <c:if test="${seoData.descriptionTitle != null}">
            <div class="container seoContainer">
                <div class="row">
                    <div class="brdr-t-sd pad-t-10 mrgn-t-10">
                        <h2>${seoData.descriptionTitle}</h2>

                        <div class="vds mrgn-t-10">${seoData.description}</div>

                    </div>
                </div>
            </div>
        </c:if>
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



      <s:layout-render name="/pages/hdtemplates/priceSliderViewTemplate.jsp"/>
      <s:layout-render name="/pages/hdtemplates/variantReviewTemplate.jsp"/>

    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/underscore-1.3.1.min.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery.history.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/backbone.min.js"></script>

    <script type="text/javascript"
            src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/compare/compare.js?v=0.3"></script>

    <%--<script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalogView.js?v=1.3"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalogCore.js?v=1.3"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/brandCatalog.js?v=1.3"></script>--%>
      <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/brandCatalog2.js?v=1.52"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/bootstrap-slider.min.js"></script>
  </s:layout-component>
</s:layout-render>