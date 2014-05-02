<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.hk.constants.variant.review.ReviewVoteTypeEnum" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>

<s:layout-definition>
  <c:set var="HK_USER" value="<%=RoleConstants.HK_USER%>" />
  <c:set var="HKUNVERIFIED" value="<%=RoleConstants.HK_UNVERIFIED%>" />
    
    
    
     <c:forEach items="${variantReviews}" var="reviewObject">
    <div class="user_review bd_btm font12">
    		 <div > <div class="rtng-star-s"><span itemprop="reviewRating" itemscope itemtype="http://schema.org/Rating" class="rtng-usr" style="width:${(reviewObject.starRating/5) * 100}%">
                <meta itemprop="ratingValue" content="${reviewObject.starRating}"/>
            </span></div> <a href="${reviewObject.url}" itemprop="itemReviewed">${reviewObject.storeVariantName}</a>
            </div>
            
    		  <div class="mt5" itemprop="author"> ${reviewObject.userName}</div>
    		  <div class="mt5 grey_text">
    		  <span itemprop="datePublished" content="<fmt:formatDate type="date" pattern="yyyy-MM-d" value="${reviewObject.reviewDate}"/>"><fmt:formatDate type="date" value="${reviewObject.reviewDate}"/></span>
            <c:if test="${reviewObject.positiveVotes!=0}">
                <span class="separator">|</span> <span >${reviewObject.positiveVotes} people found this review useful</span>
            </c:if>
            </div>
    		  <p class="review-description mt10" itemprop="reviewBody">
               ${reviewObject.review}
          </p>
          
          
          <shiro:hasAnyRoles name="${HK_USER},${HKUNVERIFIED}">
          <div class="review-action">
            <div class="mt10 grey_text">Help other customer find the most helpful reviews</div>
            <div class="mt3">Was this review helpful to you?</div>
            
            <div class="mt10">
              <div class="inline review_btn_hldr">
                <a href="javascript:void(0)" class="btn grey inline" reviewId="${reviewObject.id}" reviewTypeId="<%=ReviewVoteTypeEnum.POSITIVE_VOTE.getId()%>" >Yes</a>
                <a href="javascript:void(0)" class="btn grey inline" reviewId="${reviewObject.id}" reviewTypeId="<%=ReviewVoteTypeEnum.NEGATIVE_VOTE.getId()%>" >No</a>
              </div>
                <a href="javascript:void(0)" class="grey_text" reviewId="${reviewObject.id}" reviewTypeId="<%=ReviewVoteTypeEnum.SPAM.getId()%>" >Report as Spam</a>
              
            </div>
            
            
          </div>
          </shiro:hasAnyRoles>
          
    		 
    		  
    		  
    	</div>
     </c:forEach>

  </s:layout-definition>