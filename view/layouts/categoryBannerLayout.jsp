<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 9/19/13
  Time: 5:27 PM
  To change this template use File | Settings | File Templates.
--%>

<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <div id="myCarousel-${slot.key}" class="${slot.name} carousel slide">
    <c:set var="slotMaxHeight" value="${storePageBanners.height}"/>
    <c:set var="slotMaxWidth" value="${storePageBanners.width}"/>
    <c:set var="len" value="${fn:length(storePageBanners.bannerSlotImages)}"/>
    <c:if test="${len>1}">
      <ol class="carousel-indicators">
        <c:forEach begin="0" end="${len-1}" varStatus="counter">
          <li data-target="#myCarousel-${slot.key}" data-interval="3500" data-slide-to="${counter.index}"
              class="active"></li>
        </c:forEach>
      </ol>
    </c:if>
    <ul class="carousel-inner">
      <c:forEach items="${storePageBanners.bannerSlotImages}" var="bannerImage" varStatus="counter">
        <li class="${counter.first? "active":""} item">
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
        </li>
      </c:forEach>
    </ul>
  </div>
</s:layout-definition>