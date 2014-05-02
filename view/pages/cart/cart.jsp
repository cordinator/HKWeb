<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp">
<s:useActionBean beanclass="com.hk.web.action.beta.cart.CartAction" var="cartAction"/>
<s:layout-component name="content">
<c:set var="inSession" value="true"/>

<shiro:hasRole name="<%=RoleConstants.TEMP_USER%>">
  <c:set var="inSession" value="false"/>
</shiro:hasRole>

<c:set var="shoppingCartPricingDto" value="${cartAction.validatedShoppingCartResponse.shoppingCartPricingDto}"/>
<c:set var="cartItems" value="${shoppingCartPricingDto.shoppingCartVariants}"/>
<c:set var="packs" value="${shoppingCartPricingDto.shoppingCartPacks}"/>

<style>
  /**cart page rules *starts**/

  .cart-cntnr .cart-offr-avlbl {
    text-align: center;
  }

  .cart-cntnr .cart-offr-avlbl span {
    text-align: center;
    font-size: 14px;
    padding: 10px;
    display: inline-block;
    border: 1px solid #ddd;
    cursor: pointer;
  }

  .cart-cntnr .cart-prdct-tbl .img-box {
    border: 1px solid #ddd;
  }

  .cart-cntnr .cart-prdct-tbl .row {
    padding-bottom: 20px;
    padding-top: 20px;
  }

  .cart-cntnr .cart-prdct-tbl hr {
    margin: 0px;
  }

  .cart-cntnr .cart-prdct-tbl .packs {
    border-bottom: 1px solid #ccc;
    padding-top: 10px;
  }

  .cart-cntnr .cart-prdct-tbl .packs .row {
    padding-bottom: 10px;
    padding-top: 10px;
    border: 0;
  }

  .cart-cntnr .cart-prdct-tbl .ttl-row {

    padding-bottom: 5px;
    padding-top: 20px;
  }

  .stepper input {
    position: relative;
    float: left;
    width: 23px;
    border: 1px solid #ddd;
    padding-left: 10px;
    padding-right: 10px;
    height: 24px;
    margin-left: 5px;
    margin-right: 5px;
    text-align: center;
  }

  .stepper a {
    position: relative;
    border: 1px solid #ddd;
    border-radius: 100%;
    float: left;
    width: 17px;
    text-align: center;
    top: 3px;
    cursor: pointer;
    padding-left: 1px;
    padding-right: 1px;
  }

  #totalAmount {
    position: relative;
    float: left;
    margin-left: 40px;
    top: 5px;
  }

  /**cart page rules *ends**/

</style>
<div class="mainContainer">
<div class="container cart-cntnr">
<c:if test="${cartAction.cartEmpty}">
  <br>

  <h1>Your cart is empty. Please go back to add products to it.</h1>

  <a href="/" title="Home" class="fnt-light">&larr; go back to add products to your shopping cart</a>
  <br> <br>
</c:if>
<c:if test="${!cartAction.cartEmpty}">
<div class="ttl-cntnr"><span class="icn icn-sqre"></span>

  <h1 class="">Cart</h1><span class="icn icn-sqre"></span></div>
<!-- div class="cart-offr-avlbl mrgn-t-25">
<span>OFFERS AVAILABLE</span>
</div-->
<c:if test="${fn:length(shoppingCartPricingDto.applicablePromptOffers)>0}">
  <div class="offers-container">
    <a href="javascript:void(0)"
       class="offers-label"><span data-role="prompt-count"
                                  style="background-color:orangered;color:white;padding-left:3px;padding-right:3px;margin-right:8px;">${fn:length(shoppingCartPricingDto.applicablePromptOffers)}</span>${shoppingCartPricingDto.appliedOfferId!=null?'OFFER APPLIED, CHANGE OFFER':'OFFERS AVAILABLE'}
    </a>

    <div></div>
    <div class="offers-drop-down">

      <c:forEach items="${shoppingCartPricingDto.applicablePromptOffers}" var="promptOffer">
        <div class="offer-tile-container">
          <span class="icn icn-scissor"></span>

          <div class="offer-tile-title">
              ${promptOffer.name==null?'OFFER':promptOffer.name}
          </div>
          <!--div class="offer-tile-text">
                  ${promptOffer.terms}
          </div-->
          <div class="offer-tile-buttons">
            <c:if test="${inSession=='false'}">
              <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="btn btn-gray">
                Login To Apply
                <s:param name="redirectUrl" value="${httpPath}/cart/Cart.action"/>
              </s:link>
            </c:if>
            <c:if test="${inSession!='false'}">
              <c:if test="${shoppingCartPricingDto.appliedOfferId == promptOffer.id}">
                            <span class="btn inactive">
                                Applied
                            </span>
                <span class="txt-blue fnt-sz10">REMOVE</span>
              </c:if>
              <c:if test="${shoppingCartPricingDto.appliedOfferId != promptOffer.id}">
                <s:link beanclass="com.hk.web.action.beta.cart.CartAction" data-id="${promptOffer.id}" event="applyOffer"
                        class="btn btn-gray apply-offer">
                  <s:param name="offerId" value="${promptOffer.id}"/> Apply
                </s:link>
              </c:if>
            </c:if>


          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</c:if>
<div class="row ">
<div class="span11 cart-prdct-tbl mrgn-b-50">
  <div class="ttl-row">
    <div class="span5 alpha">YOU ARE BUYING</div>
    <div class="span2">QTY</div>
    <div class="span2">DISPATCH</div>
    <div class="span2 omega">PRICE</div>
  </div>

  <hr style="border-bottom: 1px dotted #ddd;">
  <s:form partial="true" beanclass="com.hk.web.action.beta.cart.CartAction">
    <c:forEach items="${cartItems}" var="cartItem">
      <div class="row" data-role="item" data-id="${cartItem.storeVariantId}">
        <div class="span5">
          <div class="span2 alpha text-center">
            <a class="disp-inln img-box img-box-70 parent-img"
               href="${hk:getShoppingCartVariantUrl(cartItem)}">
              <img name="tumbnail" src="${cartItem.catalogStoreVariantImageVO.slink}"
                   alt="${cartItem.catalogStoreVariantImageVO.altText}"/>
            </a>
          </div>
          <div class="span3 omega">
            <div><a href="${hk:getShoppingCartVariantUrl(cartItem)}">${cartItem.name}</a></div>
          </div>
        </div>
        <div id="stepper" class="span2 stepper">
          <a href="javascript:void(0)" id="minus" data-role="item-minus">-</a>
          <s:text name="itm-qty" data-role="item-quantity" value="${cartItem.qty}"/>
          <a href="javascript:void(0)" id="plus" data-role="item-plus">+</a>
        </div>
        <div class="span2">
          <span>${cartItem.minDispatchDays}</span> - <span>${cartItem.minDispatchDays}</span> DAYS
        </div>
        <div class="span2 price">
          <div class="prc-ofr">Rs. <span
              data-role="item-offer-price">${cartItem.variantTotalOfferPrice}</span>
          </div>
          <c:if test="${cartItem.variantTotalOfferPrice != cartItem.variantTotalMrp}">
              <div class="prc-actl">
                  Rs. <span data-role="item-mrp-price">${cartItem.variantTotalMrp}</span>
              </div>
          </c:if>
          <a href="javascript:void(0)" data-role="item-remove" class="icn icn-close2"
             style="position:relative;left:100px;top:-40px"></a>
        </div>
      </div>
      <hr>
    </c:forEach>

    <c:forEach items="${packs}" var="pack">
      <div class="packs" data-id="${pack.packId}">
        <c:forEach items="${pack.packVariants}" var="cartItem" varStatus="packCounter">
          <div class="row" data-role="item" data-id="${cartItem.storeVariantId}">
            <div class="span5">
              <div class="span2 alpha text-center">

                <a href="${hk:getShoppingCartVariantUrl(cartItem)}" class="img-box img-box-70 disp-inln"><img
                    name="tumbnail"
                    src="${cartItem.catalogStoreVariantImageVO.slink}"
                    alt="${cartItem.catalogStoreVariantImageVO.altText}"/></a>

              </div>
              <div class="span3 omega">
                <div><a href="${hk:getShoppingCartVariantUrl(cartItem)}">${cartItem.name}</a>
                </div>
              </div>
            </div>
            <div id="stepper" class="span2 stepper">
              <c:if test="${packCounter.index == 0}">
                <a href="javascript:void(0)" id="minus" data-role="pack-minus">-</a>
                <s:text name="itm-qty" data-role="pack-quantity" value="${pack.packQty}"/>
                <a href="javascript:void(0)" id="plus" data-role="pack-plus">+</a>
              </c:if>
            </div>
            <div class="span2">
              <span>${cartItem.minDispatchDays}</span> - <span>${cartItem.minDispatchDays}</span> DAYS
            </div>
            <div class="span2 price">
              <c:if test="${packCounter.index == 0}">
                <div class="prc-ofr">Rs. <span
                    data-role="item-offer-price">${pack.packTotalOfferPrice}</span>
                </div>
                <div class="prc-actl">Rs. <span
                    data-role="item-mrp-price">${pack.packTotalMrp}</span></div>
                <a href="javascript:void(0)" data-role="pack-remove" class="icn icn-close2"
                   style="position:relative;left:100px;top:-40px"></a>
              </c:if>
            </div>
          </div>
          <div class=clear></div>
        </c:forEach>
      </div>
    </c:forEach>
  </s:form>
</div>
<div class="span4 offset1" data-role="cart-summary">
  <div class=row>
    <div class="span2">
      <div class="fnt-light fnt-caps fnt-bold">You Pay</div>
              <span class="fnt-sz13">Rs. <span
                  data-role="total-payable">${shoppingCartPricingDto.totalPayable}</span></span>
    </div>
    <div class="span2">
        <%--<a href="" class="btn btn-blue fnt-caps">Pay now</a>--%>
      <s:link beanclass="com.hk.web.action.beta.order.SelectAddressAction" event="pre"
              class="btn btn-blue fnt-caps">
        Pay now
      </s:link>
    </div>

  </div>
  <hr>

  <div class="fnt-caps fnt-light fnt-bold mrgn-b-20">
      ${inSession=='false'?'APPLY COUPON':'COUPON CODE'}
  </div>
  <div>
    <c:if test="${inSession=='false'}">
      <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="btn btn-gray">
        Login To Apply
        <s:param name="redirectUrl" value="${httpPath}/cart/Cart.action"/>
      </s:link>
    </c:if>
    <c:if test="${inSession!='false'}">
      <input type="text" name="couponCode" style="width:100px;display:inline-block"/>

      <a href="javascript:void(0)" style="float:right;display:inline-block" class="apply-coupon btn btn-gray fnt-caps">Apply</a>
    </c:if>


  </div>
  <hr>

  <div class="fnt-caps fnt-light fnt-bold mrgn-b-20">
    Check out details
  </div>
  <div class=row>
    <div class="span2">
      <div class="">Total MRP</div>
    </div>
    <div class="span2">
      Rs. <span class="prc-actl" data-role="total-mrp-price">${shoppingCartPricingDto.totalMrp}</span>
    </div>
  </div>
  <div class=row>
    <div class="span2">
      <div class="" style="white-space: nowrap">healthkart price</div>
    </div>
    <div class="span2">
      Rs. <span class="fnt-sz13"
                data-role="total-offer-price">${shoppingCartPricingDto.totalOfferPrice}</span>
    </div>
  </div>
  <hr>

    <%-- <div class=row>
<div class="span2">
  <div class="">Healthkart discount</div>
</div>
<div class="span2">
  - Rs. ${shoppingCartPricingDto.storeDiscount}
    --%><%--- Rs.--%><%-- --%><%--<span class="" data-role="total-save"><fmt:formatNumber type="number"
                                                                            value="${shoppingCartPricingDto.totalMrp - shoppingCartPricingDto.totalOfferPrice}"
                                                                            maxFractionDigits="2"/></span>--%><%--
        </div>
      </div>--%>
  <div class=row>
    <div class="span2">
      <div class="">Promo discount</div>
    </div>
    <div class="span2">
      - Rs. <span data-role="promo-discount">${shoppingCartPricingDto.promoDiscount}</span>
        <%--- Rs.--%> <%--<span class="" data-role="total-save"><fmt:formatNumber type="number"
                                                                            value="${shoppingCartPricingDto.totalMrp - shoppingCartPricingDto.totalOfferPrice}"
                                                                            maxFractionDigits="2"/></span>--%>
    </div>
  </div>
  <hr>

  <div class=row>
    <div class="span2">
      <div class="">Shipping</div>
    </div>
    <div class="span2">
              <span class="fnt-caps"
                    data-role="shipping-charges">${shoppingCartPricingDto.shippingCharges > 0 ? shoppingCartPricingDto.shippingCharges : 'FREE'}</span>
    </div>
  </div>
  <hr>
  <div class=row>
    <div class="span2">
      <div class="fnt-light fnt-caps fnt-bold">You Pay</div>
    </div>
    <div class="span2">
              <span class="fnt-sz13">Rs. <span
                  data-role="total-payable">${shoppingCartPricingDto.totalPayable}</span></span>
    </div>
  </div>
  <hr>
  <!--div class="span2 alpha mrgn-t-20">
      <%--<a href="" class="btn btn-blue fnt-caps">Pay now</a>--%>
    <s:link beanclass="com.hk.web.action.beta.order.SelectAddressAction" event="pre"
            class="btn btn-blue fnt-caps">
      Pay now
    </s:link>
  </div-->


</div>
</div>
</c:if>
</div>
</div>
</s:layout-component>
<s:layout-component name="scriptComponent">
<script type="text/javascript">
$('.offers-label').click(function () {
  $(this).parents('.offers-container').toggleClass('offers-displayed');
})
var getUnitPrice = function (price, quantity) {
  return Number((Number(price) / Number(quantity)).toFixed(2))
}

var updateCart = function (event, data) {
  /*console.log(event, data);*/
}

var prepareItemData = function (ele) {
  ele
}


$(HK.Cart.elm.cartItem).each(function () {
  var cartItem = $(this);


  /*cartItem : '[data-role=item]',
   itemQuantity : '[data-role=item-quantity]',
   itemMinus : '[data-role=item-minus]',
   itemPlus : '[data-role=item-plus]',
   itemOfferPrice : '[data-role=item-offer-price]',
   itemMrpPrice : '[data-role=item-mrp-price]',
   //cart summary details
   cartSummary : '[data-role=cart-summary]',
   totalPayable : '[data-role=total-payable]',
   totalMrpPrice : '[data-role=total-mrp-price]',
   totalOfferPrice : '[data-role=total-offer-price]',
   totalSave : '[data-role=total-save]',

   update : 'update',
   add : 'add',
   sub : 'sub'
   */
  var info = {
    upActual: getUnitPrice($(this).find(HK.Cart.elm.itemMrpPrice).text(), $(this).find(HK.Cart.elm.itemQuantity).val()),
    upOffered: getUnitPrice($(this).find(HK.Cart.elm.itemOfferPrice).text(), $(this).find(HK.Cart.elm.itemQuantity).val()),
    quantity: Number($(this).find(HK.Cart.elm.itemQuantity).val())
  }

  //patch for packs
  if ($(this).find(HK.Cart.elm.packQuantity).length == 1) {
    info.quantity = Number($(this).find(HK.Cart.elm.packQuantity).val());
  }
  cartItem.data(info);

  //validation events
  cartItem.find(HK.Cart.elm.itemQuantity).on('keypress', function (e) {
    if (!(e.which >= 48 && e.which <= 57) || cartItem.hasClass('disabled')) {
      e.preventDefault()
    }
  });

  //Events occuring when user change quantity of item, trigger events on item level
  cartItem.find(HK.Cart.elm.itemMinus).bind('click', function () {
    cartItem.trigger(HK.Cart.events.sub);
  });

  cartItem.find(HK.Cart.elm.packMinus).bind('click', function () {
    cartItem.trigger(HK.Cart.events.packSub);
  });

  cartItem.find(HK.Cart.elm.itemQuantity).bind('blur', function () {
    cartItem.trigger(HK.Cart.events.update);
  });

  cartItem.find(HK.Cart.elm.packQuantity).bind('blur', function () {
    cartItem.trigger(HK.Cart.events.packUpdate);
  });

  cartItem.find(HK.Cart.elm.itemPlus).bind('click', function () {
    cartItem.trigger(HK.Cart.events.add);
  });

  cartItem.find(HK.Cart.elm.packPlus).bind('click', function () {
    cartItem.trigger(HK.Cart.events.packAdd);
  });

  cartItem.find(HK.Cart.elm.itemRemove).bind('click', function () {
    cartItem.trigger(HK.Cart.events.remove);
  })

  cartItem.find(HK.Cart.elm.packRemove).bind('click', function () {
    cartItem.trigger(HK.Cart.events.packRemove);
  })

  //Handle events triggered as a response to user actions
  cartItem.on(HK.Cart.events.add, function () {
    var info = $.extend({}, cartItem.data());
    info.quantity = info.quantity + 1;

    if (!cartItem.hasClass('disabled')) {
      HK.Ajax.customReq({
        type: 'post',
        url: HK.urls.updateVariantInCart,
        data: JSON.stringify({variantId: info.id, qty: info.quantity}),
        beforeSend: function () {
          cartItem.addClass('disabled');
        },
        success: function (serverResponse) {

          cartItem.trigger('updateConfirmed', [info, serverResponse]);
          cartItem.removeClass('disabled');
        },
        error: function (xhr) {
          cartItem.removeClass('disabled');
        }
      })
    }
  });

  //send increase quantity request to server for a pack
  cartItem.on(HK.Cart.events.packAdd, function () {
    var info = $.extend({}, cartItem.data());
    var parent = cartItem.parents('.packs');
    var sep = '';

    info.quantity = info.quantity + 1;
    info.packId = parent.data('id');
    info.storeVariantIdsInPackStr = '';
    parent.find(HK.Cart.elm.cartItem).each(function () {
      info.storeVariantIdsInPackStr += sep + $(this).data('id');
      sep = ',';
    });
    if (!cartItem.hasClass('disabled')) {
      HK.Ajax.customReq({
        type: 'post',
        url: HK.urls.updatePackInCart,
        data: JSON.stringify({packId: info.packId, qty: info.quantity, storeVariantIdsInPackStr: info.storeVariantIdsInPackStr}),
        beforeSend: function () {
          cartItem.addClass('disabled');
        },
        success: function (serverResponse) {

          cartItem.trigger('updateConfirmed', [info, serverResponse]);
          cartItem.removeClass('disabled');
        },
        error: function (xhr) {
          cartItem.removeClass('disabled');
        }
      })
    }
  });

  cartItem.on(HK.Cart.events.update, function () {
    var info = $.extend({}, cartItem.data());
    var itmQtyNew = Number(cartItem.find(HK.Cart.elm.itemQuantity).val());


    if (isNaN(itmQtyNew) || itmQtyNew == 0) {
      cartItem.find(HK.Cart.elm.itemQuantity).val(info.quantity);
      return
    } else {
      if (info.quantity != itmQtyNew) {
        info.quantity = itmQtyNew;
      } else {
        return
      }
    }

    if (!cartItem.hasClass('disabled')) {
      HK.Ajax.customReq({
        type: 'post',
        url: HK.urls.updateVariantInCart,
        data: JSON.stringify({variantId: info.id, qty: info.quantity}),
        beforeSend: function () {
          cartItem.addClass('disabled');
        },
        success: function (serverResponse) {
          cartItem.removeClass('disabled');
          cartItem.trigger('updateConfirmed', [info, serverResponse]);
        },
        error: function (xhr) {
          cartItem.removeClass('disabled');
        }
      })
    }
  });

  cartItem.on(HK.Cart.events.packUpdate, function () {
    var info = $.extend({}, cartItem.data());
    var parent = cartItem.parents('.packs');
    var itmQtyNew = Number(cartItem.find(HK.Cart.elm.packQuantity).val());
    var sep = '';

    info.packId = parent.data('id');
    info.storeVariantIdsInPackStr = '';
    parent.find(HK.Cart.elm.cartItem).each(function () {
      info.storeVariantIdsInPackStr += sep + $(this).data('id');
      sep = ',';
    });

    if (isNaN(itmQtyNew) || itmQtyNew == 0) {
      cartItem.find(HK.Cart.elm.packQuantity).val(info.quantity);
      return
    } else {
      if (info.quantity != itmQtyNew) {
        info.quantity = itmQtyNew;
      } else {
        return
      }
    }

    if (!cartItem.hasClass('disabled')) {
      HK.Ajax.customReq({
        type: 'post',
        url: HK.urls.updatePackInCart,
        data: JSON.stringify({packId: info.packId, qty: info.quantity, storeVariantIdsInPackStr: info.storeVariantIdsInPackStr}),
        beforeSend: function () {
          cartItem.addClass('disabled');
        },
        success: function (serverResponse) {
          cartItem.removeClass('disabled');
          cartItem.trigger('updateConfirmed', [info, serverResponse]);
        },
        error: function (xhr) {
          cartItem.removeClass('disabled');
        }
      })
    }
  })


  cartItem.on(HK.Cart.events.sub, function () {

    var info = $.extend({}, cartItem.data());
    if (!cartItem.hasClass('disabled')) {
      if (info.quantity > 1 && !cartItem.hasClass('disabled')) {
        info.quantity = info.quantity - 1;
        HK.Ajax.customReq({
          type: 'post',
          url: HK.urls.updateVariantInCart,
          data: JSON.stringify({variantId: info.id, qty: info.quantity}),
          beforeSend: function () {
            cartItem.addClass('disabled');
          },
          success: function (serverResponse) {
            cartItem.removeClass('disabled');
            cartItem.trigger('updateConfirmed', [info, serverResponse]);
          },
          error: function (xhr) {
            cartItem.removeClass('disabled');
          }
        })

      } else {
        HK.alert({content: 'You must be out of your mind, how can you order something with quantity ZERO', theme: HK.POPUP.THEME.ALERT});
      }
    }
  });

  //send decrease quantity request to server for a pack
  cartItem.on(HK.Cart.events.packSub, function () {
    var info = $.extend({}, cartItem.data());
    var parent = cartItem.parents('.packs');
    var sep = '';
    if (info.quantity > 1 && !cartItem.hasClass('disabled')) {
      info.quantity = info.quantity - 1;
      info.packId = parent.data('id');
      info.storeVariantIdsInPackStr = '';
      parent.find(HK.Cart.elm.cartItem).each(function () {
        info.storeVariantIdsInPackStr += sep + $(this).data('id');
        sep = ',';
      });

      HK.Ajax.customReq({
        type: 'post',
        url: HK.urls.updatePackInCart,
        data: JSON.stringify({packId: info.packId, qty: info.quantity, storeVariantIdsInPackStr: info.storeVariantIdsInPackStr}),
        beforeSend: function () {
          cartItem.addClass('disabled');
        },
        success: function (serverResponse) {

          cartItem.trigger('updateConfirmed', [info, serverResponse]);
          cartItem.removeClass('disabled');
        },
        error: function (xhr) {
          cartItem.removeClass('disabled');
        }
      });
    } else {
      HK.alert({content: 'You must be out of your mind, how can you order something with quantity ZERO', theme: HK.POPUP.THEME.ALERT});
    }
  })

  cartItem.on(HK.Cart.events.remove, function () {

    var info = $.extend({}, cartItem.data());
    if (!cartItem.hasClass('disabled')) {


      HK.Ajax.customReq({
        type: 'post',
        url: HK.urls.removeFromCart,
        data: JSON.stringify({storeVariantsToRemove: [info.id]}),
        beforeSend: function () {
          cartItem.addClass('disabled');
        },
        success: function (serverResponse) {
          cartItem.trigger('updateConfirmed', [info, serverResponse]);
          cartItem.next('hr').fadeOut().remove();
          cartItem.fadeOut().remove();
        },
        error: function (xhr) {
          HK.alert({title: HK.titles.wow, content: HK.errs.requestFail, theme: HK.POPUP.THEME.ALERT});
          cartItem.removeClass('disabled');
        }
      })

    } else {
      //HK.alert({content:'You must be out of your mind, how can you order something with quantity ZERO',theme:HK.POPUP.THEME.ALERT});
    }

  });

  //remove a pack from cart
  cartItem.on(HK.Cart.events.packRemove, function () {

    var info = $.extend({}, cartItem.data());
    var parent = cartItem.parents('.packs');
    var sep = '';
    info.packId = parent.data('id');
    if (!cartItem.hasClass('disabled')) {
      HK.Ajax.customReq({
        type: 'post',
        url: HK.urls.removePackFromCart,
        data: JSON.stringify({packSrcEntityIdToRemoveSet: [info.packId]}),
        beforeSend: function () {
          cartItem.addClass('disabled');
        },
        success: function (serverResponse) {
          cartItem.trigger('updateConfirmed', [info, serverResponse]);
          parent.fadeOut().remove();
        },
        error: function (xhr) {
          HK.alert({title: HK.titles.wow, content: HK.errs.requestFail, theme: HK.POPUP.THEME.ALERT});
          cartItem.removeClass('disabled');
        }
      })

    } else {
      //HK.alert({content:'You must be out of your mind, how can you order something with quantity ZERO',theme:HK.POPUP.THEME.ALERT});
    }

  });

  cartItem.on('updateConfirmed', function (event, data, serverResponse) {

    if (serverResponse.exception) {

    } else {

      var cartSummaryData = serverResponse;

      //cartSummaryData.quantity = data.quantity - cartSummaryData.quantity;
      var itms = cartSummaryData.results.cart.cartPricing.cartVar;
      var packs = cartSummaryData.results.cart.cartPricing.cartPacks;
      if (typeof data.packId != "undefined") {
        $.each(packs, function () {
          var pack = this;
          if (this['packId'] == data.packId) {
            data.quantity = pack.packQty;
            cartItem.find(HK.Cart.elm.packQuantity).val(data.quantity);
            cartItem.find(HK.Cart.elm.itemOfferPrice).text(pack.packTotalOfferPrice);
            cartItem.find(HK.Cart.elm.itemMrpPrice).text(pack.packTotalMrp);
            cartItem.data(data);
          }
        });
      } else {
        $.each(itms, function () {
          var itm = this;
          if (this['storeVariantId'] == data.id) {

            data.quantity = itm.qty;
            cartItem.find(HK.Cart.elm.itemQuantity).val(data.quantity);
            cartItem.find(HK.Cart.elm.itemOfferPrice).text(itm.variantTotalOfferPrice);
            cartItem.find(HK.Cart.elm.itemMrpPrice).text(itm.variantTotalMrp);
            cartItem.data(data);

          }
        });
      }


      $(HK.Cart.elm.cartSummary).trigger(HK.Cart.events.update, cartSummaryData);

    }
  });

  //	find('[data-role]').bind('click',function(){})
});

$(HK.Cart.elm.cartSummary).on(HK.Cart.events.update, function (event, serverResponse) {
  var data = serverResponse.results.cart.cartPricing;
  var cartSummary = $(this);
  var totalMrpPriceChange = data.totMrp;
  var totalOfferPriceChange = data.totOffPr;
  var totalPayable = data.totPay;
  var promoDiscount = data.promoDisc;
  var shippingCharges = (data.shippingCharges > 0) ? data.shippingCharges : 'FREE';
  var tmp = cartSummary.find(HK.Cart.elm.totalMrpPrice);
  var top = cartSummary.find(HK.Cart.elm.totalOfferPrice);
  var ts = cartSummary.find(HK.Cart.elm.totalSave);
  var sc = cartSummary.find(HK.Cart.elm.shippingCharges);
  var pd = cartSummary.find(HK.Cart.elm.promoDiscount);


  tmp.text(totalMrpPriceChange);
  top.text(totalOfferPriceChange);
  ts.text(totalMrpPriceChange - totalOfferPriceChange);
  pd.text(promoDiscount);

  cartSummary.find(HK.Cart.elm.totalPayable).text(totalPayable);
  cartSummary.find(HK.Cart.elm.totalSave).text(Number(tmp.text()) - Number(top.text()));

  var cartUpdate = new HK.dataObj.getObject(HK.dataObj.type.UPDATE_CART);
  cartUpdate.setCartValue(totalPayable);
  cartUpdate.setNoOfItems(data.cartVar.length);
  HK.updateCartPop(cartUpdate, false);

  if ((data.cartVar.length + data.cartPacks.length) == 0) {
    $('.cart-cntnr').html('');
    location.href = location.href;
  }

  $(HK.Cart.elm.cartOffer).trigger(HK.Cart.events.offerUpdate, serverResponse.results.cart.cartPricing);
});

$(HK.Cart.elm.cartOffer).on(HK.Cart.events.offerUpdate, function(e, cartPricing) {
  var offerTemplateHTML = $('#promt-offer-view').html();
  var offerTemplate = Handlebars.compile(offerTemplateHTML);

  //var cartPricing = json.results.cart.cartPricing;

  $('.offers-drop-down').html('');
  if (cartPricing.cartOffers.length > 0) {
    $(HK.Cart.elm.cartOffer).removeClass('hide');
  } else {
    $(HK.Cart.elm.cartOffer).addClass('hide');
  }

  //update counter for offer applied
  $('[data-role=prompt-count]').text(cartPricing.cartOffers.length);

  $.each(cartPricing.cartOffers, function(i) {
    var cartOffers = HK.dataObj.getObject(HK.dataObj.type.CART_OFFER);
    $.extend(cartOffers, this);


    if (cartPricing.appOffId === this.id) {
      cartOffers.applied = true;
    }
    var html = offerTemplate(cartOffers);
    $('.offers-drop-down').append(html);

  });
});

$('.offers-container').on('click', '.apply-offer', function(e) {
  e.preventDefault();
  var currEle = $(this);
  var offerId = currEle.attr('data-id');
  var url = HK.urls.applyOffer + '/' + offerId;

  HK.element.loader.add(currEle, true);

  var onSuccess = function(json) {

    HK.element.loader.remove(currEle, true);
    if (json.exception) {
      HK.alert({title : HK.titles.smthngNtRgt,content : HK.utils.generateHTMLForException(json.results),theme : HK.POPUP.THEME.ALERT});
    } else {
      var results = json.results;
      var updateCartData = HK.dataObj.getObject(HK.dataObj.type.UPDATE_CART);

      $(HK.Cart.elm.cartSummary).trigger(HK.Cart.events.update, json);

    }
  };
  var onError = function(xhr, a_status) {
    HK.element.loader.remove(currEle, true);
  };

  HK.Ajax.getJson(url, onSuccess, onError);
});

$('.apply-coupon').on('click', function(e) {
  e.preventDefault();
  var currEle = $(this);
  var couponCode = $('[name=couponCode]').val();

  var url = HK.urls.applyCoupon + '/' + couponCode;

  HK.element.loader.add(currEle, true);

  var onSuccess = function(json) {

    HK.element.loader.remove(currEle, true);
    if (json.exception) {
      HK.alert({title : HK.titles.smthngNtRgt,content : HK.utils.generateHTMLForException(json.results),theme : HK.POPUP.THEME.ALERT});
    } else {
      $(HK.Cart.elm.cartSummary).trigger(HK.Cart.events.update, json);
    }
  };
  var onError = function(xhr, a_status) {
    HK.element.loader.remove(currEle, true);
  };

  HK.Ajax.getJson(url, onSuccess, onError);
});

</script>

<script id="promt-offer-view" type="text/x-handlebars-template">
  <div class="offer-tile-container">
    <span class="icn icn-scissor"></span>

    <div class="offer-tile-title">
      {{#if nm}}
      {{nm}}
      {{else}}
      OFFER
      {{/if}}
    </div>
    <!--div class="offer-tile-text">
        {{terms}}
    </div-->
    <div class="offer-tile-buttons">
      <c:if test="${inSession=='false'}">
        <s:link beanclass="com.hk.web.action.beta.auth.LoginAction" class="btn btn-gray">
          Login To Apply
          <s:param name="redirectUrl" value="${httpPath}/cart/Cart.action"/>
        </s:link>
      </c:if>
      <c:if test="${inSession!='false'}">
        {{#if applied}}
                <span class="btn btn-gray inactive">
                    Applied
                </span>
        <span class="txt-blue fnt-sz10">REMOVE</span>
        {{else}}
        <a href="{{target}}" data-id="{{id}}" class="btn btn-gray apply-offer">
          APPLY
        </a>
        {{/if}}
      </c:if>

    </div>

  </div>
</script>
</s:layout-component>
</s:layout-render>