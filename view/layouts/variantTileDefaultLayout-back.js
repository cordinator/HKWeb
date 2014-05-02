<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>

	 <div class="pd_hldr left">
			<div class="pd_image left " style="background: url(../../imgs/pd-sample.png)no-repeat left center;
background-size: contain;"> 
		   <a href="${variantBasicResponse.url}" class="${variantBasicResponse.oos eq true ? 'img-inactive' : ''}"
         class="">
        <img class="lazy" data-original="${variantBasicResponse.primaryImage.mlink}"
             src="<hk:vhostImage/>/assets/images/pixel.png"
             alt="${variantBasicResponse.primaryImage.altText}"/>
        <noscript><img src="${variantBasicResponse.primaryImage.mlink}"
                       alt="${variantBasicResponse.primaryImage.altText}"/></noscript>

      </a>
</div>
						   <div class="pd_info left">
									 <div class="pd_name font12"><a href="${variantBasicResponse.url}">
        <span class="varnt-title">${variantBasicResponse.name}</span>
      </a></div>
									 <div class="pd_summ">
										 <div class="">
										 		      <c:if test="${variantBasicResponse.rating > 0}">
        <div>
          <div class="rtng-star-s">
            <div class="rtng-usr"
                 style="width:${(variantBasicResponse.rating /5 ) * 100}%"></div>
          </div>
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
 </div><!-- pd_hldr ends -->


  <!-- div class="varnt-cont">
    <c:if test="${!variantBasicResponse.oos && variantBasicResponse.freebieName != null}">
        <span class="offer-txt">OFFER</span>
    </c:if>
    <div class="img-box img-box-200 ">
      <a href="${variantBasicResponse.url}" class="${variantBasicResponse.oos eq true ? 'img-inactive' : ''}"
         class="">
        <img class="lazy" data-original="${variantBasicResponse.primaryImage.mlink}"
             src="<hk:vhostImage/>/assets/images/pixel.png"
             alt="${variantBasicResponse.primaryImage.altText}"/>
        <noscript><img src="${variantBasicResponse.primaryImage.mlink}"
                       alt="${variantBasicResponse.primaryImage.altText}"/></noscript>

      </a>
    </div>
    <c:if test="${variantBasicResponse.oos eq true}">
      <a class="oos-cntnr" href="${variantBasicResponse.url}">
        Out of Stock
      </a>
    </c:if>
    <div class="mrgn-t-10">
      <a href="${variantBasicResponse.url}">
        <span class="varnt-title">${variantBasicResponse.name}</span>
      </a>
      <c:if test="${variantBasicResponse.rating > 0}">
        <div>Rating:
          <div class="rtng-star-s">
            <div class="rtng-usr"
                 style="width:${(variantBasicResponse.rating /5 ) * 100}%"></div>
          </div>
        </div>
      </c:if>
    </div>
    <div class="varnt-detail">
      <c:if test="${variantBasicResponse.siblingVariants != 0}">
        <div class="varnt-availble">(${variantBasicResponse.siblingVariants} more variants available)</div>
      </c:if>
      <c:if test="${!variantBasicResponse.oos && variantBasicResponse.freebieName != null}">
          <div class="fnt-sz10" style="color:#333;text-decoration:underline">${variantBasicResponse.freebieName} FREE</div>
      </c:if>
      <c:if test="${variantBasicResponse.discount > 0}">
        <div>
          <span class="strikethrough">Rs. ${variantBasicResponse.mrp}</span> | <span
            class="fnt-sz10">${variantBasicResponse.discount}% off</span>
        </div>
      </c:if>
      <div class="final-price">
        Rs. ${variantBasicResponse.offerPrice}
      </div>

    </div>
  </div -->
</s:layout-definition>