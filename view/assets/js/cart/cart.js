if (typeof(HK) == 'undefined') {
  HK = {};
}


var AddToCart = function() {
  var self = this, placeOrderClass = '.addToCart', placeOrderPackClass = '.addPackToCart', placeOrderWithExtOptClass = '.addToCartWithExtOp';

  self.init = function() {
    $(placeOrderClass).click(function(event) {
      var ref = $(this);
      var placeOrderBtn = $(event.currentTarget);
      var varId = placeOrderBtn.attr('varId');
      var qty = placeOrderBtn.attr('qty');
      var scrollTop = ref.data('scrollToTop');
      var oldVariantId = placeOrderBtn.attr('oldVariantId');
      var catPrefix = placeOrderBtn.attr('catPrefix');
      var pageType = placeOrderBtn.attr('pageType');
        if (catPrefix == 'cl') {
            HK.alert({title : HK.titles.smthngNtRgt,content : "We are sorry! You can buy this product from product page.",theme : HK.POPUP.THEME.ALERT});
            return false;
        }
      self.addSingleVariantToCart(ref, varId, qty, oldVariantId, scrollTop);
      HK.element.loader.add(ref, true);
    });

    $(placeOrderWithExtOptClass).click(function(event) {
      var ref = $(this);
      var placeOrderBtn = $(event.currentTarget);
      var varId = placeOrderBtn.attr('varId');
      var qty = placeOrderBtn.attr('qty');
      var oldVariantId = placeOrderBtn.attr('oldVariantId');
      var leftExtOpt = null;
      var rightExtOpt = null;
      if(!$('#leftLensChk').is(":checked") && !$('#rightLensChk').is(":checked")){
        HK.alert({title : HK.titles.smthngNtRgt,content : "Please select atleast one lens!",theme : HK.POPUP.THEME.ALERT});
         return false;
      }
       if($('#leftLensChk').is(":checked")){
         leftExtOpt = '';
          $('.lftCnfgNm').each(function(){
             var configName = $(this).attr("configName");
             var configValue = $(this).siblings('.lftCnfgVal').val();
             leftExtOpt = leftExtOpt + configName + ":" + configValue + ",";
          });
       }
      if($('#rightLensChk').is(":checked")){
         rightExtOpt = '';
        $('.rghtCnfgNm').each(function(){
          var configName = $(this).attr("configName");
          var configValue = $(this).siblings('.rhtCnfgVal').val();
          rightExtOpt = rightExtOpt + configName + ":" + configValue + ",";
        });
      }
      self.addVariantWithExtOpt(ref, varId, qty, oldVariantId, leftExtOpt, rightExtOpt);
      HK.element.loader.add(ref, true);
    });

    $(placeOrderPackClass).click(function(event) {
      var ref = $(this);
      var parentRef = ref.parents('.pack-div');
      var placeOrderBtn = $(event.currentTarget);
      var packId = parentRef.data('packid');
      var qty = 1;
      var storeVariantIdsInPackStr = getVariantIds(parentRef);
      self.addPackToCart(ref, packId, qty, storeVariantIdsInPackStr);
      HK.element.loader.add(ref, true);

      function getVariantIds(parentRef){
        var varIds = '';
        var sep = '';
           parentRef.find('.pack-var-div:visible').each(function(){
              varIds+= sep+$(this).data('vid');
             sep = ',';
           });
        return varIds;
      }
    });
  },

      self.sendToCartRequest = function(requestUrl,ref,params,scrollToTop){
        var onSuccess = function(json) {

          HK.element.loader.remove(ref, true);
          if (json.exception) {

            logE.push(logE.create({"error":json.messages[0],"target":requestUrl,"params":params}));
            HK.alert({title : HK.titles.smthngNtRgt,content : HK.utils.generateHTMLForException(json.messages),theme : HK.POPUP.THEME.ALERT});
            HK.element.loader.remove(ref, true);
          } else {
            var results = json.results;
            var updateCartData = HK.dataObj.getObject(HK.dataObj.type.UPDATE_CART);
            updateCartData.setCartValue(results.cartValue);
            updateCartData.setNoOfItems(results.noOfItems);
            updateCartData.setSvName(results.svName);
            HK.updateCartPop(updateCartData);
            if(scrollToTop){
              var scrollTo = $('.cart-pop-container');
              if(scrollTo.position().top < $(document).scrollTop()){
                HK.utils.Scroll.toElement(scrollTo);
              }
            }
          }
        };
        var onError = function(xhr, a_status) {
          logE.push(logE.create({"error":"Add to cart failed","target":requestUrl,"params":params,"responseStatus":xhr.status,"status":a_status}));
          HK.element.loader.remove(ref, true);
        };

        HK.Ajax.postJson(requestUrl, params, onSuccess, onError);
      }

      self.addPackToCart = function(ref, packId, qty, storeVariantIdsInPackStr) {
        var params = {"storeVariantIdsInPackStr" : storeVariantIdsInPackStr, "qty" :qty, "packId":packId};
        self.sendToCartRequest(HK.urls.addPackToCart, ref, params,true);
      },

      self.addSingleVariantToCart = function(ref, variantId, qty, oldVariantId, scrollToTop) {

        var params = {"variantId" : variantId, "qty" :qty, "oldVariantId": oldVariantId}
        self.sendToCartRequest(HK.urls.addVariantToCart, ref, params, scrollToTop);

      };

  self.addVariantWithExtOpt = function(ref, variantId, qty, oldVariantId, leftExtOpt, rightExtOpt, scrollToTop) {

    var params = {"variantId" : variantId, "qty" :qty, "oldVariantId": oldVariantId, "leftExtOpt":leftExtOpt, "rightExtOpt":rightExtOpt}
    self.sendToCartRequest(HK.urls.addVariantWithExtOp, ref, params, scrollToTop);

  };

};

$(document).ready(function() {
  HK.cartUpdater = new AddToCart();
  HK.cartUpdater.init();
});