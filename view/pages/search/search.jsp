<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.search.SearchAction" var="searchAction"/>

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
<s:layout-render name="/templates/general.jsp">

  <s:layout-component name="content">
    <style>
      .search-filter-label, .search-filter-box {
        display: none;
      }
    </style>
    <c:choose>
      <c:when test="${searchAction.searchQueryValid}">
        <div class="mainContainer">
          <c:set var="brandSeperator" value="<%=RequestConstants.BRAND_SEP%>"/>
          <c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
          <c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>

          <div class="container clearfix">
            <input type="hidden" name="txtQ" value="${searchAction.txtQ}"/>
            <input type=hidden name="minPrice" value="${searchAction.minPrice}"/>
            <input type=hidden name="maxPrice" value="${searchAction.maxPrice}"/>
            <input type="hidden" name="perPage" value="${searchAction.perPage}"/>
            <s:layout-render name="/pages/compare/variantCompareWidget.jsp"/>
            <div class="row js-hvr-rvw" id="catContainer" data-page-type="catalog">
              <s:layout-render name="/layouts/search/_filtersLayout.jsp" actionBean="${searchAction}"/>
              <s:layout-render name="/layouts/catalog/_productsLayout.jsp" searchPage="${true}"
                               actionBean="${searchAction}"/>
            </div>
          </div>

        </div>
      </c:when>
      <c:otherwise>
        <div class="mainContainer">
          <div class="container clearfix">
            <div class="row js-hvr-rvw" id="invalidQueryContainer" data-page-type="catalog">
               Invalid Search Query
            </div>
          </div>
        </div>

      </c:otherwise>
    </c:choose>


  </s:layout-component>
  <s:layout-component name="scriptComponent">
    <script type="text/javascript">
      var navKey = "${searchAction.navKey}";
    </script>

    <%--<s:layout-render--%>
    <%--name="/layouts/embed/remarketingWithCustomParams.jsp"--%>
    <%--pageType="<%=EnumRemarketingConstants.BRAND_CATALOG.getPageType()%>"--%>
    <%--primaryCategory="${searchAction.brandPage.breadCrumbs[1].name}"--%>
    <%--secondaryCategory="${searchAction.brandPage.breadCrumbs[2]!=null ? searchAction.brandPage.breadCrumbs[2].name : ''}"--%>
    <%--tertiaryCategory="${searchAction.brandPage.breadCrumbs[3]!=null ? searchAction.brandPage.breadCrumbs[3].name : ''}"--%>
    <%--gender="${gender}"--%>
    <%--orderCount="${orderCount}"--%>
    <%--brand="${searchAction.brandPage.brandName}"--%>
    <%--/>--%>
    <%--<c:if test="${not isSecure }">--%>
    <%--<iframe--%>
    <%--src="http://www.vizury.com/analyze/analyze.php?account_id=VIZVRM112&param=e200&pid=&catid='${searchAction.brandPage.breadCrumbs[1].name}'&subcat1id='${searchAction.brandPage.breadCrumbs[2]!=null ? searchAction.brandPage.breadCrumbs[2].name : ''}'&subcat2id='${searchAction.brandPage.breadCrumbs[3]!=null ? searchAction.brandPage.breadCrumbs[3].name : ''}'&section=1&level=1&uid=${user_hash}"--%>
    <%--scrolling="no" width="1" height="1" marginheight="0" marginwidth="0"--%>
    <%--frameborder="0"></iframe>--%>
    <%--</c:if>--%>


    <s:layout-render name="/pages/hdtemplates/priceSliderViewTemplate.jsp"/>
    <s:layout-render name="/pages/hdtemplates/variantReviewTemplate.jsp"/>

    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/underscore-1.3.1.min.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery.history.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/backbone.min.js"></script>

    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/compare/compare.js?v=0.3"></script>

    <%--<script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalogView.js?v=1.3"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/catalogCore.js?v=1.3"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/brandCatalog.js?v=1.3"></script>--%>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/catalog/searchCatalog.js?v=0.22"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/bootstrap-slider.min.js"></script>
  </s:layout-component>
</s:layout-render>