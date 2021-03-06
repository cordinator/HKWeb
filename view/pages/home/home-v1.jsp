<%@ page import="com.hk.constants.ui.EnumBannerConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="com.hk.constants.marketing.TagConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.home.HomeAction" event="pre" var="homeAction"/>
<c:set var="seoData" value="${homeAction.homePage.seoContent}"/>

<s:layout-render seoData="${seoData}" name="/templates/general.jsp" version ="1" showOldHKLink="false" showMenu="true"
                 canonicalUrl="http://www.healthkart.com" pageType="<%=TagConstants.PageType.HOME%>">
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
  <c:set var="homePage" value="${homeAction.homePage}"/>
  <c:set var="variantGroupList" value="${homePage.variantHeaders}"/>
  <s:layout-component name="content">
    <%--<style>
      .nbs-flexisel-container {

      }
    </style>--%>
    <div class="mainContainer">
      <div class="topBanner clearfix container">
        <div class="span4 alpha"></div>
        <div class="span12" style="">
            <%--banner begins--%>
          <c:set var="pageBanners" value="${homePage.pageBannerList}"/>
          <c:forEach items="${pageBanners}" var="pageBanner">
            <div class="bnr-700-cnt">

              <c:forEach items="<%=EnumBannerConstants.getSlots()%>" var="slot">
                <c:set var="slotClassName" value='${slot.name}'/>
                <c:set var="storePageBanners" value="${pageBanner.slotToBanner[slot.key]}"/>
                <c:set var="slotMaxHeight" value="${storePageBanners.height}"/>
                <c:set var="slotMaxWidth" value="${storePageBanners.width}"/>

                <div id="myCarousel-${slot.key}" class="${slotClassName} carousel slide">
                  <c:set var="len" value="${fn:length(storePageBanners.bannerSlotImages)}"/>

                  <c:if test="${len>1}">
                    <ol class="carousel-indicators">
                      <c:forEach begin="0" end="${len-1}" var="bullet" varStatus="counter">
                        <li data-target="#myCarousel-${slot.key}" data-interval="3500"
                            data-slide-to="${counter.index}" class="${counter.first?'active':''}"></li>
                      </c:forEach>
                    </ol>
                  </c:if>

                  <div class="carousel-inner">
                    <c:forEach items="${storePageBanners.bannerSlotImages}" var="bannerImage" varStatus="counter">
                      <div class="${counter.first? "active":""} item">

                          <%--<c:set var="srcAttr" value="${counter.first ? 'src' : 'lazy-src'}"/>--%>
                        <c:set var="srcAttr" value="${counter.first ? 'src' : 'src'}"/>
                        <c:choose>
                          <c:when test="${bannerImage.landingPage!=null}">
                            <a rel = "${bannerImage.displayOrder}" href="${bannerImage.landingPage}">
                              <img ${srcAttr}="${bannerImage.olink}"
                                <%--src="${bannerImage.llink}"--%>
                              style="max-height: ${slotMaxHeight}px
                            ;
                              max-width: ${slotMaxWidth}px
                            ;"
                              alt="${bannerImage.altText}"/>
                            </a>
                          </c:when>
                          <c:otherwise>
                            <img ${srcAttr}="${bannerImage.olink}"
                            <%--src="${bannerImage.llink}"--%>
                            style="max-height:${slotMaxHeight}px;max-width:${slotMaxWidth}px;"
                            alt="${bannerImage.altText}"/>
                          </c:otherwise>
                        </c:choose>
                      </div>
                    </c:forEach>
                  </div>
                </div>

              </c:forEach>
            </div>
          </c:forEach>
            <%--banner ends--%>
        </div>
      </div>
    </div>
    <div class="container clearfix topBanner">
      <div  style="">
        <c:forEach items="${variantGroupList}" var="variantGroup" varStatus="counter">
          <div class="clearfix mrgn-b-25">
            <div class="ttl-cntnr mrgn-b-10 ">
              <span class="icn icn-sqre"></span>

              <h2>${variantGroup.displayName}</h2>
              <span class="icn icn-sqre"></span>
            </div>
            <div id="flexiCarousel-${counter.index}" class="clearfix nbs-400">
              <c:forEach items="${variantGroup.items}" var="variantDetails">
                <c:set var="variant" value="${variantDetails.variantBasicResponse}"/>
                <s:layout-render name="/layouts/variantTileDefaultLayout.jsp"
                                 variantBasicResponse="${variant}"></s:layout-render>
              </c:forEach>
            </div>
          </div>
        </c:forEach>
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


    <%--<s:layout-render name="/layouts/embed/remarketingWithCustomParams.jsp"--%>
    <%--pageType="<%=EnumRemarketingConstants.HOME.getPageType()%>"--%>
    <%--gender="${gender}" orderCount="${orderCount}"--%>
    <%--/>--%>

    <%--<c:if test="${not isSecure }">--%>
    <%--<iframe--%>
    <%--src="http://www.vizury.com/analyze/analyze.php?account_id=VIZVRM112&param=e100&section=1&level=1&uid=${user_hash}"--%>
    <%--scrolling="no" width="1" height="1" marginheight="0" marginwidth="0"--%>
    <%--frameborder="0"></iframe>--%>
    <%--</c:if>--%>
  </s:layout-component>
  <s:layout-component name="scriptComponent">

    <script>
      $(document).ready(function () {
        $('#dropDownButton').off();
        $('#dropDownbox1').off();
        <c:set var="itemsToScroll" value="4"/>
        <c:forEach items="${variantGroupList}" var="variantGroup" varStatus="counter">
        <%--c:if test="${fn:length(variantGroup.items) > itemsToScroll}"--%>
        $("#flexiCarousel-${counter.index}").flexisel({noOfItemsToScroll: 4, visibleItems:${itemsToScroll}, animationSpeed: 300});
        <%--/c:if--%>
        </c:forEach>
      });

    </script>
  </s:layout-component>
</s:layout-render>