<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>


<s:layout-definition>

  <a class="img-box img-box-180" href="${storeVariantBasic.url}">
    <img src="${storeVariantBasic.primaryImage.slink}" alt="${storeVariantBasic.name}"/>
  </a>

  <div>
    <c:if test="${storeVariantBasic.discount>0}"><span
        class="strikethrough fnt-sz12 fnt-light"> Rs. ${storeVariantBasic.mrp}</span> <span
        class="separator">|</span> <span
        class="fnt-caps">You save ${storeVariantBasic.discount}%</span>
    </c:if>
    <p class="mrgn-b-10 prc-svning">
      <span class="sucss-txt">Now Rs. ${storeVariantBasic.offerPrice}</span>
    </p>


  </div>

  <%--TODO #  This Needs to be checked on the Basis OF Offer Available with Current Variant, Right NOW HARDCODED  --%>

  <%--<div class="offer-box">--%>
  <%--<p> Limited time offer | Get Puresoft(140ml) Free</p>--%>
  <%--</div>--%>

  <%--<s:link class="btn btn-blue btn2 mrgn-t-35" beanclass="com.hk.web.action.beta.variant.StoreVariantAction" event="pre">--%>
  <%--<s:param name="storeVariantId" value="${storeVariantBasic.id}" />BUY NOW--%>
  <%--</s:link>--%>
  <%--<c:choose>
    <c:when test="${storeVariantBasic.oos && storeVariantBasic.notifyMe}">
      <input type="button" varId="${storeVariantBasic.id}" qty="1" oldVariantId="${storeVariantBasic.oldVariantId}"
             class="notifyBtn btn btn-orange mrgn-b-5" value="Notify Me"/>

      <p class="fnt-caps fnt-sz-14 mrgn-t-10 fnt-bold"> Out of stock</p>
    </c:when>
    <c:when test="${storeVariantBasic.oos && storeVariantBasic.notifyMe}">
      <span class="fnt-sz14">Out of stock</span>
    </c:when>
    <c:otherwise>
      <input type="button" varId="${storeVariantBasic.id}" qty="1" oldVariantId="${storeVariantBasic.oldVariantId}"
             class="addToCart btn btn-blue btn2 mrgn-b-5" value="Buy Now"/>
    </c:otherwise>
  </c:choose>--%>
  <c:choose>
    <c:when test="${storeVariantBasic.showNotifyMe}">
      <input type="button" varId="${storeVariantBasic.id}" qty="1" oldVariantId="${storeVariantBasic.oldVariantId}"
             class="notifyBtn btn btn-orange mrgn-b-5 hide-if-nojs" value="Notify Me"/>

      <noscript>
        <s:link beanclass="com.hk.web.action.beta.notify.NotifyMeAction" class="notifyBtn btn btn-orange mrgn-b-5 disp-inln">
          <s:param  name="storeVariantId" value="${storeVariantBasic.id}" />
          <s:param name="oldVariantId" value="${storeVariantBasic.oldVariantId}"/>
          <s:param name="variantLink" value="${storeVariantBasic.url}" />
          Notify Me</s:link>
      </noscript>

      <p class="fnt-caps fnt-sz-14 mrgn-t-10 fnt-bold"> Out of stock</p>
    </c:when>
    <c:otherwise>
      <c:choose>
        <c:when test="${storeVariantBasic.oos}">
          <span class="fnt-sz14">Out of stock</span>
        </c:when>
        <c:otherwise>
          <input type="button" varId="${storeVariantBasic.id}" qty="1" oldVariantId="${storeVariantBasic.oldVariantId}"   catPrefix="${storeVariantBasic.catPrefix}"
             class="addToCart btn btn-blue btn2 mrgn-b-5" value="Buy Now"/>
        </c:otherwise>
      </c:choose>
    </c:otherwise>
  </c:choose>

  <c:if test="${storeVariantBasic.siblingVariants != 0}">
    <p class="txt-light mrgn-t-10">(${storeVariantBasic.siblingVariants} more variants available)</p>
  </c:if>
</s:layout-definition>