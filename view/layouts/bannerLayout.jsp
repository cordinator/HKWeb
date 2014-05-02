<%@ page import="com.hk.constants.ui.EnumBannerConstants" %>
<%@ page import="com.hk.constants.ui.BannerTypeEnum" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-definition>
  <c:if test="${pageBanners != null}">
    <c:forEach items="${pageBanners}" var="pageBanner">
      <c:if
          test="${pageBanner.slotToBanner!=null and fn:length(pageBanner.slotToBanner)>0 and pageBanner.slotToBanner['one']!=null}">
        <div class="bnr-main-cnt">
          <div id="next" class="hide"></div>
            <c:set var="bannerType" value="${pageBanner.type}" />
            <c:set var="stripBanner" value="<%=BannerTypeEnum.StripBanner.getName()%>" />
            <c:set var="heroBanners" value="<%=BannerTypeEnum.getPagesBanners()%>" />
          <c:forEach items="<%=EnumBannerConstants.getSlots()%>" var="slot">
            <c:set var="slotClassName" value='${slot.name}'/>
            <c:set var="storePageBanners" value="${pageBanner.slotToBanner[slot.key]}"/>
            <c:if test="${storePageBanners!=null}">
              <c:if test="${bannerType eq stripBanner}">
                  <s:layout-render name="/layouts/stripBannerLayout.jsp" storePageBanners="${storePageBanners}" />
              </c:if>
              <c:if test="${fn:contains(heroBanners, bannerType)}">
                  <s:layout-render name="/layouts/categoryBannerLayout.jsp" slot="${slot}" storePageBanners="${storePageBanners}" />
              </c:if>
            </c:if>
          </c:forEach>
        </div>
      </c:if>
    </c:forEach>
  </c:if>
</s:layout-definition>