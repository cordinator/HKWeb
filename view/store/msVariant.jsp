<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.microsite.MicrositeStoreVariantAction" var="variantAction"/>


<s:layout-render name="/store/msGeneral.jsp">
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

<s:layout-component name="msHeader">
  <c:choose>
    <c:when test="${variantAction.storeName != null}">
      <s:layout-render name="/store/${variantAction.storeName}/${variantAction.storeName}Header.jsp"/>
    </c:when>
    <c:otherwise>
      <s:layout-render name="/store/${variantAction.brandName}/${variantAction.brandName}Header.jsp"/>
    </c:otherwise>
  </c:choose>
</s:layout-component>

<s:layout-component name="msContent">
<c:set var="variant" value="${variantAction.storeVariantDetail}"/>
<c:set var="attrDefaultVariantMap" value="${variantAction.attrDefaultVariantMap}"/>
<c:set var="filterSeperator" value="<%=RequestConstants.FILTER_SEP%>"/>
<c:set var="filterKeyValueSeperator" value="<%=RequestConstants.FILTER_KEY_AND_VAL_SEP%>"/>
<style>
  .ttl-cntnr h1 {
    margin-bottom: 4px;
  }
</style>
<div class="mainContainer" id="variant-page">
<div class="container clearfix">


<div class="marginBox" itemscope itemtype="http://schema.org/Product">
  <div class="ttl-cntnr">
    <span class="icn icn-sqre "></span>

    <h1 class="" itemprop="name"> ${ variant.name==null  ? (seoData !=null ? seoData.h1 : '') : variant.name}</h1>
    <span class="icn icn-sqre"></span>
  </div>
  <div class="mrgn-b-20 txt-cntr" style="line-height: 15px;" itemprop="aggregateRating" itemscope
       itemtype="http://schema.org/AggregateRating">
    <c:if test="${variant.rating>0}">

      <div class="rtng-star">
        <div class="rtng-usr" itemprop="ratingValue" content="${variant.rating}"
             style="width:${(variant.rating/5) * 100}%"></div>
      </div>
      <span class="fnt-light disp-inln" data-scroll-target="#reviews-cntnr" data-scroll-time="1000">( <span
          itemprop="reviewCount">${variant.variantReviewResponse.totalResults}</span> reviews )</span>
      <span class="separator">|</span>

    </c:if>
    <a class="fnt-light disp-inln" title="more products from ${variant.brand.displayName}" href="${variant.brand.url}">
      more products from ${variant.brand.displayName} &raquo;</a></span>
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
  <div class="img-box img-box-300 parent-img zoomWrapper">
    <c:set var="primaryImage" value="${variant.primaryImage}"/>

    <img id="img_01" src="${primaryImage.llink}" alt="${primaryImage.altText}"
         data-zoom-image="${primaryImage.llink}"/>
      <%--<p>${primaryImage.caption}</p>--%>
  </div>
  <div style="width:88%" class="clearfix">
    <c:if test="${fn:length(variant.images)>1}">
      <ul id="gallery_01" class="mrgn-bt-10 nbs-thumbs">
        <c:forEach items="${variant.images}" var="image">
          <li>
            <a href="#" data-image="${image.llink}" data-zoom-image="${image.llink}"
               class="${image.llink == primaryImage.llink?'active':''}">
              <div class="disp-inln img-box img-box-70 parent-img mrgn-r-10">
                <img id="img_01" src="${image.xxtlink}" alt="${image.altText}"/>
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
    <div class="span6" itemprop="offers" itemscope itemtype="http://schema.org/Offer">
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
            <span class="sucss-txt">MRP Rs. ${variant.offerPrice}</span>
          </p>
        </c:otherwise>
      </c:choose>
      <meta itemprop="price" content="${variant.offerPrice}"/>
      <meta itemprop="priceCurrency" content="INR"/>

      <div class="offerbox hide">
        <div class="offer-txt">OFFER</div>
        <div class="loader freebie-txt" id="freebieName">
          <p class="fnt-sz10">Till Stock Lasts</p>
        </div>
      </div>
    </div>

    <div class="span4 text-right">
      <c:choose>
        <c:when test="${variant.showNotifyMe}">
          <input type="submit" varId="${variant.id}" qty="1" oldVariantId="${variant.oldVariantId}"
                 class="notifyBtn btn btn-orange mrgn-b-5 disp-inln" value="Notify Me">

          <p class="fnt-caps fnt-sz-14 mrgn-t-10 fnt-bold"> Out of stock</p>
        </c:when>
        <c:otherwise>
          <c:choose>
            <c:when test="${variant.oos}">
              <span class="fnt-sz14">Out of stock</span>
            </c:when>
            <c:otherwise>
              <input type="submit" varId="${variant.id}" qty="1" oldVariantId="${variant.oldVariantId}"
                     class="${variant.contactLensLayout eq true ? 'addToCartWithExtOp' : 'addToCart'} btn btn-blue btn2 mrgn-b-5 disp-inln"
                     value="Buy Now">

              <div class="fnt-caps mrgn-t-5">Instock</div>
            </c:otherwise>
          </c:choose>
        </c:otherwise>
      </c:choose>
    </div>
  </div>
  <div class="row">
    <div class="fnt-sz9 span7 ">

      <c:choose>
        <c:when test="${variant.offerPrice >= variantAction.shippingFreeAfter}">
          <span class="fnt-light">This product is available for Free Shipping</span>
        </c:when>
        <c:otherwise>
          <span class="fnt-light">Free Shipping if total order amount is Rs. ${variantAction.shippingFreeAfter} or above. Add Rs. ${variantAction.shippingCharges} otherwise</span>
        </c:otherwise>
      </c:choose>

    </div>


    <c:choose>
      <c:when test="${variant.dispatchDataAvail}">
        <c:choose>
          <c:when test="${variant.jit eq true}">
            <div class="fnt-sz9 span3 text-right">DISPATCHED IN 6 - 8
              DAYS
            </div>
          </c:when>
          <c:otherwise>
            <div class="fnt-sz9 span3 text-right">DISPATCHED IN 1 - 3
              DAYS
            </div>
          </c:otherwise>
        </c:choose>

      </c:when>
      <c:otherwise>
        <div class="fnt-sz9 span3 text-right"> DISPATCHED IN ${variant.minDispatchDays}
          - ${variant.maxDispatchDays}
          DAYS
        </div>
      </c:otherwise>
    </c:choose>


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
              <label class="bold attr" for="${attribute.displayName}">${attribute.displayName}
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
    <div class="span5">
      <c:if test="${fn:length(variant.keyPoints)>0}">
        <ul class="sqr-lst mrgn-l-20 mrgn-b-35">
          <c:forEach items="${variant.keyPoints}" var="keyPoint">
            <li><span>${keyPoint}</span></li>
          </c:forEach>
        </ul>
      </c:if>
    </div>
    <c:if test="${variant.speakToFitnessExpert eq true or variant.speakToNutriExpert eq true}">
      <div class="span5 txt-rgt">
        <input type="submit" class="speakToNutritionBtn btn btn-gray disp-inln fnt-sz9"
               value="Speak to a ${variant.speakToFitnessExpert eq true ? 'fitness expert' : 'nutritionist'  }"/>
      </div>
    </c:if>
  </div>

</div>

</div>
</div>
</div>

<div class="container clearfix " id="ProductInfoBlock">
  <c:if test="${variantAction.displayNavBar}">
    <div class="row">
      <div class="span4 nav-box-cntnr" id="NavBox">
        <ul class="nav nav-box">
          <li class="menu-head">Jump To</li>

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
            <div class="mrgn-bt-10">
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
</div>

<c:if test="${variant.showNotifyMe}">
  <s:layout-render name="/layouts/dialogLayout.jsp" dialogId="notifyDialog" layoutType="notifyDialog"
                   dialogTitle="Notify Me" dialogBtn="notify-submit" user="notifyUserName" email="notifyEmail"
                   phone="notifyPhone"/>
</c:if>
<s:layout-render name="/layouts/dialogLayout.jsp" catId="${variant.catPrefix}" dialogId="speakToNutritionistDialog"
                 layoutType="speakToNutritionistLayout" dialogTitle="Speak To A Fitness Expert "
                 dialogBtn="speakToNutritionist-submit" user="speakToUserName" email="speakToEmail"
                 phone="speakToPhone"/>

<%--do not delete overlayDiv this is for dialog box--%>
<div id="overlayDIV" class="hide"></div>
</s:layout-component>

<s:layout-component name="msFooter">
  <c:choose>
    <c:when test="${variantAction.storeName != null}">
      <s:layout-render name="/store/${variantAction.storeName}/${variantAction.storeName}Footer.jsp"/>
    </c:when>
    <c:otherwise>
      <s:layout-render name="/store/${variantAction.brandName}/${variantAction.brandName}Footer.jsp"/>
    </c:otherwise>
  </c:choose>
</s:layout-component>

<s:layout-component name="msScriptComponent">
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/review/review.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/handlebars.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery.elevatezoom.js"></script>
  <script>
    /*
     This object provides a way for author to store page related info, to be used by other methods
     This type of object can be used to store dynamic information generated by jsps
     vpc : variant page config
     */
    HK.vpc = {};
    HK.vpc.showCarousel = false;
    <c:if test="${fn:length(variant.images)>3}">
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
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/variant/variant.js"></script>

  <script type="text/javascript">
    $(document).ready(function () {
      $(window).scroll(function () {
        var initialHeight = $(".prdct-dtls-blck").offset().top + 20;
        var bottomHeight = $("#footer").offset().top - $(".nav-box-cntnr").height();
        $(".nav-box-cntnr").css("top", initialHeight);
        if ($(window).scrollTop() > initialHeight) {
          if ($(window).scrollTop() < bottomHeight) {
            $('.nav-box-cntnr').css({
              position: 'fixed',
              top: 10
            });
          } else {
            $('.nav-box-cntnr').css({
              position: 'absolute',
              top: bottomHeight
            });
          }
        } else {
          $('.nav-box-cntnr').css({
            position: 'absolute',
            top: initialHeight
          });
        }
      });
    });
  </script>
  <c:if test="${variant.showNotifyMe}">
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/notify/notify.js"></script>
  </c:if>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
</s:layout-component>
</s:layout-render>
