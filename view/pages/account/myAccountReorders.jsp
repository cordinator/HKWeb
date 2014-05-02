<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 06/08/13
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp" pageTitle="My Account | Healthkart">
<s:useActionBean beanclass="com.hk.web.action.beta.account.MyAccountReorderAction" var="reorderAction"/>
<c:set var="tabId" value="${reorderAction.tabId}"/>

<s:layout-component name="content">
<div class="mainContainer">
<div class="container clearfix">
  <%--breadcrumbs begins--%>
<div class="hk-breadcrumb-cntnr">
          <span>
  <a href="/" title="Home">

  Home
            </a>
          </span>
  <span>&raquo;</span>
          <span>
            <s:link beanclass="com.hk.web.action.beta.account.MyAccountAction">
              Account
            </s:link>
          </span>
  <span>&raquo;</span>
          <span class="fnt-bold">
          Re-Orders
          </span>
</div>
  <%--breadcrumbs ends--%>
  <%--unverified email Msg begins--%>
<shiro:hasRole name="<%=RoleConstants.HK_UNVERIFIED%>">

  <div class="err-cntnr" id="actLinkDiv">
    <span class="icn-warning-small"></span>

    <div>
      <ul>
        <li>Your email id is not verified, kindly click on the link sent to your mail to apply offer coupons.
          <a class="txt-blue" href="javascript:void(0)" id="actLink"> Click here</a> to resend the email.
        </li>
      </ul>
    </div>
    <span class="icn icn-close2 remove-error"></span>
  </div>
</shiro:hasRole>
  <%--unverified email Msg ends--%>

  <%--Error/success Msg begins--%>
<s:layout-render name="/layouts/errorLayout.jsp"/>
  <%--Error/success Msg ends--%>

<div class="ttl-cntnr">
  <span class="icn icn-sqre "></span>

  <h1>Re-Orders</h1>
  <span class="icn icn-sqre"></span>
</div>

<div class="row my-acnt-ht">
  <div class="span4">
    <s:layout-render name="/layouts/accountNavigationLayout.jsp" tabId="${tabId }"/>
  </div>
  <div class="span12">

    <c:choose>
      <c:when test="${reorderAction.recentOrdersAvailable eq false}">
        No order was placed by you till now!
      </c:when>
      <c:otherwise>
        <table class="accnt-order-tbl">
          <thead>
          <tr>
            <th class="tbl-title">Order Id</th>
            <th class="tbl-title">Products</th>
            <th class="tbl-title">Price</th>
            <th class="tbl-title"></th>
          </tr>
          </thead>
          <c:forEach items="${reorderAction.recentOrdersApiResponse.orders}" var="recentOrder" varStatus="trCtr">
            <tbody class="brdr-b-sd">
              <%--Add Extra Spacing here for next packvarint/variant begins--%>
            <tr>
              <td colspan="4">
                <div class="mrgn-b-20"></div>
              </td>
            </tr>
              <%--Add Extra Spacing here for next packvarint/variant ends--%>

            <tr>
              <td>${recentOrder.gatewayOrderId} <p>${recentOrder.orderDate}</p></td>
              <c:set var="isVariantAvailable" value="false"/>
              <c:forEach items="${recentOrder.shoppingCartVariants}" var="orderVariant" varStatus="ctr">
              <c:set var="isVariantAvailable" value="true"/>
              <td>
                <div class="span5 alpha">
                  <div class="span2 alpha text-center">
                    <div class="img-box img-box-80">
                      <a href="${hk:getShoppingCartVariantUrl(orderVariant)}">
                        <img src="${orderVariant.catalogStoreVariantImageVO.slink}"
                             alt="${orderVariant.catalogStoreVariantImageVO.altText}">
                      </a>
                    </div>
                  </div>
                  <div class="span3 omega">
                    <div><a href="${hk:getShoppingCartVariantUrl(orderVariant)}">${orderVariant.name} </a>
                    </div>
                  </div>
                </div>
              </td>
              <td class="price">
                Rs. ${orderVariant.variantTotalOfferPrice}
                  <c:if test="${orderVariant.variantTotalOfferPrice != orderVariant.variantTotalMrp}">
                  <p class="strikethrough">
                    Rs. ${orderVariant.variantTotalMrp}
                  </p>
                  </c:if>
              </td>
              <td class="buy-cntnr">
                <div class="span2 alpha">
                  <input type="submit" varid="${orderVariant.storeVariantId}" qty="${orderVariant.qty}"
                         class="addToCart  btn btn-gray mrgn-b-5" value="Buy Now">
                </div>
              </td>
              <c:if test="${!ctr.last}">
            </tr>
              <%--Add Extra Spacing here for next packvarint/variant begins--%>
            <tr>
              <td colspan="4">
                <div class="mrgn-b-20"></div>
              </td>
            </tr>
              <%--Add Extra Spacing here for next packvarint/variant ends--%>
            <tr>
              <td></td>
              </c:if>
              </c:forEach>
              <c:if test="${isVariantAvailable eq true}">
            </tr>
              <%--Add Extra Spacing here for next packvarint/variant begins--%>
            <tr>
              <td colspan="4">
                <div class="mrgn-b-20"></div>
              </td>
            </tr>
              <%--Add Extra Spacing here for next packvarint/variant ends--%>
            </c:if>

              <%--pack list rendering begins--%>
            <c:forEach items="${recentOrder.shoppingCartPacks}" var="orderPackVariantList" varStatus="ctr">
              <c:if test="${isVariantAvailable eq true}">
                <tr>
                <td></td>
              </c:if>
              <c:set var="isVariantAvailable" value="true"/>
              <%--<c:set var="packVarSize" value="${(fn:length(orderPackVariantList.packVariants)/2)+1}"/>
              <fmt:formatNumber var="packVarSize" value="${packVarSize}" maxFractionDigits="0"/>--%>
              <c:set var="packVariants" value=""/>
              <c:forEach items="${orderPackVariantList.packVariants}" var="packVariant" varStatus="ctr1">
                <c:choose>
                  <c:when test="${packVariants eq ''}">
                    <c:set var="packVariants" value="${packVariant.storeVariantId}"/>
                  </c:when>
                  <c:otherwise>
                    <c:set var="packVariants" value="${packVariants},${packVariant.storeVariantId}"/>
                  </c:otherwise>
                </c:choose>
                <td>
                  <div class="span5 alpha">
                    <div class="span2 alpha text-center">
                      <div class="img-box img-box-80">
                        <a href="${hk:getShoppingCartVariantUrl(packVariant)}">
                          <img src="${packVariant.catalogStoreVariantImageVO.slink}"
                               alt="${packVariant.catalogStoreVariantImageVO.altText}">
                        </a>
                      </div>
                    </div>
                    <div class="span3 omega">
                      <div varId="${packVariant.storeVariantId}"><a
                          href="${hk:getShoppingCartVariantUrl(packVariant)}">${packVariant.name} </a>
                      </div>
                    </div>
                  </div>
                </td>
                <c:choose>
                  <c:when test="${(ctr1.first)}">
                    <td class="price">
                      Rs. ${orderPackVariantList.packTotalOfferPrice} <p
                        class="strikethrough">Rs. ${orderPackVariantList.packTotalMrp}</p>
                    </td>
                    <td class="buy-cntnr">
                      <div class="span2 alpha">
                        <input type="submit" data-packId="${orderPackVariantList.packId}"
                               data-qty="${orderPackVariantList.packQty}" data-storeVariantIdsInPackStr=""
                               class="addPackToCartReorder  btn btn-gray mrgn-b-5" value="Buy Now"/>
                      </div>
                    </td>
                  </c:when>
                  <c:otherwise>
                    <td></td>
                    <td></td>
                  </c:otherwise>
                </c:choose>
                <c:if test="${!ctr1.last}">
                  </tr>

                  <tr>
                    <td></td>
                    <td><span class="icn icn-plus"></span>
                    </td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                  <td></td>
                </c:if>
              </c:forEach>
              </tr>
              <tr class="hide">
                  <c:if test="${packVariants!=null and packVariants!=''}">
                      <td><input type="hidden" value="${packVariants}" class="pckVariants"/></td>
                  </c:if>
              </tr>

              <%--Add Extra Spacing here for next packvarint/variant begins--%>
              <tr>
                <td colspan="4">
                  <div class="mrgn-b-20"></div>
                </td>
              </tr>
              <%--Add Extra Spacing here for next packvarint/variant ends--%>

              <%--pack list rendering ends--%>

            </c:forEach>

            </tbody>
          </c:forEach>
        </table>
      </c:otherwise>
    </c:choose>


  </div>

</div>
</div>
</s:layout-component>
<s:layout-component name="scriptComponent">
  <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/cart/cart.js"></script>
  <script type="text/javascript">
    $(document).ready(function () {
      $('.addPackToCartReorder').each(function () {
        var currEle = $(this);
        var pckVariantsCntnr = currEle.parents('tr').siblings('.hide').children('td').children('.pckVariants').val();
        currEle.attr('data-storeVariantIdsInPackStr', pckVariantsCntnr);
        // console.log(pckVariantsCntnr);


      });
      $('.addPackToCartReorder').click(function (e) {
        e.preventDefault();
        var elm = $(this);
        var packId = elm.attr('data-packId');
        var qty = elm.attr('data-qty');
        var storeVariantIdsInPackStr = elm.attr('data-storeVariantIdsInPackStr');
        //console.log(packId + 'is packid');
        //console.log(qty + 'is qty');
        //console.log(storeVariantIdsInPackStr + 'is storeVariantIdsInPackStr');
        HK.cartUpdater.addPackToCart(elm, packId, qty, storeVariantIdsInPackStr);
      })
    });


  </script>
</s:layout-component>
</s:layout-render>