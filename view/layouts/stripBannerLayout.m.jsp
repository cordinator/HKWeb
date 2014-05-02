<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 9/19/13
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <c:forEach items="${storePageBanners.bannerSlotImages}" var="bannerImage" varStatus="counter">
      <c:choose>
        <c:when test="${bannerImage.landingPage!=null}">
        <div>
          <a href="${bannerImage.landingPage}" style="background:url(${bannerImage.olink})no-repeat center center;background-size:100%;"></a>
          </div>
        </c:when>
        <c:otherwise>
        <div>
        <a href="javascript:void(0);" style="background:url(${bannerImage.olink})no-repeat center center;background-size:100%;"></a>
        </div>
        </c:otherwise>
      </c:choose>
  </c:forEach>
</s:layout-definition>