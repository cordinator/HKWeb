<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.hk.constants.variant.review.ReviewVoteTypeEnum" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>

<s:layout-definition>
  <c:set var="HK_USER" value="<%=RoleConstants.HK_USER%>"/>
  <c:set var="HKUNVERIFIED" value="<%=RoleConstants.HK_UNVERIFIED%>"/>
  <ul class="gl reviews-list mrgn-t-35">
    <c:forEach items="${variantReviews}" var="reviewObject">
      <li class="reviews-item" itemprop="review" itemscope itemtype="http://schema.org/Review">
        <div class="review-for">
          <c:set var="variantUrl" value="${reviewObject.url}"/>
          <c:choose>
            <c:when test="${variantUrl ne null}">
              This review is for <a href="${reviewObject.url}"
                                    itemprop="itemReviewed">${reviewObject.storeVariantName}</a>
            </c:when>
            <c:otherwise>
              This review is for ${reviewObject.storeVariantName}
            </c:otherwise>
          </c:choose>
        </div>
        <div class="rtng-star-s">
          <div itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating" class="rtng-usr"
               style="width:${(reviewObject.starRating/5) * 100}%">
            <meta itemprop="ratingValue" content="${reviewObject.starRating}"/>
          </div>
        </div>
        <span class="review-title" itemprop="name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${reviewObject.title}</span><br>

        <p>
          <span class="review-user-name" itemprop="author"> ${reviewObject.userName}</span>
          <span class="separator">|</span> <span class="review-date" itemprop="datePublished"
                                                 content="<fmt:formatDate type="date" pattern="yyyy-MM-d" value="${reviewObject.reviewDate}"/>"><fmt:formatDate
            type="date" value="${reviewObject.reviewDate}"/></span>
          <c:if test="${reviewObject.positiveVotes!=0}">
            <span class="separator">|</span> <span class="review-date">${reviewObject.positiveVotes} people found this review useful</span>
          </c:if>
        </p>

        <p class="review-description" itemprop="reviewBody">
            ${reviewObject.review}
        </p>
        <shiro:hasAnyRoles name="${HK_USER},${HKUNVERIFIED}">
          <div class="review-action">
            <p>
              <span class="review-advice">Help other customer find the most helpful reviews</span><br>
              Was this review helpful?
            </p>

            <div class="mrgn-t-10 clearfix">
              <div class="span2 alpha">
                <a href="javascript:void(0)" class="review btn btn-gray fnt-sz9 pad-lr-20" reviewId="${reviewObject.id}"
                   reviewTypeId="<%=ReviewVoteTypeEnum.POSITIVE_VOTE.getId()%>">Yes</a>
              </div>
              <div class="span2">
                <a href="javascript:void(0)" class="review btn btn-gray fnt-sz9 pad-lr-20" reviewId="${reviewObject.id}"
                   reviewTypeId="<%=ReviewVoteTypeEnum.NEGATIVE_VOTE.getId()%>">No</a>
              </div>
              <div class="span3">
                  <%-- <span class="fnt-sz16">|</span>--%>
                <span class="icn icn-sqre"></span>
                <a href="javascript:void(0)" class="review" reviewId="${reviewObject.id}"
                   reviewTypeId="<%=ReviewVoteTypeEnum.SPAM.getId()%>">Report as Spam</a>
              </div>
            </div>
          </div>
        </shiro:hasAnyRoles>
      </li>
    </c:forEach>
  </ul>

</s:layout-definition>