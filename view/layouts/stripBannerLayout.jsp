<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 9/19/13
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <div class="strip-banner">
    <c:set var="slotMaxHeight" value="${storePageBanners.height}"/>
    <c:set var="slotMaxWidth" value="${storePageBanners.width}"/>
    <c:forEach items="${storePageBanners.bannerSlotImages}" var="bannerImage" varStatus="counter">
      <c:choose>
        <c:when test="${bannerImage.landingPage!=null}">
          <a href="${bannerImage.landingPage}">
            <img src="${bannerImage.olink}"
                 style="max-height:${slotMaxHeight}px; max-width:${slotMaxWidth}px;"
                 alt="${bannerImage.altText}"/>
          </a>
        </c:when>
        <c:otherwise>
          <img src="${bannerImage.olink}"
               style="max-height:${slotMaxHeight}px; max-width:${slotMaxWidth}px;"
               alt="${bannerImage.altText}"/>
        </c:otherwise>
      </c:choose>
    </c:forEach>
  </div>
</s:layout-definition>