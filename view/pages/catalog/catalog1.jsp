<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@ page import="com.hk.constants.marketing.TagConstants" %>
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
                 cTagList="${catalogAction.catalogPage.categoryTagList}"
                 bTagList="${catalogAction.catalogPage.brandTagList}"
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

    <div class="container clearfix" >
    <input type="hidden" name="catPrefix" value="${catalogAction.catPrefix}"/>
    <input type="hidden" name="navKey" value="${catalogAction.navKey}"/>
    <input type="hidden" name="perPage" value="${catalogAction.perPage}"/>
    <c:if test="${seoData.h1 != null}">
      <div class="ttl-cntnr">
        <span class="icn icn-sqre "></span>

        <h1 class="">${seoData.h1}</h1>
        <span class="icn icn-sqre"></span>
      </div>
    </c:if>
    <s:layout-render name="/pages/compare/variantCompareWidget.jsp"/>

    <input type=hidden name="minPrice" value="${catalogAction.minPrice}"/>
    <input type=hidden name="maxPrice" value="${catalogAction.maxPrice}"/>

    <div class="row js-hvr-rvw" id="catContainer" data-page-type="catalog">
      <s:layout-render name="/layouts/catalog/_filtersLayout.jsp" actionBean="${catalogAction}"/>
      <s:layout-render name="/layouts/catalog/_productsLayout.jsp" actionBean="${catalogAction}"/>
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

  </s:layout-component>
  <s:layout-component name="scriptComponent">
    <s:layout-render name="/pages/hdtemplates/priceSliderViewTemplate.jsp"/>
    <s:layout-render name="/pages/hdtemplates/variantReviewTemplate.jsp"/>

    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/underscore-1.3.1.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery.history.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/compare/compare.js?v=1.1"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalog2.js?v=0.42"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/bootstrap-slider.js"></script>

  </s:layout-component>
</s:layout-render>