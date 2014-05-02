<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp" pageTitle="Brands | Healthkart">
  <s:useActionBean beanclass="com.hk.web.action.beta.brand.BrandListingAction" var="brandAction"/>
  <s:layout-component name="content">

    <div class="mainContainer">
      <div class="container clearfix">

        <%--breadcrumbs begins--%>
        <div class="hk-breadcrumb-cntnr mrgn-bt-10">
          <span>
    <a href="/" title="Home">
    Home</a>
          </span>
          <span>&raquo;</span>
          <span class="fnt-bold">Brands</span>
        </div>
        <%--breadcrumbs ends--%>

        <div class ="text-center">
            <div class="ttl-cntnr">
                <span class="icn icn-sqre"></span>
                <h1>
                  Brands in
                  <span class="fnt-ttl fnt-bold">
                    <c:forEach items="${brandAction.primaryCategories}" var="primaryCategory">
                      <c:if test="${brandAction.primaryCatId eq primaryCategory.id}">
                        ${primaryCategory.name}
                      </c:if>
                    </c:forEach>
                  </span>
                </h1>
                <span class="icn icn-sqre"></span>
            </div>
            <div class="mrgn-t-50 nav-alpha-box">
                <c:forEach items="${brandAction.brandListByPrefixApiResponse.brandListByPrefixList}" var="brandListByPrefix" varStatus="stats">
                     <span class="mrgn-lr-5"><a href="javascript:void(0)" data-target="#${brandListByPrefix.prefix}">${brandListByPrefix.prefix}</a></span>
                     <span class="separator">${stats.last?'':'|'}</span>
                </c:forEach>
            </div>
        </div>
        <br><br>
        <div class="row clearfix">
          <div class="span4">
              <ul class="accnt-nav-box">
                  <c:forEach items="${brandAction.primaryCategories}" var="primaryCategory" varStatus="ctr">
                    <li>
                      <s:link beanclass="com.hk.web.action.beta.brand.BrandListingAction" event="pre"
                              class="${brandAction.primaryCatId eq primaryCategory.id ? 'selected-cat' : ''}">
                        ${primaryCategory.name}
                        <s:param name="primaryCatId" value="${primaryCategory.id}"/>
                      </s:link>
                      <span>&raquo;</span>
                    </li>
                  </c:forEach>
                </ul>
          </div>

            <div class="span12">

              <c:forEach items="${brandAction.brandListByPrefixApiResponse.brandListByPrefixList}" var="brandListByPrefix">
                <div class="brand-list-container">
                    <div class="mrgn-b-10 row">
                        <h2 class="span2 alpha-box brand-list-initial" id ="${brandListByPrefix.prefix}">${brandListByPrefix.prefix}</h2>
                    </div>
                    <div class="mrgn-b-40 row">
                        <c:forEach items="${brandListByPrefix.brandDTOList}" var="brand" varStatus="ctr">
                          <%--<label class="span3 ellipses">${brand.displayName}</label>--%>
                          <a href="${brand.url}" class="span3 ellipses">${brand.displayName}</a>
                        </c:forEach>
                    </div>
                </div>
              </c:forEach>
            </div>
        </div>
      </div>
    </div>
  </s:layout-component>
  <s:layout-component name="scriptComponent">
      <script>
      $(document).ready(function(){
          $('.nav-alpha-box a').click(function(){
            var target = $(this).data('target');
             HK.utils.Scroll.toElement($(target));

          });
      });
      </script>
  </s:layout-component>
</s:layout-render>
