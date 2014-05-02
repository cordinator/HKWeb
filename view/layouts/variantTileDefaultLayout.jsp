<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <div class="varnt-cont">

    <c:set var="oos" value="${variantBasicResponse.oos eq true || !variantBasicResponse.orderEnabled }"/>
    <c:set var="b1g1Tag"
           value="${fn:contains(variantBasicResponse.storeVariantTag.tagList, 'b1g1') or fn:contains(variantBasicResponse.categoryTag.tagList, 'b1g1') or fn:contains(variantBasicResponse.brandTag.tagList, 'b1g1')}"/>

    <c:if test="${!oos && variantBasicResponse.freebieName != null }">
      <span class="offer-txt">OFFER</span>
    </c:if>
    <c:if test="${!oos && b1g1Tag}">
      <span class="tag-img tag-img-50">
        <img src="<hk:vhostImage/>/assets/images/buy-1-get-1-50.png" alt="buy one get one"/>
      </span>
    </c:if>

      <div class="img-box img-box-180 ">

        <a href="${variantBasicResponse.url}" class="${variantBasicResponse.oos eq true ? 'img-inactive' : ''}"
           class="">
            <%--<img class="lazy" data-original="${variantBasicResponse.primaryImage.mlink}"
                 src="<hk:vhostImage/>/assets/images/pixel.png"
                 alt="${variantBasicResponse.primaryImage.altText}"/>
            <noscript><img src="${variantBasicResponse.primaryImage.mlink}"
                           alt="${variantBasicResponse.primaryImage.altText}"/></noscript>--%>
          <img src="${variantBasicResponse.primaryImage.slink}"
               alt="${variantBasicResponse.primaryImage.altText}"/>

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

          <div class="">
            <div class="disp-inln fnt-light fnt-sz10">
              Rating:
              <div class="rtng-star-s">
                <div class="rtng-usr" style="width:${(variantBasicResponse.rating /5 ) * 100}%">

                </div>
              </div>
            </div>
            <div class="disp-inln fnt-light fnt-sz9 "> ( ${variantBasicResponse.numberOfReviews} reviews)</div>

          </div>

        </c:if>
      </div>
      <div class="varnt-detail">
        <c:if test="${variantBasicResponse.siblingVariants != 0}">
          <div class="varnt-availble">(${variantBasicResponse.siblingVariants} more variants available)</div>
        </c:if>
        <c:if test="${!variantBasicResponse.oos && variantBasicResponse.freebieName != null}">
          <div class="fnt-sz10" style="color:#333;text-decoration:underline">${variantBasicResponse.freebieName} FREE
          </div>
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
    </div>
</s:layout-definition>