<%@ page import="com.hk.common.constants.RequestConstants" %>
<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@ page import="com.hk.constants.marketing.TagConstants" %>
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
<style>
  .ttl-cntnr h1 {
    margin-bottom: 4px;
  }
</style>
<div class="mainContainer" id="variant-page">
<div class="container clearfix">
<s:layout-render name="/layouts/breadCrumbLayout.jsp" breadCrumbs="${variantAction.variantPage.breadCrumbs}"/>
<%--<s:layout-render name="/pages/compare/variantCompareWidget.jsp"/>--%>

<div class="marginBox">
  <div class="ttl-cntnr">
    <span class="icn icn-sqre "></span>

    <h1 class=""> ${variant.name}</h1>
    <span class="icn icn-sqre"></span>
  </div>
  <%--<div class="mrgn-b-20 txt-cntr" style="line-height: 15px;" itemprop="aggregateRating" itemscope
       itemtype="http://schema.org/AggregateRating">
    <c:if test="${variant.rating>0}">

      <div class="rtng-star">
        <div class="rtng-usr" itemprop="ratingValue" content="${variant.rating}"
             style="width:${(variant.rating/5) * 100}%"></div>
      </div>
      <span class="fnt-light disp-inln">( <span
          itemprop="reviewCount">${variant.variantReviewResponse.totalResults}</span> reviews )</span>
      <span class="separator">|</span>

    </c:if>
    <a href="javascript:void(0)" varid="${variant.id}" catpre="${variant.catPrefix}" name="addToCompare"
       class="addToCompare disp-inln">Add to compare</a>
    <span class="separator">|</span>
    <s:link beanclass="com.hk.web.action.beta.review.StoreVariantReviewAction"
            event="reviewCrud"
            class="fnt-light disp-inln">write a review
      <s:param name="storeVariantId" value="${variantAction.storeVariantDetail.id}"/>
    </s:link>
  </div>--%>
</div>
<div class="mrgn-t-35 row">
  <div class="span6 clearContainers">
    <div class="img-box img-box-300 parent-img zoomWrapper">
      <c:set var="primaryImage" value="${variant.primaryImage}"/>
        <%--<img src="${primaryImage.mlink}" alt="${primaryImage.altText}"/>--%>
      <%--<img id="img_01" src="${primaryImage.mlink}" alt="${primaryImage.altText}"
           data-zoom-image="${primaryImage.llink}"/>--%>
      <img id="img_01" src="${primaryImage.llink}" alt="${primaryImage.altText}"
           data-zoom-image="${primaryImage.llink}"/>
        <%--<p>${primaryImage.caption}</p>--%>
    </div>

  </div>
  <div class="span10 embedPadding1 zoomWidth">

    <div class="row">
      <div class="span6">
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


      </div>

      <div class="span4 text-right">
        <c:choose>
          <c:when test="${variant.oos && variant.notifyMe}">
            <input type="submit" varId="${variant.id}" qty="1" oldVariantId="${variant.oldVariantId}"
                   class="notifyBtn btn btn-orange mrgn-b-5 disp-inln hide-if-nojs" value="Notify Me">
            <noscript>
              <s:link beanclass="com.hk.web.action.beta.notify.NotifyMeAction" class="notifyBtn btn btn-orange mrgn-b-5 disp-inln">
                <s:param  name="storeVariantId" value="${variant.id}" />
                <s:param name="oldVariantId" value="${variant.oldVariantId}"/>
                <s:param name="variantLink" value="${variantAction.storeVariantDetail.url}" />
                Notify Me</s:link>
            </noscript>


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
            <div class="fnt-sz9 ">DISPATCHED IN ${variant.minDispatchDays} - ${variant.maxDispatchDays} DAYS</div>
          </c:otherwise>
        </c:choose>


      </div>
    </div>

      <%-- beauty/lens/normal layout begins--%>

      <%-- beauty/lens/normal layout ends--%>

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

    </div>

  </div>

</div>
</div>
</div>

<div class="container clearfix mrgn-t-20" id="ProductInfoBlock">
  <c:if test="${variantAction.displayNavBar}">
    <div class="row">
      <div class="span4 nav-box-cntnr" id="NavBox">
        <ul class="nav nav-box">
          <li class="menu-head">Jump To</li>
                     <c:if test="${variant.groups ne null and fn:length(variant.groups)>0}">
            <li class="menu-options">
              <a href="#productInfo">info<span>&raquo;</span></a>

            </li>
          </c:if>
          <c:if test="${variant.description ne null}">
            <li class="menu-options">
              <a href="#productDetails">details<span>&raquo;</span></a>

            </li>
          </c:if>
          <c:forEach items="${variantAction.slotToContent}" var="slotContent">
            <li class="menu-options">
              <a href="#${slotContent.key}">${variantAction.slotKeyToSlotName[slotContent.key]}<span>&raquo;</span></a>

            </li>
          </c:forEach>


            <%--
            <li class="no-brdr menu-options">
                <a href="javascript:void(0)" data-target="#header">back to top <span>&raquo;</span></a>

            </li>--%>
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


      </div>
    </div>
  </c:if>
</div>
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

<c:if test="${variant.oos}">
  <s:layout-render name="/layouts/dialogLayout.jsp" dialogId="notifyDialog" layoutType="notifyDialog"
                   dialogTitle="Notify Me" dialogBtn="notify-submit" user="notifyUserName" email="notifyEmail"
                   phone="notifyPhone"/>
</c:if>
<%--
<s:layout-render name="/layouts/dialogLayout.jsp" catId="${variant.catPrefix}" dialogId="speakToNutritionistDialog"
                 layoutType="speakToNutritionistLayout" dialogTitle="Speak To A Fitness Expert "
                 dialogBtn="speakToNutritionist-submit" user="speakToUserName" email="speakToEmail"
                 phone="speakToPhone"/>
--%>

<%--do not delete overlayDiv this is for dialog box--%>
<div id="overlayDIV" class="hide"></div>
</s:layout-component>
<s:layout-component name="scriptComponent">
  <%--<script type="text/javascript" src="<hk:vhostJs/>/assets/js/review/review.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/handlebars.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/compare/compare.js"></script>
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

    HK.vpc.variantId = "${variant.id}";
    HK.vpc.oldVariantId = "${variant.oldVariantId}";

    HK.vpc.availableVariant = {
      <c:forEach items="${variant.availableVariants}" var="availVariantMap" varStatus="ctr">
      "${availVariantMap.key}": "${availVariantMap.value}"
      <c:if test="${!ctr.last}">, </c:if>
      </c:forEach>
    };
  </script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/variant/variant.js"></script>
  <s:layout-render name="/pages/hdtemplates/variantComboItemTemplate.jsp"/>
  <s:layout-render name="/pages/hdtemplates/boughtTogetherItemTemplate.jsp"/>--%>

  <c:if test="${variant.oos}">
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/notify/notify.js?v=1.1"></script>
  </c:if>
 <%-- <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>--%>
</s:layout-component>
</s:layout-render>
