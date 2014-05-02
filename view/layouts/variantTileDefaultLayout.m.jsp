<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
	 <a class="pd_hldr" href="${variantBasicResponse.url}">
	 <c:if test="${!variantBasicResponse.oos && variantBasicResponse.freebieName != null}">
        <span class="offer-text">OFFER</span>
    </c:if>
		<div class="pd_image left" style="background:url('${variantBasicResponse.primaryImage.tlink}')no-repeat center center;background-size:contain;">
		  
       
        <noscript><img src="${variantBasicResponse.primaryImage.tlink}"
                       alt="${variantBasicResponse.primaryImage.altText}"/></noscript>
		</div>
	 <div class="pd_info left"><div class="pd_name font12">${variantBasicResponse.name}</div>
	 <div class="pd_summ"><div class=""><c:if test="${variantBasicResponse.rating > 0}">
          <div class="rtng-star-s">
            <div class="rtng-usr"
                 style="width:${(variantBasicResponse.rating /5 ) * 100}%"></div>
          </div>
      </c:if>
										 
	 </div>
	<c:if test="${variantBasicResponse.siblingVariants != 0}">
        <div class="varnt-availble">(${variantBasicResponse.siblingVariants} more variants available)</div>
      </c:if>
       <c:if test="${variantBasicResponse.discount > 0}">
        <div class="pd_old_price font12">Rs. ${variantBasicResponse.mrp}</div>
        <div class="pd_discount font12">${variantBasicResponse.discount}% off</div>
      </c:if>				 
										 <div class=" font15"> Rs. ${variantBasicResponse.offerPrice}</div>
									 </div>
						   </div>
						   <div class="clear"></div>
 </a><!-- pd_hldr ends -->


</s:layout-definition>