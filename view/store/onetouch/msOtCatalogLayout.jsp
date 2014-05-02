<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:useActionBean beanclass="com.hk.web.action.beta.catalog.CatalogAction" var="catalogAction"/>

<s:layout-definition>
  <jsp:useBean id="msCatalogBean" class="com.hk.web.action.beta.microsite.MicrositeCatalogBean"></jsp:useBean>
  <jsp:setProperty name="msCatalogBean" property="vid" value="${vid}"/>
  <jsp:getProperty name="msCatalogBean" property="func"/>
  <%--<%--%>
    <%--Map variantDetailMap = new HashMap();--%>
    <%--variantDetailMap.put(new Long(6705), "A Simple meter with sound alerts to notify you of high and low blood sugar results");--%>
    <%--variantDetailMap.put(new Long(6698), "A Smart way to check your blood sugar on the go");--%>
    <%--variantDetailMap.put(new Long(48252), "A fast, `gentle and simple way to see the effect of food on your blood sugar results");--%>
    <%--pageContext.setAttribute("variantDetailMap", variantDetailMap);--%>
  <%--%>--%>
  <style>


  </style>
  <div>
    <div>
      <div id="catContainer">
        <div class=" ">
          <div id="variantResultView">
            <c:set var="variantThreshold" value="4"/>
            <c:forEach items="${msCatalogBean.variants}" var="variant" varStatus="ctr">

              <div class="varnt-cont">

                <c:if test="${fn:length(variant.freebieName)>0}">
                  <span class="offer-txt">OFFER</span>

                </c:if>
                <c:if test="${variant.discount > 0}">
                <div class="discountOt">

                    <span class="">${variant.discount}%<br/> off</span>

                </div>
                </c:if>
                <s:link class="img-box img-box-180  ${variant.oos ? 'img-inactive' : '' }"
                        href="/mcsv${variant.urlFragment}">
                  <img alt="${variant.name}" src="${variant.primaryImage.slink}"
                       width="200" height="200"/>
                  <s:param name="navKey" value="${variant.navKey}"/>
                </s:link>

                <div class="strikethroughOt">
                  <c:if test="${variant.discount > 0}">
                    <span class="">Rs. ${variant.mrp}</span>
                  </c:if>
                </div>



                <div class="final-price">
                  Rs. ${variant.offerPrice}
                </div>


                <c:if test="${showAddToCart eq true}">
                  <c:choose>
                    <%--<c:when test="${variant.oos}">--%>
                    <c:when test="${variant.oos}">
                      <span class="fnt-sz14 mrgn-t-10 show">Out of stock</span>
                    </c:when>
                    <c:otherwise>
                      <input type="submit" varId="${variant.id}" qty="1" oldVariantId="${variant.oldVariantId}"
                             class="${variant.contactLensLayout eq true ? 'addToCartWithExtOp' : 'addToCart'} otBtn disp-inln"
                             value="">

                    </c:otherwise>
                  </c:choose>
                </c:if>

                <c:if test="${variant.oos}">
                  <s:link class="oos-cntnr sz180" href="/mcsv${variant.urlFragment}">
                    Out of Stock
                  </s:link>
                </c:if>


                <div class="varnt-titleOt">
                  <s:link href="/mcsv${variant.urlFragment}">
                  <span class="">${variant.name}</span>



                </div>
                <s:param name="navKey" value="${variant.navKey}"/>
                </s:link>

                <div class="varnt-detail">


                  <c:if test="${variantDetailMap[variant.id] != null}">
                    <div class="description">
                        ${variantDetailMap[variant.id]}
                    </div>
                  </c:if>


                  <c:if test="${fn:length(variant.freebieName)>0}">
                    <div class="fnt-sz10" style="color:#333;text-decoration:underline">${variant.freebieName} FREE</div>
                  </c:if>
                  <s:link href="/mcsv${variant.urlFragment}">
                    <div class="proOtView"> View the Product &raquo; </div>
                  </s:link>


                </div>
              </div>
              <c:if test="${(ctr.count)/variantThreshold ==1}">

                  <div class="clear"></div>
              </c:if>
            </c:forEach>
          </div>
        </div>
      </div>
    </div>
  </div>

</s:layout-definition>




