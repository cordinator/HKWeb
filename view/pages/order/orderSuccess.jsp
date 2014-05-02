<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp" type="paymentFlow">
<s:useActionBean beanclass="com.hk.web.action.beta.order.payment.PaymentReceiveAction" var="selectPaymentModeAction"/>
<s:layout-component name="content">
<div class="mainContainer">
<div class="container clearfix ">

  <%-- checkout strip flow begins--%>
<div class="ttl-cntnr">
                  <span class="icn icn-sqre">
                  </span>

  <h1 class="chckout-hdr"> Checkout </h1>

  <span class="icn icn-sqre"></span>
</div>


<div class="ttl-cntnr">
  <span class="page-title"> Shipping address </span>
  <span class="page-title "> Payment </span>
  <span class="page-title current"> Order complete </span>
</div>


  <%--checkout strip flow ends--%>
<div class="span16 mrgn-t-35">

  <c:set var="orderPlacedDetails" value="${selectPaymentModeAction.orderPlacedApiResponse}"/>
  <c:set var="shippingAddress" value="${orderPlacedDetails.shippingAddress}"/>
  <c:set var="orderPlacedDetailsDto" value="${orderPlacedDetails.orderPlacedDetailsDto}"/>
  <div class="span5">
    <p class="mrgn-b-10 fnt-caps">order details:</p>

    <p class="mrgn-b-10"><span class="fnt-caps">status:</span> <span
        class="prc-ofr">${orderPlacedDetails.orderStatus}</span></p>

    <p><span class="fnt-caps">order id:</span> ${orderPlacedDetails.gatewayOrderId}</p>

    <p class="mrgn-b-10"><span class="fnt-caps">you pay:</span> ${orderPlacedDetailsDto.totalPayable}</p>

    <p class="mrgn-b-10"><span class="fnt-caps">total items:</span> ${orderPlacedDetails.itemsInOrder}</p>
  </div>

  <div class="span5 shipping-add-cntnr alpha">
    <p class="fnt-caps mrgn-b-10">order shipped to:</p>

    <p>${shippingAddress.name}</p>

    <p>${shippingAddress.line1}, ${shippingAddress.landMark}<c:if test="${fn:length(shippingAddress.landMark)>0}">, </c:if></p>

    <p>${shippingAddress.cityName},</p>

    <p>${shippingAddress.stateName} - ${shippingAddress.pincode}</p>

    <p>Ph: ${shippingAddress.contactNumber} <c:if test="${fn:length(shippingAddress.alternateContactNumber)>0}">, </c:if>
    ${shippingAddress.alternateContactNumber}</p>

  </div>

  <div class="span5">
    <p class="fnt-caps mrgn-b-10">important information:</p>

    <p>
      The estimated dispatch time for each
      product is mentioned below. The
      delivery time would be extra and will
      vary according to your location.
    </p>

    <p><span class="icn icn-sqre-blue"></span>
      <a href="#">learn more</a>
    </p>


  </div>
</div>

  <%--  <div class="span16 mrgn-t-50">
      <div class="loyalty-cntnr">
        <p class="span9 loyalty-text">
          Did you know staticpages our Loyalty program. Its an easy way to earn points and redeem goodies. And this order
          just helped you earn 15 points. Set up your password here to become a member.</p>

        <form action="" method="">
          <div class="span4">
            <label for="emailId">Email address</label>
            <input type="text" name="emailId" id="emailId" class="" tabindex="10" value="">
          </div>
          <div class="span4">
            <label for="user-name">Name</label>
            <input type="text" name="user-name" id="user-name" class="" tabindex="10" value="">
          </div>
          <div class="span4">
            <label for="password">Password</label>
            <input type="text" name="password" id="password" class="" tabindex="10" value="">
          </div>
          <div class="span4">
            <label for="rpassword">Re-type password</label>
            <input type="text" name="rpassword" id="rpassword" class="" tabindex="10" value="">
          </div>
          <div class="span5 mrgn-bt-20">
            <input type="submit" value="Create Account" class="btn btn-blue">
          </div>
        </form>
      </div>
    </div>--%>
<div class="span16 mrgn-t-50">
  <div class="span11 alpha">
    <div class="span11 alpha order-hdr-cntnr">
      <div class="span5 alpha">YOU BOUGHT</div>
      <div class="span1">QTY</div>
      <div class="span2">DISPATCH</div>
      <div class="span2 omega">PRICE</div>
    </div>
    <hr>
    <c:forEach items="${orderPlacedDetailsDto.shoppingCartVariants}" var="shoppingCartVariant">
      <div class="span11 alpha order-smry-cntnr">
        <div class="span5 alpha">
          <div class="span2 alpha">
            <div class="img-box-80">
              <img name="tumbnail" src="${shoppingCartVariant.catalogStoreVariantImageVO.slink}"
                   alt="${shoppingCartVariant.catalogStoreVariantImageVO.altText}"/>
            </div>
          </div>
          <div class="span3 omega">
            <p>${shoppingCartVariant.name} </p>
          </div>
        </div>
        <div class="span1">
            <div class="brdr text-center">
                ${shoppingCartVariant.qty}
            </div>
        </div>
        <div class="span2">
            ${shoppingCartVariant.minDispatchDays} - ${shoppingCartVariant.maxDispatchDays} DAYS
        </div>
        <div class="span2 price">
          <div class="prc-ofr">Rs. ${shoppingCartVariant.variantTotalOfferPrice}</div>
          <c:if test="${shoppingCartVariant.variantTotalMrp != shoppingCartVariant.variantTotalOfferPrice}">
            <div class="prc-actl">Rs.${shoppingCartVariant.variantTotalMrp}</div>
          </c:if>
        </div>
      </div>
    </c:forEach>

    <c:forEach items="${orderPlacedDetailsDto.shoppingCartPacks}" var="pack">
      <div class="span11 alpha packs" data-id="${pack.packId}">
        <c:forEach items="${pack.packVariants}" var="cartItem" varStatus="packCounter">
          <div class="row" data-role="item" data-id="${cartItem.storeVariantId}">
            <div class="span5">
              <div class="span2 alpha text-center">
                <div class="img-box img-box-80">
                  <a href="${hk:getShoppingCartVariantUrl(cartItem)}">
                    <img name="tumbnail" src="${cartItem.catalogStoreVariantImageVO.slink}"
                         alt="${cartItem.catalogStoreVariantImageVO.altText}"/>
                  </a>
                </div>
              </div>
              <div class="span3 omega">
                <div><a href="${hk:getShoppingCartVariantUrl(cartItem)}">${cartItem.name}</a></div>
              </div>
            </div>
            <div id="stepper" class="span1">
              <c:if test="${packCounter.index == 0}">
                <div class="brdr text-center">
                  ${pack.packQty}
                </div>
              </c:if>
            </div>
            <div class="span2">
              <span>${cartItem.minDispatchDays}</span> - <span>${cartItem.minDispatchDays}</span> DAYS
            </div>
            <div class="span2 price">
              <c:if test="${packCounter.index == 0}">
                <div class="prc-ofr">Rs. <span data-role="item-offer-price">${pack.packTotalOfferPrice}</span>
                </div>
                <div class="prc-actl">Rs. <span data-role="item-mrp-price">${pack.packTotalMrp}</span></div>
                <%--<a href="javascript:void(0)" data-role="pack-remove" class="icn icn-close2" style="position:relative;left:100px;top:-40px"></a>--%>
              </c:if>
            </div>
          </div>
          <div class=clear></div>
        </c:forEach>
      </div>
    </c:forEach>
  </div>
  <div class="span5">
    <div class="fnt-caps fnt-light mrgn-b-20">
      Payment details
    </div>
    <div class="row">
      <div class="span2">
        <div class="">Total MRP</div>
      </div>
      <div class="span2">
        Rs. <span class="prc-actl">${orderPlacedDetailsDto.totalMrp}</span>
      </div>
    </div>
    <div class="row">
      <div class="span2">
        <div class="">healthkart price</div>
      </div>
      <div class="span2">
        <span class="fnt-sz13"> Rs. ${orderPlacedDetailsDto.totalOfferPrice}</span>
      </div>
    </div>
    <hr>
    <div class="row">
      <div class="span2">
        <div class="">Discount</div>
      </div>
      <div class="span2">
        - Rs. <span class="" data-role="total-save"><fmt:formatNumber type="number"
                                                                      value="${orderPlacedDetailsDto.totalMrp - orderPlacedDetailsDto.totalOfferPrice}"
                                                                      maxFractionDigits="2"/></span>
      </div>
        <%--<div class="span2">
          <div class="">Reward points applied</div>
        </div>
        <div class="span2">
          - Rs. 300
        </div>--%>
    </div>
    <hr>
    <div class="row">
      <div class="span2">
        <div class="">Shipping</div>
      </div>
      <div class="span2">
                <span class="fnt-caps"
                      data-role="shipping-charges">${orderPlacedDetailsDto.shippingCharges > 0 ? orderPlacedDetailsDto.shippingCharges : 'FREE'}</span>
      </div>
    </div>
    <hr>
    <div class="row">
      <div class="span2">
        <div class="fnt-light fnt-caps">You Pay</div>
      </div>
      <div class="span2">
        <span class="fnt-sz13">Rs.<span data-role="total-payable">${orderPlacedDetailsDto.totalPayable}</span></span>
      </div>
    </div>
    <div class="row mrgn-t-35">
      <div class="span5 ">
        <a href="/" class="btn btn-blue" title="Home">
          GO BACK TO HEALTHKART.COM
        </a>
      </div>

    </div>
  </div>
</div>
</div>
<style>
    .packs{
    padding: 10px 0;
    border-bottom: 1px solid #cccccc;
    }
    .packs:last-child{
        border-bottom: none;
    }
</style>
</s:layout-component>
</s:layout-render>