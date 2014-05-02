<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="com.hk.constants.marketing.TagConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.category.CategoryAction" var="categoryAction"/>
<c:set var="seoData" value="${categoryAction.categoryPage.seoContent}"/>
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
<s:layout-render name="/templates/general.jsp"
                 seoData="${seoData}"
                 canonicalUrl="${categoryAction.categoryPage.canonicalUrl}"
                 pageType="<%=TagConstants.PageType.CATEGORY%>"
                 primaryCategory="${categoryAction.categoryPage.breadCrumbs[1].name}"
                 secondaryCategory="${categoryAction.categoryPage.breadCrumbs[2]!=null ? categoryAction.categoryPage.breadCrumbs[2].name: ''}"
                 tertiaryCategory="${categoryAction.categoryPage.breadCrumbs[3]!=null ? categoryAction.categoryPage.breadCrumbs[3].name: ''}"
                 navKey="${categoryAction.navKey}"
                 cTags="${categoryAction.categoryPage.categoryTag.tagList}"
    >

  <s:layout-component name="content">
    <c:set var="variantGroupList" value="${categoryAction.categoryPage.variantHeaders}"/>
    <c:set var="categoryHeaderList" value="${categoryAction.categoryPage.categoryHeaders}"/>

    <div class="mainContainer">
        <c:if test="${seoData.h1 != null}">
            <div class="ttl-cntnr">
                <span class="icn icn-sqre "></span>

                <h1 class="fnt-ttl">${seoData.h1}</h1>
                <span class="icn icn-sqre"></span>
            </div>
        </c:if>
      <div class="container clearfix topBanner">
        <%--<s:layout-render name="/layouts/breadCrumbLayout.jsp" breadCrumbs="${categoryAction.categoryPage.breadCrumbs}"/>--%>

        <div class="clearfix">
          <s:layout-render name="/layouts/bannerLayout.jsp"
                           pageBanners="${categoryAction.categoryPage.pageBannerList}"/>
        </div>
      </div>
      <div class="container">
          <div class="row">
          <div class="span3">
            <div class="menu-box">
              <div class="menu-heading">Categories</div>
              <div class="menu-content">
                <ul class="gl">
                  <c:set var="menuNode" value="${categoryAction.categoryPage.categoryMenuNodes}"/>
                  <c:forEach items="${menuNode}" var="l1child">
                    <li style="">
                      <a href="javascript:void(0)" class="menu-toggle menu-opened"></a>
                      <a href="${l1child.url}" class="sc-cat-nm">${l1child.name}</a>
                      <c:set var="maxLeafElms" value="40"/>
                      <c:set var="leafElms"
                             value="${fn:length(l1child.childNodes)>maxLeafElms?maxLeafElms:fn:length(l1child.childNodes)}"/>
                      <c:set var="seeMore"
                             value="${fn:length(l1child.childNodes)>maxLeafElms?'true':'false'}"/>
                      <ul class="gl">
                        <c:forEach items="${l1child.childNodes}" var="l2child" end="${leafElms}"
                                   varStatus="counter">
                          <li class="">
                          <a href="${l2child.url}"
                             class="">${l2child.name}</a>
                          <c:if test="${counter.last && seeMore}">
                            </li>
                            <li>
                            <a href="${l1child.url}" class="fnt-light">See All &raquo;</a>
                          </c:if>
                          </li>
                        </c:forEach>
                      </ul>
                    </li>
                  </c:forEach>
                </ul>
              </div>
            </div>
          </div>
          <div class="span12 offset1">
            <c:forEach items="${variantGroupList}" var="variantGroup" varStatus="counter">
              <div class="clearfix">
                <div class="ttl-cntnr mrgn-b-10 ">
                  <span class="icn icn-sqre"></span>

                  <h2>${variantGroup.displayName}</h2>
                  <span class="icn icn-sqre"></span>
                </div>
                <div  id="flexiCarousel-${counter.index}" class="clearfix">

                  <c:forEach items="${variantGroup.items}" var="variantDetails">
                    <c:set var="variant" value="${variantDetails.variantBasicResponse}"/>
                      <s:layout-render name="/layouts/variantTileDefaultLayout.jsp" variantBasicResponse="${variant}"/>
                  </c:forEach>
                </div>
              </div>
            </c:forEach>

              <c:if test="${fn:length(categoryHeaderList)>0}">
                  <div class="clearfix">
                      <div class="ttl-cntnr mrgn-b-10 ">
                          <span class="icn icn-sqre"></span>
                          <h2>Shop by Category</h2>
                          <span class="icn icn-sqre"></span>
                      </div>
                      <c:forEach items="${categoryHeaderList}" var="categoryHeader">
                          <div class="cat-cont" style="margin-bottom:20px">
                              <div class="img-box img-box-200">
                                <a href="${categoryHeader.url}">
                                  <img src="${categoryHeader.headerImage.olink}"
                                       data-url="${categoryHeader.headerImage.olink}"
                                       alt="${categoryHeader.headerImage.altText}"
                                          />
                                </a>
                              </div>
                              <a href="${categoryHeader.url}">
                              <h3 class="fnt-caps fnt-bold mrgn-t-10">${categoryHeader.displayName}</h3>
                              </a>
                              <hr class="mrgn-t-0">
                              <ul class="gl">
                                  <c:forEach items="${categoryHeader.items}" var="categoryHeaderItem">
                                      <li>
                                          <a href="${categoryHeaderItem.url}" class="gm-tc-nm ellipsis">${categoryHeaderItem.displayName}</a>
                                              <%--<a href="${hk:getRedirectLinkForPCHItem(categoryHeaderItem)}">${categoryHeaderItem.displayName}</a>--%>

                                      </li>
                                  </c:forEach>
                              </ul>
                          </div>
                      </c:forEach>
                  </div>
              </c:if>
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
    <%--<s:layout-render--%>
        <%--name="/layouts/embed/remarketingWithCustomParams.jsp"--%>
        <%--pageType="<%=EnumRemarketingConstants.CATEGORY.getPageType()%>"--%>
        <%--primaryCategory="${categoryAction.categoryPage.breadCrumbs[1].name}"--%>
        <%--secondaryCategory="${categoryAction.categoryPage.breadCrumbs[2]!=null ? categoryAction.categoryPage.breadCrumbs[2].name: ''}"--%>
        <%--tertiaryCategory="${categoryAction.categoryPage.breadCrumbs[3]!=null ? categoryAction.categoryPage.breadCrumbs[3].name: ''}"--%>
        <%--orderCount="${orderCount}"--%>
        <%--gender="${gender}"--%>
        <%--/>--%>

    <%--<c:if test="${not isSecure }">--%>
      <%--<iframe--%>
          <%--src="http://www.vizury.com/analyze/analyze.php?account_id=VIZVRM112&param=e200&pid=&catid='${categoryAction.categoryPage.breadCrumbs[1].name}'&subcat1id='${categoryAction.categoryPage.breadCrumbs[2]!=null ? categoryAction.categoryPage.breadCrumbs[2].name: ''}'&subcat2id='${categoryAction.categoryPage.breadCrumbs[3]!=null ? categoryAction.categoryPage.breadCrumbs[3].name: ''}'&section=1&level=1&uid=${user_hash}"--%>
          <%--scrolling="no" width="1" height="1" marginheight="0" marginwidth="0"--%>
          <%--frameborder="0"></iframe>--%>
    <%--</c:if>--%>
  </s:layout-component>
  <s:layout-component name="scriptComponent">

    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/compare/compare.js"></script>--%>

    <script>

      $(document).ready(function () {
        //TODO if only three products then no carousel
          <c:forEach items="${variantGroupList}" var="variantGroup" varStatus="counter">
          <c:if test="${fn:length(variantGroup.items)>3}">
            $("#flexiCarousel-${counter.index}").flexisel({noOfItemsToScroll: 3,visibleItems:3, animationSpeed: HK.timeOut.xxs});
          </c:if>

         </c:forEach>

      });

      $('.menu-toggle').click(function() {
        var menuToggle = {};
        menuToggle.selectors = {
          menuMain : 'menu-toggle',
          menuOpened : 'menu-opened',
          menuClosed : 'menu-closed'
        };
        var ele = $(this),menuState = ele.hasClass(menuToggle.selectors.menuOpened);
        if (menuState) {
          ele.removeClass(menuToggle.selectors.menuOpened).addClass(menuToggle.selectors.menuClosed).siblings('.gl').finish().slideUp();
        } else {
          ele.removeClass(menuToggle.selectors.menuClosed).addClass(menuToggle.selectors.menuOpened).siblings('.gl').finish().slideDown();
        }
      });
    </script>

  </s:layout-component>
</s:layout-render>