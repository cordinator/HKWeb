<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@ page import="com.hk.constants.marketing.TagConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.variant.StoreVariantAction" var="variantAction"/>
<c:set var="seoData" value="${variantAction.variantPage.seoContent}"/>

<s:layout-render name="/templates/general.jsp"
                 seoData="${seoData}"
                 canonicalUrl="${variantAction.variantPage.canonicalUrl}"
                 pageType="<%=TagConstants.PageType.STORE_VARIANT%>"
                 primaryCategory="${variantAction.variantPage.breadCrumbs[1].name}"
                 secondaryCategory="${variantAction.variantPage.breadCrumbs[2]!=null ? variantAction.variantPage.breadCrumbs[2].name : ''}"
                 tertiaryCategory="${variantAction.variantPage.breadCrumbs[3]!=null ? variantAction.variantPage.breadCrumbs[3].name : ''}"
                 quaternaryCategory="${variantAction.variantPage.breadCrumbs[4]!=null ? variantAction.variantPage.breadCrumbs[4].name : ''}"
                 breadCrumbs="${variantAction.variantPage.breadCrumbs}"
                 brand="${variantAction.storeVariantDetail.brandName}"
                 variantId="${variantAction.storeVariantDetail.id}"
                 productId="${variantAction.storeVariantDetail.storeProductId}"
                 variantOfferPrice="${variantAction.storeVariantDetail.offerPrice}"
                 variantMrp="${variantAction.storeVariantDetail.mrp}"
                 variantDiscount="${variantAction.storeVariantDetail.discount}"
                 variantName="${variantAction.storeVariantDetail.name}"
                 variantImageM="${variantAction.storeVariantDetail.primaryImage.slink}"
                 variantImageS="${variantAction.storeVariantDetail.primaryImage.xxtlink}"
                 oldVariantId="${variantAction.storeVariantDetail.oldVariantId}"
                 navKey="${variantAction.navKey}"
                 oos="${variantAction.storeVariantDetail.oos}"
                 svTags="${variantAction.storeVariantDetail.storeVariantTag.tagList}"
                 cTags="${variantAction.storeVariantDetail.categoryTag.tagList}"
                 bTags="${variantAction.storeVariantDetail.brandTag.tagList}"
    >
<%
  boolean isSecure = WebContext.isSecure();
  pageContext.setAttribute("isSecure", isSecure);

  PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
  if (principal != null) {
    pageContext.setAttribute("user_hash", principal.getUserHash());
    pageContext.setAttribute("gender", principal.getGender());
    pageContext.setAttribute("orderCount", principal.getOrderCount());
  } else {
    pageContext.setAttribute("user_hash", "guest");
    pageContext.setAttribute("gender", null);
    pageContext.setAttribute("orderCount", null);
  }
%>
<s:layout-component name="htmlHead">
  <!--link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nutrition.css"
  media="screen"-->
</s:layout-component>
<s:layout-component name="content">

<c:set var="variant" value="${variantAction.storeVariantDetail}"/>
<c:set var="attrDefaultVariantMap" value="${variantAction.attrDefaultVariantMap}"/>
<c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
<c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>
<c:set var="oos" value="${variant.oos eq true || !variant.orderEnabled }"/>
<c:set var="b1g1Tag"
       value="${fn:contains(variant.storeVariantTag.tagList, 'b1g1') or fn:contains(variant.categoryTag.tagList, 'b1g1') or fn:contains(variant.brandTag.tagList, 'b1g1')}"/>


<div class="mainContainer" id="variant-page">
<div class="container">
  <s:layout-render name="/layouts/breadCrumbLayout.jsp" breadCrumbs="${variantAction.variantPage.breadCrumbs}"/>
</div>
<div class="container clearfix" itemscope itemtype="http://schema.org/Product">

<s:layout-render name="/pages/compare/variantCompareWidget.jsp"/>

<div class="js-hvr-rvw" data-page-type="variant">
  <div class="ttl-cntnr">
    <span class="icn icn-sqre "></span>

    <h1 class="" itemprop="name"> ${ variant.name==null  ? (seoData !=null ? seoData.h1 : '') : variant.name}</h1>
    <span class="icn icn-sqre"></span>
  </div>
  <div class="mrgn-b-20 txt-cntr"  itemprop="aggregateRating" itemscope
       itemtype="http://schema.org/AggregateRating">
    <c:if test="${variant.rating>0}">
      <div class="rating-cont disp-inln" data-status="true" data-varId="${variant.id}"
           data-reviews-count="${variant.numberOfReviews}">

        <div class="rtng-star">
          <div class="rtng-usr" itemprop="ratingValue" content="${variant.rating}"
               style="width:${(variant.rating/5) * 100}%"></div>

        </div>
         <span class="fnt-light disp-inln" data-scroll-target="#reviews-cntnr" data-scroll-time="1000">( <span
             itemprop="reviewCount">${variant.numberOfReviews}</span> reviews )</span>
        <span class="separator">|</span>
      </div>

    </c:if>
    <a class="fnt-light disp-inln" title="more products from ${variant.brand.displayName}" href="${variant.brand.url}">
      more products from ${variant.brand.displayName} &raquo;</a></span>
    <span class="separator">|</span>


    <a href="javascript:void(0)" varid="${variant.id}" catpre="${variant.catPrefix}" name="addToCompare"
       class="addToCompare disp-inln">Add to compare</a>
    <span class="separator">|</span>
    <s:link beanclass="com.hk.web.action.beta.review.StoreVariantReviewAction"
            event="reviewCrud"
            class="fnt-light disp-inln">write a review
      <s:param name="storeVariantId" value="${variantAction.storeVariantDetail.id}"/>
    </s:link>
  </div>
</div>
<div class="mrgn-t-35 row">
<div class="span6 clearContainers">

  <c:if test="${!oos && b1g1Tag}">
    <span class="tag-img tag-img-80">
       <img src="<hk:vhostImage/>/assets/images/buy-1-get-1-80.png" alt="buy one get one"/>
    </span>
  </c:if>

  <div class="img-box img-box-300 parent-img zoomWrapper">
    <c:set var="primaryImage" value="${variant.primaryImage}"/>
      <%--<img src="${primaryImage.mlink}" alt="${primaryImage.altText}"/>--%>
      <%--<img id="img_01" src="${primaryImage.mlink}" alt="${primaryImage.altText}"
           data-zoom-image="${primaryImage.llink}"/>--%>

    <img id="img_01" src="${primaryImage.llink}" alt="${primaryImage.altText}"
         data-zoom-image="${primaryImage.xxlink}"/>

    <c:if test="${primaryImage.fallbackImage eq true}">
      <p class="fallbck-lbl-txt">This image is of a different variant</p>
    </c:if>
  </div>

  <div style="width:88%" class="clearfix">
    <c:set var="thumbsCounter" value="0"/>
    <c:set var="showThumsSection"
           value="${fn:length(variant.images)>1 || variantAction.variantPage.breadCrumbs[1].name == 'Nutrition'}"/>
    <c:if test="${showThumsSection}">
      <ul id="gallery_01" class="mrgn-bt-10 nbs-thumbs">
        <c:if test="${variantAction.variantPage.breadCrumbs[1].name == 'Nutrition'}">
            <span class="campaign-html hide">
                <span class="cont-rht fnt-sz9 fnt-light campaign-hide-box cursor-link" >CLOSE</span>
                <span class="clearfix">
                    <img src="<hk:vhostImage/>/assets/images/animation.gif" class="cont-lft"/>
                    <span class="cont-lft mrgn-l-20">
                        <div class="fnt-bolder">AUTHENTICITY</div>
                        <span class="fnt-caps fnt-bold">GUARANTEED</span>
                    </span>
                </span>

                <hr class="brdr-b-sd2">

                <span class="clearfix">
                    <div>HEALTHKART guarantees</div>
                    <span class=""><span class="fnt-bolder">AUTHENTIC</span> <span
                        class="fnt-bold">supplements</span></span>
                </span>
                <hr class="brdr-b-sd2">
                <span class="clearfix fnt-sz10">
                    Why? Because fake supplements can permanently damage your body
                </span>
                <hr class="brdr-b-sd2">
                <a href="http://www.healthkart.com/pages/authenticity/authenticity.jsp" target="_blank"
                   class="btn btn-blue disp-inln fnt-sz9 mrgn-t-10">READ MORE</a>
            </span>
          <li>
            <c:set var="thumbsCounter" value="${thumbsCounter+1}"/>
            <a href="javascript:void(0)"
               class="">
              <div class="disp-inln img-box img-box-70 parent-img mrgn-r-10">
                <img class="img_campaign mrgn-t-10" src="<hk:vhostImage/>/assets/images/animation.gif"
                     alt="Authenticity for you"/>
              </div>
            </a>
          </li>
        </c:if>
        <c:forEach items="${variant.images}" var="image">
          <c:set var="thumbsCounter" value="${thumbsCounter+1}"/>
          <li>
            <a href="#" data-image="${image.llink}" data-zoom-image="${image.xxlink}"
               class="${image.llink == primaryImage.llink?'active':''}">
              <div class="disp-inln img-box img-box-70 parent-img mrgn-r-10">
                <img id="img_01" src="${image.xtlink}" alt="${image.altText}"/>
              </div>
            </a>
          </li>
        </c:forEach>
      </ul>
    </c:if>
  </div>

</div>
<div class="span10 embedPadding1 zoomWidth">

<div class="row">
  <div class="span7" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
    <c:choose>
      <c:when test="${variant.discount > 0}">
        <span class="strikethrough">Rs. ${variant.mrp}</span>
        | <span class="fnt-caps">You save ${variant.discount}%</span>

        <p class="mrgn-t-5 prc-svning">
          <span class="sucss-txt">Now Rs. ${variant.offerPrice}</span>
        </p>
      </c:when>
      <c:otherwise>
        <p class="mrgn-t-5 prc-svning">
          <span class="sucss-txt">MRP Rs. ${variant.mrp}</span>
        </p>
      </c:otherwise>
    </c:choose>
    <meta itemprop="price" content="${variant.offerPrice}"/>
    <meta itemprop="priceCurrency" content="INR"/>

    <div class="offerbox hide">
      <div class="offer-txt">OFFER</div>
      <div class="loader freebie-txt" id="freebieName">
        <span class="fnt-sz19">(Till Stock Lasts)  </span>

      </div>
    </div>
  </div>

  <div class="span3 text-right">
      <%--<c:choose>
        <c:when test="${variant.oos && variant.notifyMe}">
          <input type="submit" varId="${variant.id}" qty="1" oldVariantId="${variant.oldVariantId}"
                 class="notifyBtn btn btn-orange mrgn-b-5 disp-inln" value="Notify Me">

          <p class="fnt-caps fnt-sz-14 mrgn-t-10 fnt-bold"> Out of stock</p>
        </c:when>
        <c:when test="${variant.oos}">
          <span class="fnt-sz14">Out of stock</span>
        </c:when>
        <c:otherwise>
          <input type="submit" varId="${variant.id}" qty="1" oldVariantId="${variant.oldVariantId}"
                 class="${variant.contactLensLayout eq true ? 'addToCartWithExtOp' : 'addToCart'} btn btn-blue btn2 mrgn-b-5 disp-inln"
                 value="Buy Now">

          <div class="fnt-caps mrgn-t-5">Instock</div>

        </c:otherwise>
      </c:choose>--%>
    <c:choose>
      <c:when test="${variant.showNotifyMe}">
        <input type="submit" varId="${variant.id}" qty="1" oldVariantId="${variant.oldVariantId}"
               class="notifyBtn btn btn-orange mrgn-b-5 disp-inln hide-if-nojs" value="Notify Me">
        <noscript>
          <s:link beanclass="com.hk.web.action.beta.notify.NotifyMeAction"
                  class="notifyBtn btn btn-orange mrgn-b-5 disp-inln">
            <s:param name="storeVariantId" value="${variant.id}"/>
            <s:param name="oldVariantId" value="${variant.oldVariantId}"/>
            <s:param name="variantLink" value="${variantAction.storeVariantDetail.url}"/>
            Notify Me</s:link>
        </noscript>

        <p class="fnt-caps fnt-sz-14 mrgn-t-10 fnt-bold"> Out of stock</p>
      </c:when>
      <c:otherwise>
        <c:choose>
          <c:when test="${variant.oos}">
            <span class="fnt-sz14">Out of stock</span>
          </c:when>
          <c:otherwise>
            <input type="submit" data-scroll-to-top="true" varId="${variant.id}" qty="1" oldVariantId="${variant.oldVariantId}"
                   class="${variant.contactLensLayout eq true ? 'addToCartWithExtOp' : 'addToCart'} btn btn-blue btn2 mrgn-b-5 disp-inln"
                   value="Buy Now">

          <%--<div class="fnt-caps mrgn-t-5">Instock</div>--%>
          </c:otherwise>
        </c:choose>
      </c:otherwise>
    </c:choose>
        <c:if test="${variant.speakToFitnessExpert eq true or variant.speakToNutriExpert eq true}">

          <span class="speakToNutritionBtn  disp-inln fnt-sz10" >
             <img src="<hk:vhostImage/>/assets/images/speak.png" alt="speak"/>
              Speak to a ${variant.speakToFitnessExpert eq true ? 'fitness expert' : 'nutritionist'  }

          </span>

          <%-- <input type="submit" class="speakToNutritionBtn  btn btn-gray disp-inln fnt-sz9"
                  value="Speak to a ${variant.speakToFitnessExpert eq true ? 'fitness expert' : 'nutritionist'  }"/>--%>
        </c:if>

  </div>
</div>
<div class="row">
  <div class="fnt-sz9 span10  mrgn-t-10">

    <c:choose>
      <c:when test="${variant.offerPrice >= variantAction.shippingFreeAfter}">
        <span class="fnt-light">This product is available for Free Shipping.</span>
      </c:when>
      <c:otherwise>
        <span class="fnt-light">Free Shipping if total order amount is Rs. ${variantAction.shippingFreeAfter} or above. Add Rs. ${variantAction.shippingCharges} otherwise.</span>
      </c:otherwise>
    </c:choose>


      <%--dispatch days begins--%>
    <c:choose>
      <c:when test="${variant.dispatchDataAvail}">
        <c:choose>
          <c:when test="${variant.jit eq true}">
          <span class="fnt-light">Dispatched in 6 - 8
            Days
          </span>
          </c:when>
          <c:otherwise>
          <span class="fnt-light">Dispatched in 1 - 3
            Days
          </span>
          </c:otherwise>
        </c:choose>

      </c:when>
      <c:otherwise>
      <span class="fnt-light"> Dispatched in ${variant.minDispatchDays}
        - ${variant.maxDispatchDays}
        Days
      </span>
      </c:otherwise>
    </c:choose>
      <%--ends--%>
  </div>



  <div class="brdr-b span10  mrgn-b-10"></div>
</div>
  <%-- beauty/lens/normal layout begins--%>
<c:choose>
  <c:when test="${variant.contactLensLayout eq true}">
    <s:layout-render name="/layouts/lensLayout.jsp" variant="${variant}"/>

  </c:when>
  <c:otherwise>
    <div>
      <div class="variant-diff-attr-div">
        <c:forEach items="${variant.attributes}" var="attribute">
          <c:set var="selectedValue" value="${variant.selectedAttributes[attribute.name]}"/>
          <div class="diff-attr mrgn-b-10" attr-name="${attribute.name}">
            <label class="bold attr fnt-sz10 fnt-bold" for="${attribute.displayName}">${attribute.displayName}
                     <span>
                         <c:forEach items="${attribute.attrValues}" var="attrValue" varStatus="ctr">
                           <c:set var="attrValCombination"
                                  value="${attribute.name}${filterKeyValueSeperator}${attrValue.internalValue}"/>
                           <c:if test="${fn:toLowerCase(attrValue.internalValue) eq selectedValue}">
                             <c:choose>
                               <c:when test="${attrValue.optionValueType == 50}">
                                 ${attrValue.imageDTO.caption}
                               </c:when>
                               <c:otherwise>
                                 ${attrValue.displayValue}
                               </c:otherwise>
                             </c:choose>
                           </c:if>
                         </c:forEach>
                     </span>
            </label>
            <ul class="gl blocks">
              <c:forEach items="${attribute.attrValues}" var="attrValue" varStatus="ctr">
                <c:set var="attrValCombination"
                       value="${attribute.name}${filterKeyValueSeperator}${attrValue.internalValue}"/>
                <c:choose>
                  <c:when test="${attrValue.optionValueType == 50}">
                    <li attr-val-name="${attrValue.internalValue}"
                        default-variant="${attrDefaultVariantMap[attrValCombination]}"
                        class="img-beauty-circle-45 diff-attr-val ${fn:toLowerCase(attrValue.internalValue) eq selectedValue ? ' selected-val attr-val' : ''} ${fn:length(attribute.attrValues) eq "1" ? 'hide jugadDisplay' : ''}">
                      <img alt="${attrValue.imageDTO.altText}" src="${attrValue.imageDTO.olink}"/>
                    </li>
                  </c:when>
                  <c:otherwise>
                    <li attr-val-name="${attrValue.internalValue}"
                        default-variant="${attrDefaultVariantMap[attrValCombination]}"
                        class="diff-attr-val
                                         ${fn:toLowerCase(attrValue.internalValue) eq selectedValue ? ' selected-val attr-val' : ''} ${fn:length(attribute.attrValues) eq "1" ? 'hide jugadDisplay' : ''}">
                        ${attrValue.displayValue}
                    </li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </ul>
          </div>
        </c:forEach>
      </div>
    </div>
  </c:otherwise>
</c:choose>

  <%-- beauty/lens/normal layout ends--%>
<c:if test="${variant.attributes ne null and fn:length(variant.attributes )>0}">
  <hr>
</c:if>
<div class="row">
  <div class="span10">
    <c:if test="${fn:length(variant.keyPoints)>0}">
      <ul class="sqr-lst mrgn-l-20">
        <c:forEach items="${variant.keyPoints}" var="keyPoint">
          <li><span>${keyPoint}</span></li>
        </c:forEach>
      </ul>
    </c:if>
  </div>
</div>

  ${fn:length(variant.keyPoints)>0 ? '<hr>' : ''}

<%--pincode begins--%>

<%--
<div class="row">

  <div class="span10">
    <div class="js-chk-pin-cntnr hide chk-pin" >
      <label for="pincode" class="disp-inln">
        <img src="<hk:vhostImage/>/assets/images/location.png" alt="check delivery"/>

        Check when this product will be delivered to you</label>
      <input type="text" name="pincode" id="pincode" placeholder="Enter your pincode" tabindex= "10" class="lrge-input-field" value=""/>
      <input type="button" class="btn btn-orange-mini  disp-inln js-chk-pincode" tabindex= "20"  value="Check"/>
    </div>
    <div class="js-chng-pin-cntnr hide fnt-sz10 fnt-ttl chng-pin" >

          <span class="show mrgn-r-10 nt-avail-cntnr">
            <img src="<hk:vhostImage/>/assets/images/alert.png" alt="alert icon"/>
            <span id="nt-avail-msg"> </span>
          </span>

          <span class="disp-inln mrgn-r-10 del-cntnr">
            <img src="<hk:vhostImage/>/assets/images/delivery.png" alt="Delivery"/>
            Dispatch by <span id="dispDate" class="fnt-bolder"> </span>
          </span>

          <span class="disp-inln mrgn-r-10 del-cntnr">
            Delivery by <span id="delDate" class="fnt-bolder"> </span>
          </span>
          <span class=" js-cod-cntnr mrgn-r-10 cod-section" >
            Cash on Delivery available
          </span>
          <span class="disp-inln ">
            Pincode: <span id="chngPincodeVal" class="fnt-bolder"> </span>
            <span class="js-chng-pincode link" > Change</span>
          </span>
    </div>
  </div>
</div>
--%>

<%--pincode ends--%>
</div>

</div>
</div>
</div>

<div class="container clearfix " id="ProductInfoBlock">

  <%--auto compare begins--%>
<c:set var="compareVarIds" value="${variantAction.storeVariantDetail.compareStoreVariantIdsAsString}"/>
<c:if test="${compareVarIds!=''}">
  <div class="row  mrgn-bt-20" id="autoCmpreCont">

    <div class="span16 auto-cmpr-cont">
      <div class="ttl-cntnr mrgn-b-10">
        <span class="icn icn-sqre"></span>

        <h2 class="fnt-caps fnt-sz12"> COMPARE
          TOP ${variantAction.variantPage.breadCrumbs[4]!=null ? variantAction.variantPage.breadCrumbs[4].name : 'products'}</h2>
        <s:link beanclass="com.hk.web.action.beta.variant.StoreVariantCompareAction"
                class="btn btn-blue fnt-sz12 cont-rht" target="_blank">
          compare
          <s:param name="variantIds" value="${compareVarIds}"/>
        </s:link>
      </div>
      <c:forEach items="${variantAction.storeVariantDetail.compareStoreVariants}" var="cmpreItemsList" varStatus="ctr">
        <c:set var="ratingPercent" value="${(cmpreItemsList.rating/5) *100}"/>
        <div class="span4 ${ctr.first ? 'no-mrgn-all' : ''}">
          <div class="cont-lft">
            <div class="img-box img-box-80">
              <a href="${cmpreItemsList.url}" class="">
                <img src="${cmpreItemsList.primaryImage.tlink}" alt="${cmpreItemsList.primaryImage.altText}">
              </a>
            </div>
          </div>
          <div class="cmr-item-info">
            <div class="mrgn-t-10">
              <a href="${cmpreItemsList.url}" class="varnt-max-txt" title="${cmpreItemsList.name}">
                <span class="varnt-title">${cmpreItemsList.name}</span>
              </a>
              <c:if test="${ratingPercent > 0}">
                <div>Rating:
                  <div class="rtng-star-s">
                    <div class="rtng-usr" style="width:${ratingPercent}%"></div>
                  </div>
                </div>
              </c:if>
            </div>
            <div class="varnt-detail">

              <c:if test="${cmpreItemsList.discount > 0}">
                <div class="">

                  <span class="strikethrough">Rs. ${cmpreItemsList.mrp}</span> | <span
                    class="fnt-sz10">${cmpreItemsList.discount}% off</span>

                </div>
              </c:if>
              <div class="final-price">
                Rs. ${cmpreItemsList.offerPrice}
              </div>

            </div>

          </div>

        </div>
      </c:forEach>
    </div>
  </div>
</c:if>

  <%--auto compare ends--%>

  <%--recently viewed/Recommended begins--%>
<div class="row mrgn-bt-30" id="tmWidgetsCont">

  <div id="recentlyViewed" class=" span4 hide ">
    <div class="ttl-cntnr ttl-left">
      <span class="icn icn-dot"></span>

      <h2 class="fnt-bolder fnt-caps fnt-sz12">You recently viewed</h2>
    </div>
    <div class="rec-viewed-parent">
      <ul class="mrgn-bt-10 loader nbs-400 scroll" id="recViewedItemsCont"></ul>
      <p class="hide" id="noRecViewed">You have no recently viewed items</p>

    </div>

  </div>

  <div id="recommendedBestSellerItems" class="no-mrgn-all span12 hide ">
    <div class="ttl-cntnr ttl-left mrgn-l-20">
      <span class="icn icn-dot"></span>

      <h2 class="fnt-bolder fnt-caps fnt-sz12" id="WidgetTitle">Recommended Items</h2>
    </div>
    <div class="recmd-parent">

      <ul class="mrgn-bt-10 loader nbs-400" id="recommendedBestSellerItemsCont"></ul>
    </div>
  </div>

</div>
  <%--recently viewed/Recommended ends --%>
<c:if test="${variantAction.displayNavBar}">
  <div class="row">
    <div class="span4 nav-box-cntnr" id="NavBox">
      <ul class="nav nav-box">
        <li class="menu-head">Jump To</li>
        <li class="menu-options offers-li hide">
          <a href="javascript:void(0)" data-target="#offers">offers<span>&raquo;</span></a>

        </li>
        <li class="menu-options also-bt-li hide">
          <a href="javascript:void(0)" data-target="#alsoBought">also bought<span>&raquo;</span></a>

        </li>
        <c:if test="${variant.groups ne null and fn:length(variant.groups)>0}">
          <li class="menu-options">
            <a href="javascript:void(0)" data-target="#productInfo">info<span>&raquo;</span></a>

          </li>
        </c:if>
        <c:if test="${variant.description ne null}">
          <li class="menu-options">
            <a href="javascript:void(0)" data-target="#productDetails">details<span>&raquo;</span></a>

          </li>
        </c:if>
        <c:forEach items="${variantAction.slotToContent}" var="slotContent">
          <li class="menu-options">
            <a href="javascript:void(0)"
               data-target="#${slotContent.key}">${variantAction.slotKeyToSlotName[slotContent.key]}<span>&raquo;</span></a>

          </li>
        </c:forEach>
        <li class="menu-options">
          <a href="javascript:void(0)" data-target="#reviews-cntnr">reviews<span>&raquo;</span></a>

        </li>
      </ul>
    </div>

    <div class="span12 prdct-dtls-blck" id="ProductDetailsBlock">
      <div id="detailsContainer">
        <div id="offers" class="hide">
          <div class="ttl-cntnr ttl-left">
            <span class="icn icn-dot"></span>

            <h2 class="fnt-bolder fnt-caps">Combo offers with this product</h2>
          </div>
          <ul class="mrgn-bt-10 loader nbs-400 clearfix" id="offersCont"></ul>
        </div>
        <div id="alsoBought" class="hide">
          <div class="ttl-cntnr ttl-left">
            <span class="icn icn-dot"></span>

            <h2 class="fnt-bolder fnt-caps">With this product, people also bought</h2>
          </div>
          <ul class="mrgn-bt-10 loader nbs-400" id="btCont"></ul>
        </div>
        <c:if test="${variant.groups ne null and fn:length(variant.groups)>0}">
          <div id="productInfo" class="ttl-cntnr ttl-left">
            <span class="icn icn-dot"></span>

            <h2 class="fnt-bolder fnt-caps">Info</h2>
          </div>
        </c:if>
        <div class="mrgn-bt-10">
            <%-- ${variant.description}--%>
          <c:forEach items="${variant.groups}" var="group">
            <table class="mrgn-bt-20 mrgn-b-35 cmpre-varnts-tbl">
              <tr group-name="${group.name}" class="specs-hdr-tr">
                <td colspan="5">
                  <div class="varnt-specs-hdr"> ${group.displayName}</div>
                </td>
              </tr>
              <c:forEach items="${group.groupValues}" var="groupValue" varStatus="ctr">
                <c:if test="${ctr.first}">
                  <tr class="top-brdr varnt-specs-tr" group-value-name="${groupValue.name}">
                </c:if>
                <c:if test="${ctr.last}">
                  <tr class="${ctr.index%2==0? 'varnt-specs-tr btm-brdr':'btm-brdr varnt-specs-tr bg-gray'}" group-value-name="${groupValue.name}">
                </c:if>
                <c:if test="${!(ctr.first || ctr.last)}">
                  <tr class="${ctr.index%2==0? 'varnt-specs-tr':' varnt-specs-tr bg-gray'}" group-value-name="${groupValue.name}">
                </c:if>
                <td class="border-td" colspan="1">${groupValue.displayName}</td>
                <td colspan="4">
                  <c:choose>
                    <c:when test="${groupValue.optionValueType == 50}">
                      <div class="img-beauty-circle-25">
                        <img alt="${groupValue.imageDTO.altText}" src="${groupValue.imageDTO.olink}"/>
                      </div>
                    </c:when>
                    <c:otherwise>
                      ${groupValue.value}
                    </c:otherwise>
                  </c:choose>

                </td>
                </tr>
              </c:forEach>
            </table>
          </c:forEach>


        </div>
        <div class="vds">
          <c:if test="${variant.description ne null}">
            <div id="productDetails" class="ttl-cntnr ttl-left">
              <span class="icn icn-dot"></span>

              <h2 class="fnt-bolder fnt-caps">Details</h2>
            </div>
          </c:if>
          <div class="mrgn-bt-10" id="variantVideoCont">
            <p>
                ${variant.video.description}
            </p>

              ${variant.video.url}

              ${variant.description}
          </div>
          <c:forEach items="${variantAction.slotToContent}" var="slotContent">
            <div id="${slotContent.key}" class="ttl-cntnr ttl-left">
              <span class="icn icn-dot"></span>

              <h2 class="fnt-bolder fnt-caps">${variantAction.slotKeyToSlotName[slotContent.key]}</h2>
            </div>
            <div class="">
                ${slotContent.value.value}
            </div>
          </c:forEach>
        </div>

      </div>
      <div id="reviews-cntnr" class=" hd-cntnr">
        <div class="reviews-head" class="mrgn-t-35">
          <div class="ttl-cntnr ttl-left">
            <span class="icn icn-dot"></span>

            <h2 class="fnt-bold fnt-caps">Reviews for product</h2>
          </div>
          <div class="reviews-write txt-cntr clearfix">
            <div class="prefix_2 span4">
              Have you used this product<br>
              Rate it now
            </div>
            <div class="offset4 span3">
              <s:link beanclass="com.hk.web.action.beta.review.StoreVariantReviewAction"
                      event="reviewCrud"
                      class="btn btn-gray">write a review
                <s:param name="storeVariantId" value="${variantAction.storeVariantDetail.id}"/>
              </s:link>
            </div>
            <br>

          </div>
        </div>
        <s:layout-render name="/layouts/reviewLayout.jsp"
                         variantReviews="${variantAction.storeVariantDetail.variantReviewResponse.variantReviews}"/>
        <c:if test="${fn:length(variantAction.storeVariantDetail.variantReviewResponse.variantReviews) > 0}">
          <div class="disp-inln cont-rht">
            <s:link beanclass="com.hk.web.action.beta.review.StoreVariantReviewAction"
                    class=" btn btn-gray">View all Reviews
              <s:param name="storeVariantId" value="${variantAction.storeVariantDetail.id}"/>
            </s:link>
          </div>

        </c:if>


      </div>


    </div>
  </div>
</c:if>
</div>

<%--<s:layout-render--%>
<%--name="/layouts/embed/remarketingWithCustomParams.jsp"--%>
<%--pageType="<%=EnumRemarketingConstants.STORE_VARIANT.getPageType()%>"--%>
<%--primaryCategory="${variantAction.variantPage.breadCrumbs[1].name}"--%>
<%--secondaryCategory="${variantAction.variantPage.breadCrumbs[2]!=null ? variantAction.variantPage.breadCrumbs[2].name : ''}"--%>
<%--tertiaryCategory="${variantAction.variantPage.breadCrumbs[3]!=null ? variantAction.variantPage.breadCrumbs[3].name : ''}"--%>
<%--gender="${gender}"--%>
<%--orderCount="${orderCount}"--%>
<%--brand="${variantAction.storeVariantDetail.brandName}"--%>
<%--variantId="VRNT-${variantAction.storeVariantDetail.id}"--%>
<%--productId="SP-${variantAction.storeVariantDetail.storeProductId}"--%>
<%--variantName="${variantAction.storeVariantDetail.name}"--%>
<%--oldVariantId="${variantAction.storeVariantDetail.oldVariantId}"--%>
<%--/>--%>
<%--<c:if test="${not isSecure }">--%>
<%--<iframe--%>
<%--src="http://www.vizury.com/analyze/analyze.php?account_id=VIZVRM112&param=e200&pid=&catid='${variantAction.variantPage.breadCrumbs[1].name}'&subcat1id='${variantAction.variantPage.breadCrumbs[2]!=null ? variantAction.variantPage.breadCrumbs[2].name : ''}'&subcat2id='${variantAction.variantPage.breadCrumbs[3]!=null ? variantAction.variantPage.breadCrumbs[3].name : ''}'&section=1&level=1&uid=${user_hash}"--%>
<%--scrolling="no" width="1" height="1" marginheight="0" marginwidth="0"--%>
<%--frameborder="0"></iframe>--%>
<%--</c:if>--%>

<c:if test="${variant.showNotifyMe}">
  <s:layout-render name="/layouts/dialogLayout.jsp" dialogId="notifyDialog" layoutType="notifyDialog"
                   dialogTitle="Notify Me" dialogBtn="notify-submit" user="notifyUserName" email="notifyEmail"
                   phone="notifyPhone"/>
</c:if>
<s:layout-render name="/layouts/dialogLayout.jsp" catId="${variant.catPrefix}" dialogId="speakToNutritionistDialog"
                 layoutType="speakToNutritionistLayout" dialogTitle="Speak To A ${variant.speakToFitnessExpert eq true ? 'Fitness Expert' : 'Nutritionist'  } "
                 dialogBtn="speakToNutritionist-submit" user="speakToUserName" email="speakToEmail"
                 phone="speakToPhone"/>

<%--do not delete overlayDiv this is for dialog box--%>
<div id="overlayDIV" class="hide"></div>
</s:layout-component>
<s:layout-component name="scriptComponent">
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/review/review.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/handlebars.min.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/compare/compare.js?v=1.1"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery.elevatezoom.min.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js"></script>
  <script>
    /*
     This object provides a way for author to store page related info, to be used by other methods
     This type of object can be used to store dynamic information generated by jsps
     vpc : variant page config
     */
    HK.vpc = {};
    HK.vpc.showCarousel = false;
    <c:if test="${thumbsCounter > 3}">
    HK.vpc.showCarousel = true;
    </c:if>

    HK.vpc.filterKeyValueSeperator = '${filterKeyValueSeperator}';

    HK.vpc.filterSeperator = '${filterSeperator}';
    HK.vpc.filterValueSeparator = '~';
    HK.vpc.variantId = "${variant.id}";
    HK.vpc.oldVariantId = "${variant.oldVariantId}";

    HK.vpc.availableVariant = {};
    HK.vpc.availableVariantOOS = {};
    <c:forEach items="${variant.availableVariants}" var="availVariantMap" varStatus="ctr">
    HK.vpc.availableVariant["${availVariantMap.key}"] = HK.utils.getTextBeforeSeparator("${availVariantMap.value}", HK.vpc.filterValueSeparator);
    HK.vpc.availableVariantOOS["${availVariantMap.key}"] = HK.utils.getTextAfterSeparator("${availVariantMap.value}", HK.vpc.filterValueSeparator);
    </c:forEach>


  </script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/variant/variant.js?v=2.0"></script>


  <s:layout-render name="/pages/hdtemplates/variantComboItemTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/recommendedBestSellerTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/boughtTogetherItemTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/recentlyViewedTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/variantReviewTemplate.jsp"/>

  <c:if test="${variant.showNotifyMe}">
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/notify/notify.js?v=1.1"></script>
  </c:if>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
</s:layout-component>
</s:layout-render>
