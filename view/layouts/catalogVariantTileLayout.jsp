<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <div class="varnt-cont">

    <c:set var="oos" value="${variant.oos eq true || !variant.orderEnabled }"/>
    <c:set var="b1g1Tag" value="${fn:contains(variant.storeVariantTag.tagList, 'b1g1') or fn:contains(variant.categoryTag.tagList, 'b1g1') or fn:contains(variant.brandTag.tagList, 'b1g1')}"/>


    <c:if test="${!oos && variant.freebieName != null }">
      <span class="offer-txt">OFFER</span>
    </c:if>

    <c:if test="${!oos && b1g1Tag}">
      <span class="tag-img tag-img-50">
        <img src="<hk:vhostImage/>/assets/images/buy-1-get-1-50.png" alt="buy one get one"/>
      </span>
    </c:if>


    <div class="img-box img-box-180 ">
      <a class="${oos eq true ? 'img-inactive' : ''}" href="${variant.url}">
        <img alt="${variant.name}" src="${variant.medImg.slink}"/>
      </a>
    </div>

    <c:if test="${oos}">
      <a class="oos-cntnr" href="${variant.url}">
        Out of Stock
      </a>
    </c:if>

    <div class="mrgn-t-10">
      <a href="${variant.url}">
        <span class="varnt-title">${variant.name}</span>
      </a>
      <c:if test="${variant.rating > 0}">
        <div class="rating-cont rtng-cat" data-status="true" data-varId="${variant.id}"
             data-reviews-count="${variant.numberOfReviews}">
          <div class="disp-inln fnt-light fnt-sz10">
            Rating:
            <div class="rtng-star-s">
              <div class="rtng-usr" style="width:${(variant.rating /5 ) * 100}%">

              </div>
            </div>
          </div>
          <div class="disp-inln fnt-light fnt-sz9 "> ( ${variant.numberOfReviews} reviews)</div>
          <span class="right-arrw-blck"></span>

        </div>
      </c:if>
    </div>

    <div class="varnt-detail cont-lft add-varnt-cont">
      <c:if test="${variant.siblingVariants > 0}">
        <div class="varnt-availble">(${variant.siblingVariants} more variants available)</div>
      </c:if>
      <c:if test="${!oos && variant.freebieName != null}">
        <div class="fnt-sz10" style="color:#333;text-decoration:underline">${variant.freebieName} FREE</div>
      </c:if>
      <div class="">
        <c:if test="${variant.discount > 0}">
            <span class="strikethrough">Rs. <fmt:formatNumber value="${variant.mrp}"
                                                              maxFractionDigits="0"/></span> | <span
            class="fnt-sz10"><fmt:formatNumber value="${variant.discount}" maxFractionDigits="0"/>% off</span>
        </c:if>
      </div>
      <div class="final-price">
        Rs. <fmt:formatNumber value="${variant.offerPrice}" maxFractionDigits="0"/>

      </div>

    </div>
    <div class="varnt-cmpare mrgn-bt-5 cont-lft">
      <a href="javascript:void(0)" varId="${variant.id}" catPre="${variant.catPrefix}" name="addToCompare"
         class="addToCompare">Add to Compare &raquo;</a>
    </div>
  </div>
</s:layout-definition>