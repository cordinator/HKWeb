<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.catalog.CatalogAction" var="catalogAction"/>

<s:layout-definition>
  <jsp:useBean id="msCatalogBean" class="com.hk.web.action.beta.microsite.MicrositeCatalogBean"></jsp:useBean>
  <jsp:setProperty name="msCatalogBean" property="vid" value="${vid}"/>
  <jsp:getProperty name="msCatalogBean" property="func"/>
  <style>
    .btn.btn-blue {
      font-size: 1em;
      margin-top: 10px;
      padding: 5px;
    }

    .cat-cont, .varnt-cont {
      height: 410px;
    }
  </style>
  <div class="mainContainer">
    <div class="container clearfix">
      <div class="row " id="catContainer">
        <div class="span16 prdct-dtls-blck ">
          <div id="variantResultView">

            <c:forEach items="${msCatalogBean.variants}" var="variant" varStatus="ctr">
              <c:if test="${variant.oos == false}">
              <div class="varnt-cont">

                <c:if test="${fn:length(variant.freebieName)>0}">
                  <span class="offer-txt">OFFER</span>

                </c:if>
                <s:link class="img-box img-box-180  ${variant.oos ? 'img-inactive' : '' }"
                        href="/sv/clearance${variant.urlFragment}">
                  <img alt="${variant.name}" src="${variant.primaryImage.slink}"
                       width="200" height="200"/>
                  <s:param name="navKey" value="${variant.navKey}"/>
                </s:link>
                <c:if test="${variant.oos}">
                  <s:link class="oos-cntnr sz180" href="/sv/clearance${variant.urlFragment}">
                    Out of Stock
                  </s:link>
                </c:if>


                <div class="mrgn-t-10">
                  <s:link href="/sv/clearance${variant.urlFragment}">
                  <span class="varnt-title">${variant.name}</span>
                  <c:if test="${variant.rating>0}">
                    <div>Rating:
                      <div class="rtng-star-s">
                        <div class="rtng-usr" style="width:${(variant.rating/5) * 100}%"></div>
                      </div>

                    </div>
                  </c:if>
                </div>
                <s:param name="navKey" value="${variant.navKey}"/>
                </s:link>

                <div class="varnt-detail">
                  <c:if test="${variant.siblingVariants > 0}">
                    <div class="varnt-availble">(${variant.siblingVariants} more variants available)</div>
                  </c:if>
                  <c:if test="${fn:length(variant.freebieName)>0}">
                    <div class="fnt-sz10" style="color:#333;text-decoration:underline">${variant.freebieName} FREE</div>
                  </c:if>

                  <div class="">
                    <c:if test="${variant.discount > 0}">
                      <span class="strikethrough">Rs. ${variant.mrp}</span> | <span
                        class="csOff">${variant.discount}% off</span>
                    </c:if>
                  </div>
                  <div class="final-price">
                    Rs. ${variant.offerPrice}
                  </div>
                  <c:if test="${showAddToCart eq true}">
                    <c:choose>
                      <c:when test="${variant.oos}">
                        <span class="fnt-sz14 mrgn-t-10 show">Out of stock</span>
                      </c:when>
                      <c:otherwise>
                        <input type="submit" varId="${variant.id}" qty="1" oldVariantId="${variant.oldVariantId}"
                               class="${variant.contactLensLayout eq true ? 'addToCartWithExtOp' : 'addToCart'} btn btn-blue btn2 mrgn-b-5 disp-inln"
                               value="Add To Cart">

                      </c:otherwise>
                    </c:choose>
                  </c:if>
                </div>
              </div>
              </c:if>
              <c:if test="${variant.oos == true}">
                  <input type="hidden" value="${variant.id}" name=oos class="outOfStock"/>
              </c:if>
            </c:forEach>
          </div>
        </div>
      </div>
    </div>
  </div>

</s:layout-definition>




