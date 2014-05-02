if (typeof(HK) == 'undefined') {
  HK = {};
}
if (typeof(CONTEXT_ROOT) == 'undefined') {
  CONTEXT_ROOT = '';
}

//fix for legacy browsers not supporting console.log
if (typeof console === "undefined") {
  var console = {};
  console['log'] = function() {
  };
}



HK.CatalogLoaderConstants = {

		  SUB_CAT_PREFIX :"SCT-",
		  MENU_LANDING :"CL-",
		  BRAND_PREFIX :"BR-",
		  BRAND_SEP : "~",
		  BRAND_PARAM : "brands",
		  FILTER_PARAM : "fl",
		  CAT_PARAM : "catPrefix"
		};


var PopUpUtil = function () {
  var _self = this;
  _self.root = null;
  _self.rootClass = 'popup-root';
  _self.shadowClass = 'popup-shadow';
  _self.contentClass = 'popup-content';
  _self.actionClass = 'popup-action';
  _self.closeClass = "popup-close";
  _self.removeClass = "popup-remove";
  _self.events = {
    REMOVE: 'removePop',
    HIDE: 'hidePop'
  }
  /*
   * create popup for elements existing in DOM
   */
  _self.setRootRef = function (root) {
    _self.root = root;
  }

  _self.getRootRef = function () {
    return _self.root;
  }

  _self.getContentRef = function () {
    var x = _self.root.find('.' + _self.contentClass);
    return x
  }

  /**
   *@param dimension: css rules, must be in valid json form
   */
  _self.setContentBoxProperties = function (dimension) {
    if (!(typeof dimension == 'undefined' || dimension == null)) {
      _self.getContentRef().css(dimension);
    }
  }

  /*
   * Create popup out of thin air
   */
  _self.createPopUp = function (settings, targetEle) {
    if (typeof targetEle == 'undefined' || targetEle == null || targetEle == '') {
      targetEle = 'body';
    }
    var ele = $("<div></div>").prependTo(targetEle);
    ele.addClass(_self.rootClass);
    var shdw = $('<div></div>').addClass(_self.shadowClass);
    ele.append(shdw);
    var cntnt = $('<div></div>').addClass(_self.contentClass);
    ele.append(cntnt);
    _self.root = ele;
    _self.init(settings);
    return _self.root;
  }

  //use this when elements are available in dom, internally called by createPopUP method
  _self.init = function (settings) {
    var closeType, title, boxSize, theme , haveTitle;
    if ((typeof settings) == 'object') {
      closeType = settings.closeType;
      title = settings.title;
      boxSize = settings.boxSize;
      theme = (typeof settings.theme == 'string') ? settings.theme : '';
      haveTitle = settings.haveTitle || true;
      /*console.log(haveTitle);*/
    }
    try {
      if (_self.root == null) {
        throw("Exception : Initialzed plugin without setting root element");
      }

      _self.setTheme(theme);

      //search for CONTENT section in content layout
      var cntnt = _self.root.find('.' + _self.contentClass + ">[data-role=content]");
      if (cntnt.length == 0) {
        _self.addContentElement(_self.getContentRef());
      }

      //search for TITLE section in content layout
      var ttl = _self.root.find('.' + _self.contentClass + ">[data-role=title]");
      if (ttl.length == 0 && haveTitle != 'false') {
        _self.addTitle(_self.getContentRef(), title, closeType);
      }

      //search for Action section in content layout
      var ttl = _self.root.find('.' + _self.contentClass + ">[data-role=action]");
      if (ttl.length == 0) {
        _self.addActionContainer();
      }

      _self.shadowBindClick(closeType);

      //set dimension of content layout
      _self.setContentBoxProperties(boxSize);
      _self.root.bind(_self.events.HIDE, _self.close);
      _self.root.bind(_self.events.REMOVE, _self.remove);
      _self.root.on('click', '.' + _self.closeClass, _self.close);
      _self.root.on('click', '.' + _self.removeClass, _self.remove);

    } catch (e) {
      /*console.log(e);*/
    }
  }

  //Hide pop up when user clicks on shadow area
  _self.shadowBindClick = function (closeType) {
    if (closeType == 'remove') {
      _self.root.find('.' + _self.shadowClass).click(_self.remove);
    } else {
      _self.root.find('.' + _self.shadowClass).click(_self.close);
    }
  }

  //set theme for popup
  _self.setTheme = function (theme) {
    _self.getContentRef().addClass(theme);
  }

  _self.shadowUnbindClick = function () {
    _self.root.find('.' + _self.shadowClass).unbind('click');
  }

  //Create TITLE element in content layout
  _self.addTitle = function (ele, title, iconType) {
    if (String(typeof title) == 'undefined') {
      title = "";
    }
    var ttl = $('<div data-role=title></div>');
    ttl.html("<span class='title-string'>" + title + "</span>");
    if (iconType == 'remove') {
      ttl.append(_self.addRemoveIcon());
    } else {
      ttl.append(_self.addCloseIcon());
    }
    ele.prepend(ttl);
  }

  //Create CONTENT element in content layout
  _self.addContentElement = function (ele) {
    var cntnt = $('<div data-role=content></div>');
    cntnt.html(ele.html());
    //cntnt.append()(_self.root.find('.'+_self.contentClass).html());
    ele.html(cntnt);
  }

  //Create ACTIONS or button container in content layout
  _self.addActionContainer = function () {
    var cntnt = $('<div data-role=action></div>');
    //cntnt.append()(_self.root.find('.'+_self.contentClass).html());
    _self.getContentRef().append(cntnt);
  }

  _self.addActionButton = function (btn) {
    _self.getContentRef().find('[data-role=action]').append(btn);
  }

  _self.removeActionButtons = function () {
    _self.getContentRef().find('[data-role=action]').html("");
  }

  //add content to content element
  _self.addContent = function (content) {
    var ele = _self.root.find('.' + _self.contentClass + '>[data-role=content]');
    ele.append(content);

  }

  //set content to content element, overrides any content already available
  _self.setContent = function (content) {
    var ele = _self.root.find('.' + _self.contentClass + '>[data-role=content]');
    ele.html(content);

  }
  _self.addCloseIcon = function () {
    var close = $("<span class='icon-close " + _self.closeClass + " cont-rht'></span>");
    close.click(function () {
      _self.close();
    });
    return close
  }

  _self.addRemoveIcon = function () {
    var remove = $("<span class='icon-close " + _self.closeClass + " cont-rht'></span>");
    remove.click(function () {
      _self.remove();
    });
    return remove
  }
  /**
   *set trigger element to open popup
   *@param openRef: jquery reference of trigger element
   */
  _self.openers = function (openRef) {
    openRef.live('click', function () {
      _self.show();
    });
  }

  _self.fixZIndex = function () {
    var mx = _self.root.css('z-index');
    var modif = false;
    $('.popup-root:visible').not(_self.root).each(function () {
      if ($(this).css('z-index') >= mx) {
        mx = $(this).css('z-index');
        modif = true;
      }
    });
    (modif) ? _self.root.css('z-index', Number(mx) + 1) : '';
  }

  _self.show = function () {
    _self.showShadow();
    _self.showContent();
    _self.fixZIndex();
  }

  _self.showShadow = function () {
    _self.root.css({'height': $('body').height()}).fadeIn();
    _self.getContentRef().hide();
  }
  _self.hideShadow = function () {
    _self.close();
  }

  _self.showContent = function () {
    var windowSize = $(window).height(); // height of browser window
    var popUpHeight = _self.getContentRef().height(); // height of popup window

    _self.fixZIndex();  //when multiple popups are opened

    if (windowSize < popUpHeight) {// when browser window is smaller than pop up height
      _self.getContentRef().fadeIn().css({'top': $(document).scrollTop()});
    } else {
      _self.getContentRef().fadeIn().css({'top': $(document).scrollTop(),'margin-top': (windowSize - popUpHeight) / 2.5 + 'px'});
    }

  }

  _self.showContentOnly = function () {
    _self.root.css({'height': 0}).show();
    _self.getContentRef().fadeIn().css({'top': $(document).scrollTop()});
  }

  _self.hideContent = function () {
    _self.hideShadow();
  }

  _self.remove = function () {
    _self.root.remove();
  }

  _self.close = function () {
    _self.root.hide();
  }
  //Event

}

HK.GLBLS = {
  cntxt: CONTEXT_ROOT,
  api: CONTEXT_ROOT + '/api'
};

HK.titles = {
  smthngNtRgt: "Something's not right",
  wow: "That's not normal",
  wowHold : 'Wow! Hold on there'
};

HK.Constants = {
  AC_ITEMS : 'autoCompleteItems',
  AC_VARIANTS : 'autoCompleteVariants'
};


HK.errs = {
  requestFail: 'Request Failed',
  enterEmail: 'Please enter email address',
  invalidEmail: 'Email address is not valid',
  enterPassword: 'Please enter password',
  enterName: 'Please enter your name',
  enterTitle: 'Please enter review title',
  enterReview: 'Please enter review description',
  enterRating: 'Please give rating to product',
  enterPhoneNumber: 'Please enter phone number',
  enterAddLine: 'Please enter address line 01',
  enterCity: 'Please enter city',
  enterState: 'Please enter state',
  invalidPincode: 'Please enter a valid pincode',
  invalidPhoneNumber: 'Please enter a valid no.',
  passwordNotMatch: 'Password and confirm password are not same',
  emailNotDifferent: 'New Email and Old Email must be different',
  passwordNotDifferent: 'New Email and Old Password must be different',
  enterMessage: 'Please enter your Message'
};

HK.msgs = {
  successRemove: 'Successfully Removed',
  successAdd: 'Successfully Added',
  upldFl: 'Upload File',
  ldng: 'Loading',
  added2Crt: 'Added to your cart',
  noProductFound : 'No product found',
  enterMessage : 'It would be great, if you just enter something to search for'

};

HK.urls = {
  autoCompleter: HK.GLBLS.api + '/ac/results',
  addPackToCart: HK.GLBLS.api + '/cart/pack/add',
  updatePackInCart: HK.GLBLS.api + '/cart/pack/update',
  removePackFromCart: HK.GLBLS.api + '/cart/pack/remove',
  //addVariantToCart: HK.GLBLS.api + '/cart/variant/add',
  addVariantToCart: HK.GLBLS.api + '/cart/productVariant/add',
  addVariantWithExtOp: HK.GLBLS.api + '/cart/productVariantExtOpt/add',
  updateVariantInCart: HK.GLBLS.api + '/cart/variant/update',
  removeFromCart: HK.GLBLS.api + '/cart/variant/remove',
  summaryCart: HK.GLBLS.api + '/cart/summary',
  review: HK.GLBLS.api + '/variant/review/',
  reviewRate: HK.GLBLS.api + '/variant/review/rate',
  addReview: HK.GLBLS.api + '/variant/review/add',
  reviewVote: '/vote?voteType=',
  cartPage: HK.GLBLS.cntxt + '/beta/cart/Cart.action',
  activationEmail: HK.GLBLS.api + "/email/activate",
  /*variantPage: HK.GLBLS.cntxt + "/variant/StoreVariant.action",*/
  boughtTogether: HK.GLBLS.api + "/variant/",
  paymentCreate: HK.GLBLS.api + "/payment/create",
  locationApi: HK.GLBLS.api + "/location",
  //offers,coupons
  applyOffer : HK.GLBLS.api + '/cart/applyOffer',
  applyCoupon : HK.GLBLS.api + '/cart/applyCoupon',
  rewardPoint : HK.GLBLS.api + '/reward/results',
  notifyUserDetails : HK.GLBLS.api + '/notify/details',
  notifyUpdate : HK.GLBLS.api + '/notify/update',
  speakToNutritionistDetails: HK.GLBLS.api + '/speakTo/details',
  speakToNutritionistSubmit: HK.GLBLS.api + '/speakTo/update',
  subscribeForMails: HK.GLBLS.api + '/subscribe/',
  variantOffer: HK.GLBLS.api + '/variant/browse/',
  getAllVariantsToCompare: HK.GLBLS.api + '/variant/compare/all',
  addVariantToCompare: HK.GLBLS.api + '/variant/compare/add',
  removeVariantToCompare: HK.GLBLS.api + '/variant/compare/remove',
  removeAllVariantsToCompare: HK.GLBLS.api + '/variant/compare/remove/all'
};
HK.timeOut = {
  xxs : 300,
  xs : 1000,
  small: 2000,
  medium: 5000,
  large: 10000,
  insane: 50000
};
/** Maintain objects needed across application Start **/
HK.dataObj = {};
/* method to generate an object of specified type
 Example:

 */
HK.dataObj.getObject = function (type) {
  if (HK.dataObj.hasOwnProperty(type)) {
    return HK.dataObj[type]()
  }
  return null
}
// a list of methods that are available
HK.dataObj.type = {
  UPDATE_CART: 'updateCart',
  VARIANT_DETAIL: 'variantDetail',
  CART_OFFER : 'cartOffer'
}
// generates object used in popup which is displayed when product is added to cart
HK.dataObj.updateCart = function () {

  function _UpdateCart() {
    this.cartValue = 0;
    this.noOfItems = 0;
    this.svName = '';
  }

  _UpdateCart.prototype.getCartValue = function () {
    return this.cartValue
  }
  _UpdateCart.prototype.setCartValue = function (cv) {
    this.cartValue = cv
  }
  _UpdateCart.prototype.getNoOfItems = function () {
    return this.noOfItems
  }
  _UpdateCart.prototype.setNoOfItems = function (noi) {
    this.noOfItems = noi
  }
  _UpdateCart.prototype.getSvName = function () {
    return this.svName
  }
  _UpdateCart.prototype.setSvName = function (name) {
    this.svName = name
  }
  return new _UpdateCart();
}

// Used to handle data related to offers on cart
HK.dataObj.cartOffer = function () {

  function _CartOffer() {
    this.id = null;
    this.nm = null;
    this.terms = '';
    this.applied = false;
    this.target = "javascript:void(0)";
  }

  return new _CartOffer();
}

HK.dataObj.variantDetail = function () {
  function _variantDetail() {

    this.sv_id = null;
    this.bt_var = {
      id: null,
      nm: "",
      offer_pr: null,
      catPre: null,
      mrp: null,
      discount: null,
      rank: null,
      rating: null,
      pr_img: {
        altText: null,
        caption: null,
        xxt_link: null,
        xt_link: null,
        t_link: null,
        xxs_link: null,
        s_link: null,
        m_link: null,
        l_link: null
      },
      oos: null,
      cod_allowed: null,
      min_dsptch: null,
      max_dsptch: null,
      nv: 0
    };
    this['do'] = null;

  }

  return new _variantDetail()
}

/** Maintain objects needed across application End **/
HK.utils = {};
//Processes response from ajax calls
HK.utils.Response = {};

//Generates anchor tags
HK.utils.Link = {};

//Auto scroll from one section to another
HK.utils.Scroll = {};

//create an alert box as provided by bootstrap
HK.utils.createBootStrapAlert = function (errs) {
  var alertEle = createParentElement();
  alertEle.append(createCloseButton());
  alertEle.append(prepareMessage(errs));
  alertEle.alert();
  return alertEle;
  function createParentElement() {
    return $('<div class="alert alert-bootstrap"></div>')
  }

  function createCloseButton() {
    return $('<a class="close" data-dismiss="alert" href="#">&times;</a>')
  }

  function prepareMessage(msg) {
    if ($.isArray(msg)) {
      return HK.utils.createMessageList(msg)
    } else if (typeof msg == 'string') {
      return createMessage(msg)
    }
  }

  function createMessage(msgs) {
    return  "<div>" + msgs[i] + "</div>"
  }

}

//create html for an exceptions. Exceptions can be passed in form of single string or an array
HK.utils.generateHTMLForException = function (exptns) {
  var resultString = '';
  if (typeof exptns == 'undefined') {
    return resultString
  } else if (typeof exptns == 'string') {
    return exptns
  } else if ($.isArray(exptns)) {
    return HK.utils.createListFromArray(exptns)
  }
  return resultString
}

//create an unordered list for an array
HK.utils.createMessageList = function (msgs) {
  return HK.utils.createListFromArray(msgs);
}

//create an unordered list for an array
HK.utils.createListFromArray = function (arr) {
  var list = $('<ul class="gl"></ul>');
  if ($.isArray(arr)) {
    $.each(arr, function (i) {
      list.append("<li>" + arr[i] + "</li>");
    });
  }
  return list
}

HK.utils.getTextBeforeSeparator = function(input, separator, start) {
  var separatorIndex = input.indexOf(separator);
  var startCounter = (typeof start === "number") ? start : 0;
  if (separatorIndex) {
    return input.slice(startCounter, separatorIndex);
  } else {
    return '';
  }
}

HK.utils.getTextAfterSeparator = function(input, separator, end) {
  var separatorIndex = input.indexOf(separator) + 1; //+1 to read text after separator
  var endCounter = (typeof start === "number") ? start : input.length;
  if (separatorIndex) {
    return input.slice(separatorIndex, endCounter);
  } else {
    return '';
  }
}



HK.utils.getHeaderCartSummary = function () {
  HK.Ajax.getJson(CONTEXT_ROOT + "/api/cart/summary", function (resp) {
    alert(resp);
  });
}

//Check if response from ajax call contains exception or not
HK.utils.Response.hasErr = function (data) {
  if (data.exception) {
    return true
  }
  return false
}

//Check if response from ajax call contains exception or not
HK.utils.Response.getErr = function (data) {
  return HK.utils.createMessageList(data.messages)
}


HK.utils.Scroll.toTop = function (speed) {//soft scroll to top of the page
  this.toPosition();
}

HK.utils.Scroll.toElement = function (ele, speed) {//soft scroll to specified element
  var position = 0;
  try {
    position = $(ele).position().top;
  } catch (e) {
    //Un comment line below to see error on chrome, mozila, ie9 onwards
    //console.log(e)
  }
  this.toPosition(position, speed);
}
HK.utils.Scroll.toPosition = function (position, speed) {//soft scroll to specified position
  if (typeof speed != 'number') {
    speed = 300;
  }
  if (typeof position != 'number') {
    position = 0;
  }
  $('html,body').animate({scrollTop: position}, speed);
}

HK.utils.setHeight = function(elm, height) {

};

HK.utils.getElmWithMaxHeight = function(child, parent) {//returns element with largest height
  var pEle = parent, //parent selector
      pChi = child,  //child selector
      selector, //array of final elements
      maxHeight = 0, //contains maxHeight obtained till now
      largetElement; //reference to element with largest height
  if (typeof pEle === 'undefined') {//find if method invoked with single parameter
    selector = $(child);
  } else {//if both parameters are provided by user
    selector = $(parent).find(child);
  }

  $.each(selector, function() {//iterate over array of elements obtained from selector
    var curEleHeight = $(this).height();
    if (curEleHeight > maxHeight) {
      maxHeight = curEleHeight;
      largetElement = $(this);
    }
  });

  return largetElement;
}

HK.utils.updateHeightOfElements = function(height, child, parent) {//returns element with largest height
  var pEle = parent, //parent selector
      pChi = child,  //child selector
      selector; //array of final elements


  if (typeof pEle === 'undefined') {//find if method invoked with single parameter
    selector = $(child);
  } else {//if both parameters are provided by user
    selector = $(parent).find(child);
  }

  selector.height(height);


}

HK.utils.resetHeightOfCarousel = function() {
  var parentSelector = '.nbs-flexisel-ul';
  var childSelector = '.nbs-flexisel-item';

  $.each($(parentSelector), function() {
    var pEle = $(this);
    var cEle = $(this).find(childSelector);
    var height;
    resetHeight(cEle, pEle);
    height = getMaxHeight(cEle, pEle);
    cEle.height(height);
  });

  function resetHeight(cEle, pEle) {
    pEle.height('initial');
    cEle.height('initial');
  }

  function getMaxHeight(cEle, pEle) {
    return HK.utils.getElmWithMaxHeight(cEle, pEle).height();
  }


}
HK.element = {};

HK.element.disable = function (ele) {
  ele.attr('disabled', 'disabled');
}

HK.element.enable = function (ele) {
  ele.removeAttr('disabled');
}

HK.element.loader = {
  loaderEle: $('<span class=loader></span>'),
  add: function (ele, hideEle) {

    this.loaderEle.insertAfter(ele);
    if (hideEle === true) {
      ele.hide();
    }
  },
  remove: function (ele, showEle) {
    ele.siblings('.' + this.loaderEle.attr('class')).remove();
    if (showEle === true) {
      ele.show();
    }
  }
}

HK.Cart = {
  elm: {
    //individaul item details

    cartItem : '[data-role=item]',
    itemQuantity : '[data-role=item-quantity]',
    itemMinus : '[data-role=item-minus]',
    itemPlus : '[data-role=item-plus]',
    packQuantity : '[data-role=pack-quantity]',
    packMinus : '[data-role=pack-minus]',
    packPlus : '[data-role=pack-plus]',
    itemRemove : '[data-role=item-remove]',
    packRemove : '[data-role=pack-remove]',
    itemOfferPrice : '[data-role=item-offer-price]',
    itemMrpPrice : '[data-role=item-mrp-price]',
    //cart summary details
    cartSummary: '[data-role=cart-summary]',
    totalPayable: '[data-role=total-payable]',
    totalMrpPrice: '[data-role=total-mrp-price]',
    totalOfferPrice: '[data-role=total-offer-price]',
    promoDiscount: '[data-role=promo-discount]',
    shippingCharges: '[data-role=shipping-charges]',
    totalSave: '[data-role=total-save]',
    //offers
    cartOffer : '.offers-container'

  },
  events :{
    update : 'update',
    packUpdate : 'packUpdate',
    offerUpdate : 'cartOfferUpdate',
    add : 'add',
    packAdd : 'packAdd',
    sub : 'sub',
    packSub : 'packSub',
    remove : 'drop',
    packRemove : 'packDrop'
  }
}


$(document).ready(function () {


  

  //patch to trigger auto carousel effect of banners
  $('.carousel-indicators').find('[data-slide-to]:first').trigger('click');

  /**--------------------------------------Error/Success msgs begins----------------------------------**/
  $('.remove-error').click(function () {
    $(this).parent('.err-cntnr').remove();
  });
  $('.remove-success').click(function () {
    $(this).parent('.alert-cntnr').remove();
  });
  /**--------------------------------------Error/Success msgs end----------------------------------**/

  /**--------------------------------------- custom pop up box JS starts --------------------------------------------------**/
  HK.POPUP = {
    THEME: {
      ALERT: 'popup-theme-orange'
    }
  }

  HK.shadow = function() {
    var shdwPrnt = $('<div></div>');
    var shdw = $('<div></div>');
    var loader = $('<div></div>')
    shdwPrnt.css({width:'100%',position:'absolute','z-index':'1000',top:0,display:'none'});
    shdw.css({height:'inherit',opacity:'0.5',alpha:'0.5','background-color':'#eee'});
    loader.css({position:'fixed',top:'40%',right:'48%'}).addClass('icn-loader-large');

    shdwPrnt.append(shdw);
    shdwPrnt.append(loader);

    $('body').append(shdwPrnt);

    return {show : function() {
      shdwPrnt.css({'display':'block',height:$('html').height()});
    },
      hide : function() {
        shdwPrnt.css('display', 'none');
      }
    }

  }();
  /*
   * HK.alert({title:"custom",theme:HK.POPUP.THEME.ALERT,content:"Sample alert"});
   * HK.alert("Sample alert");
   */
  

  /*
   *
   * HK.vTooltip("Sample alert",[{text:'',callback:function(){},title:"hint",data:object,{text:'Something',callback:function(){},title:"hint",data:object}}]);
   */
  HK.vTooltip = function () {

    return function (element) {

      //22 is based on the tooltip padding, margin and font-size 5+5+12+20=42
      var top = element.offset().top + (element.height() - 42) / 2;
      var left = element.position().left;
      /*console.log(top);
       console.log(left);*/

      //element.before(tooltipContent);
      //just now added prev
      prev = element.prev();
      left = left - prev.outerWidth() - 17;
      prev.css({'left': left});

      content = "sample";

      var conf = {boxSize: {position: 'absolute', 'top': top, height: 'auto', width: '100px', margin: '0px'}, haveTitle: false};
      var pop = new PopUpUtil();

      pop.createPopUp(conf, element);
      pop.root.css({top: 'initial', left: 'initial'});
      pop.setContent(content + "<br>");


      pop.showContentOnly();
      return pop;

    }

  }();
  /**-------------------------------------- Custom pop up JS ends --------------------------------------------------------**/


  /**-------------------------------------- Banner layout JS starts ------------------------------------------------------**/

 
  $('.hdr-drop-cntnr').hover(function () {
    $(this).addClass('hdr-drop-cntnr-hover').find('.hdr-drop-down').show();
  },
      function () {
        $(this).removeClass('hdr-drop-cntnr-hover').find('.hdr-drop-down').hide();
      });

  $('.hdr-drop-cntnr').on('click', function(e) {

    $(this).trigger('mouseenter');
    $('.cart-pop-container').trigger('mouseleave');
    e.stopPropagation();
  });

  $('.cart-pop-container').hover(function () {
    $(this).addClass('cart-pop-container-hover').find('#cartPop').show();
  },
      function () {
        $(this).removeClass('cart-pop-container-hover').find('#cartPop').hide();
      });
  $('.cart-pop-container').click(function(e) {
    $(this).trigger('mouseenter');
    $('.hdr-drop-cntnr').trigger('mouseleave');
    e.stopPropagation();
  });
  (function () {
    var onSuccess = function (json) {


      if (json.exception) {
        HK.alert({title: HK.titles.smthngNtRgt, content: HK.utils.generateHTMLForException(json.results), theme: HK.POPUP.THEME.ALERT});
      } else {
        var results = json.results;
        var updateCartData = HK.dataObj.getObject(HK.dataObj.type.UPDATE_CART);

        updateCartData.setCartValue(results.cartValue);
        updateCartData.setNoOfItems(results.noOfItems);

        //updateCartData.setSvName(results.svName);
        HK.updateCartPop(updateCartData, false);
      }
    };
    var onError = function (xhr, a_status) {
      HK.alert({title: HK.titles.smthngNtRgt, content: HK.errs.requestFail, theme: HK.POPUP.THEME.ALERT});

    }
    HK.Ajax.getJson(HK.urls.summaryCart, onSuccess, onError);
  }()
      )


  $('.go-to-top').click(function (e) {
    e.preventDefault();
    HK.utils.Scroll.toTop();
  })

  //show go to top button in footer
  if ($(window).height() < $(document).height()) {
    $('#footer').find('.go-to-top').show();
  }

  //fix body height
  if ($(window).height() > $('body').height()) {
    $('.mainContainer').css('min-height', $(window).height() - $('#header').height() - 200);
  }


  //Scroll to an element
  $('[data-scroll-target]').on('click', function() {
    var curEle = $(this);
    HK.utils.Scroll.toElement($(curEle.data('scrollTarget')), curEle.data('scrollTime'));
  });
  //document ready ends
});


function rotate() {
  $('#next').click();
}
/**-------------------------------------- Banner layout JS ends --------------------------------------------------------**/


HK.updateCartPop = function (data, showPop) {
  try {
    var nm = data.getSvName();
    var cartValue = data.getCartValue();

    //var pForm = data.pForm;
    var cartSize = data.getNoOfItems();

  }
  catch (e) {

  }
  var ele = $('#cartPop');
  var txt = ele.find('.body .msg');
  txt.html('');
  if (nm != null && nm.length > 0) {
    txt.append('<div class="fnt-bold mrgn-b-5">Recent</div>');
    txt.append(nm + '<div class="fnt-light">' + HK.msgs.added2Crt + "</div>");
    txt.append('<hr>');
  }
  txt.append('<div class="fnt-bold mrgn-b-5">Cart summary</div>');
  txt.append('<div>' + cartSize + ' items ');
  if (cartSize > 0)
  {
    //txt.append('| Rs. ' + cartValue + '</div>');
  } else {
    txt.append('</div>');
  }
  txt.append('<br>');
  txt.append('<div class=""><a href="' + HK.urls.cartPage + '" style=""class="btn btn-blue fnt-caps btn-mini">Proceed to Cart</a></div>');
  //updateCartCounter(cartSize);
  $('[data-role=cart-counter]').text(cartSize);
  if (showPop != false) {
    $('.cart-pop-container').addClass('cart-pop-container-hover');
    ele.show();
  }
}

/**
 * map implementation
 */

HK.HashMap = function Map() {
  this.keys = new Array();
  this.data = new Object();

  this.put = function(key, value) {
    if (this.data[key] == null) {
      this.keys.push(key);
    }
    this.data[key] = value;
  };

  this.get = function(key) {
    return this.data[key];
  };

  this.remove = function(key) {
    var index = $.inArray(key, this.keys) ;
    if (index > -1) {
      this.keys.splice(index, 1);
      this.data[key] = null;
    }
  };

  this.each = function(fn) {
    if (typeof fn != 'function') {
      return;
    }
    var len = this.keys.length;
    for (var i = 0; i < len; i++) {
      var k = this.keys[i];
      fn(k, this.data[k], i);
    }
  };

  this.entrys = function() {
    var len = this.keys.length;
    var entrys = new Array(len);
    for (var i = 0; i < len; i++) {
      entrys[i] = {
        key : this.keys[i],
        value : this.data[i]
      };
    }
    return entrys;
  };

  this.isEmpty = function() {
    return this.keys.length == 0;
  };

  this.size = function() {
    return this.keys.length;
  };
}

/**
 * map end
 */

HK.Ajax = function () {


  return {
    getJson: function (url, onSuccess, onError) {
      jQuery.ajax({type: "GET", url: url, dataType: "json", cache : false,
        success: function (json) {

          if (HK.utils.Response.hasErr(json)) {
            console.log("has err su" + json + " url " + url);
            HK.alert({content: HK.utils.Response.getErr(json), theme: HK.POPUP.THEME.ALERT});
          } else {
            if (typeof onSuccess === "function")
              onSuccess.call(this, json);
          }
        },
        error: function (xhr, a_status) {
          var errorMsg;
          console.log("has err er" + a_status + " xhr " + xhr);
          if (typeof onError === "function") {
            onError.call(this, xhr, a_status);
          } else if (a_status === "error") { // Expected status: timeout/error/notmodified/parsererror
            if (xhr.status == 404) {
              errorMsg = " This request does not exist.";
            } else if (xhr.status == 500) {
              errorMsg = "An unexpected error occured on server while processing this request. Try Again."
            }
          } else if (a_status === "timeout") {
            errorMsg = "Stay the patient course. Of little worth is your ire. The network is down."
          } else if (a_status === "parsererror") {
            errorMsg = "Yesterday it worked. Today it is not working. The response from server couldn't be processed properly."
          }
          if (errorMsg) {
            HK.alert({title: 'We cannot allow that', content: errorMsg, theme: HK.POPUP.THEME.ALERT});
          }
        },
        beforeSend: function (xhr) {
          if (xhr) {
            xhr.setRequestHeader("Accept", "application/json");
          }
        }
      });
    },
    postJson: function (url, map, onSuccess, onError) {
      jQuery.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: url,
        data: JSON.stringify(map),
        dataType: "json",
        cache : false,
        success: function (json) {
          if (typeof onSuccess === "function") {
            onSuccess.call(this, json);
          } else {
            if (HK.utils.Response.hasErr(json)) {
              HK.alert({content: HK.utils.Response.getErr(json), theme: HK.POPUP.THEME.ALERT});
            }
          }
        },
        error: function (xhr, a_status) {
          var errorMsg;
          if (typeof onError === "function") {
            onError.call(this, xhr, a_status);
          } else if (a_status === "error") { // Expected status: timeout/error/notmodified/parsererror
            if (xhr.status == 404) {
              errorMsg = " This request does not exist.";
            } else if (xhr.status == 500) {
              errorMsg = "An unexpected error occured on server while processing this request. Try Again."
            }
          } else if (a_status === "timeout") {
            errorMsg = "Stay the patient course. Of little worth is your ire. The network is down."
          } else if (a_status === "parsererror") {
            errorMsg = "Yesterday it worked. Today it is not working. The response from server couldn't be processed properly."
          }
          if (errorMsg) {
            HK.alert({title: 'We cannot allow that', content: errorMsg, theme: HK.POPUP.THEME.ALERT});
          }
        },
        beforeSend: function (xhr) {
          if (xhr) {
            xhr.setRequestHeader("Accept", "application/json");
          }
        }
      });
    },
    customReq: function (reqObj) {
      var def = {
        type: "GET",
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        cache : false,
        success: function (json) {

        },
        error: function (xhr, a_status) {
          var errorMsg;
          if (typeof onError === "function") {
            onError.call(this, xhr, a_status);
          } else if (a_status === "error") { // Expected status: timeout/error/notmodified/parsererror
            if (xhr.status == 404) {
              errorMsg = " This request does not exist.";
            } else if (xhr.status == 500) {
              errorMsg = "An unexpected error occured on server while processing this request. Try Again."
            }
          } else if (a_status === "timeout") {
            errorMsg = "Stay the patient course. Of little worth is your ire. The network is down."
          } else if (a_status === "parsererror") {
            errorMsg = "Yesterday it worked. Today it is not working. The response from server couldn't be processed properly."
          }
          if (errorMsg) {
            HK.alert({title: 'We cannot allow that', content: errorMsg, theme: HK.POPUP.THEME.ALERT});
          }
        },
        beforeSend: function (xhr) {
          if (xhr) {
            xhr.setRequestHeader("Accept", "application/json");
          }
        }
      };
      var ajaxObj = $.extend(def, reqObj);
      jQuery.ajax(ajaxObj);
    }
  };
}();


/**---------------------------------------Accordion Plugin starts--------------------------------------------------------**/
/**
 * Created with IntelliJ IDEA.
 * User: Sachit
 * Date: 23/05/13
 * Time: 13:44
 *
 * ele : class of parent container where accordion to be applied
 */
$.fn.collapsible = function (elementClass) {
  return this.each(function () {

    //define
    var ele = $(this);
    var collapsibleHeading = ele.find(".collapsible-hdr");
    var collapsibleContent = ele.find(".collapsible-cntnt");
    //modify markup & attributes

    collapsibleHeading.children("span").addClass('collapsible-heading')
        .prepend('<span class="collapsible-heading-status"></span>')
        .wrapInner('<a href="#" class="collapsible-heading-toggle"></a>');
    collapsibleContent.addClass('collapsible-content');
    //events
    collapsibleHeading.unbind('collapse')
        .bind('collapse', function () {
      $(this).children("span")
          .addClass('collapsible-heading-collapsed icn-expand');
      //.find('.collapsible-heading-status').text('Show ');

      collapsibleContent.slideUp(function () {
        $(this).addClass('collapsible-content-collapsed').removeAttr('style').attr('aria-hidden', true);
      });
    }).unbind('expand').
        bind('expand', function () {
      $(this).children("span")
          .removeClass('collapsible-heading-collapsed icn-expand');
      //.find('.collapsible-heading-status').text('Hide ');
      collapsibleContent
          .slideDown(function () {
        $(this).removeClass('collapsible-content-collapsed').removeAttr('style').attr('aria-hidden', false);
      });
    }).unbind('click')
        .click(function () {

      if ($(this).children("span").is('.collapsible-heading-collapsed')) {
        $(this).trigger('expand');
      }
      else {
        $(this).trigger('collapse');
      }
      return false;
    })
        .trigger('expand');
  });
};
/**---------------------------------------Accordion Plugin ends----------------------------------------------------------**/

/*dialog js plugin begins dont change without consulting author :)*/
function ShowHide(divId, status)
{
  var viewportwidth = $(document).width();
  var viewportheight = $(document).height();
  if (status != '1') var status = '0';
  if (status == '0')
  {

    $('#' + divId).removeClass('hide').addClass('show');
    $('#overlayDIV').removeClass('hide').addClass('show').css({width: viewportwidth + 'px', height: viewportheight + 'px'});
  }
  else
  {
    $('#' + divId).removeClass('show').addClass('hide');
    $('#overlayDIV').removeClass('show').addClass('hide');
  }
}

/*dialog Js plugin ends */

/**---------------------------------------handle bar template handler starts----------------------------------------------------------**/
HK.UIHelper = function () {
  return{
    renderToHtml: function (template, json) {
      var handleBarTemplate = Handlebars.compile(template);
      var html = handleBarTemplate(json);

      //return html.replace("<!--\n", "");
      return $.trim(html);
    }
  };
};

/**---------------------------------------handle bar template handler ends----------------------------------------------------------**/

/**--------------------------------------Validation add ons start----------------------------------**/
HK.regex = {};
HK.regex.EMAIL = /^([A-Za-z0-9_\-\.\+])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

HK.regex.phone = /[\+0-9\-]+$/;
HK.regex.number = /^[0-9]+$/;
HK.validator = {};

HK.validator.prep = function (ref) {
  return this.jqfy(ref);
}

HK.validator.jqfy = function (ref) {
  if (typeof ref == 'string') {
    return $(ref);
  } else if (typeof ref == 'object') {
    return ref;
  }
  return false
}

HK.validator.getLength = function (ele) {
  //textarea use case not covered yet
  return ele.value.length;
}


HK.validator.minLength = function (ele, ln) {
  ele = this.prep(ele);
  if (HK.validator.getLength(ele) >= ln) {
    return true;
  }
  return false;
}

HK.validator.maxLength = function (ele, ln) {
  ele = this.prep(ele);
  if (HK.validator.getLength(ele) <= ln) {
    return true;
  }
  return false
}

HK.validator.isNull = function (ele) {
  ele = this.prep(ele);
  if (HK.validator.getLength(ele) <= 0) {
    return true
  }
  return false
}

HK.validator.isEqual = function (ele1, ele2) {
  ele1 = this.prep(ele1);
  ele2 = this.prep(ele2);
  if (ele1.val() === ele2.val()) {
    return true
  }
  return false
}

HK.validator.isEmail = function (ele) {
  ele = this.prep(ele);
  var rege = HK.regex.EMAIL;
  if (rege.test(ele.val())) {
    return true;
  }
  return false
}

HK.validator.isPhoneNumber = function (ele) {
  ele = this.prep(ele);
  var rege = HK.regex.phone;
  if (rege.test(ele.val())) {
    return true;
  }
  return false
}

HK.validator.isNumber = function (ele) {
  ele = this.prep(ele);
  var rege = HK.regex.number;
  if (rege.test(ele.val())) {
    return true;
  }
  return false
}

HK.validator.showErrMsg = function (ele, msg) {
  ele = this.prep(ele);
  var errorIcn = $("<span class='icn-warning-small err-icn' ></span>");
  var errTxtMsg = $("<p class='err-txt'>" + msg + "</p>");
  if (!$(ele).hasClass('err-brdr')) {
    $(ele).addClass('err-brdr');
    $(ele).after(errorIcn);
    $(ele).after(errTxtMsg);
    return true
  }
  return false
}

HK.validator.hideErrMsg = function (ele) {
  ele = this.prep(ele);
  $(ele).removeClass('err-brdr');
  $(ele).next('.err-txt').remove();
  $(ele).next('.icn-warning-small').remove();

}


/**--------------------------------------Validation add ons end----------------------------------**/

$(document).click(function () {
  $('.cart-pop-container').removeClass('cart-pop-container-hover');
  $('.hdr-drop-cntnr').removeClass('hdr-drop-cntnr-hover');
  $('.popUp,.hdr-drop-down').hide();

});

/**------------------------------------Lazy Load Carousel Starts--------------------------------**/

!function ($) {
  "use strict"; // jshint ;_;


  /* CAROUSEL CLASS DEFINITION
   * ========================= */

  var Carousel = function (element, options) {
    this.$element = $(element)
    this.$indicators = this.$element.find('.carousel-indicators')
    this.options = options
    this.options.pause == 'hover' && this.$element
        .on('mouseenter', $.proxy(this.pause, this))
        .on('mouseleave', $.proxy(this.cycle, this))

    // LAZY LOAD START
    var that = this

    this.loading = this.$element.find('.loading');
    this.lazy_elements = this.$element.find('.item img[lazy-src]')
    this.lazy_elements.load(function() {
      var $this = $(this)
      $this.attr('lazy-load', 'success')
      that.resume($this)
    })
        .error(function() {
      var $this = $(this)
      $this.attr('lazy-load', 'error')
      that.resume($this)
    })
    // LAZY LOAD END
  }

  Carousel.prototype = {

    cycle: function (e) {
      if (!e) this.paused = false
      if (this.interval) clearInterval(this.interval);
      this.options.interval
          && !this.paused
          && (this.interval = setInterval($.proxy(this.next, this), this.options.interval))
      return this
    }

    , getActiveIndex: function () {
      this.$active = this.$element.find('.item.active')
      this.$items = this.$active.parent().children()
      return this.$items.index(this.$active)
    }

    , to: function (pos) {
      var activeIndex = this.getActiveIndex()
          , that = this

      if (pos > (this.$items.length - 1) || pos < 0) return

      if (this.sliding) {
        return this.$element.one('slid', function () {
          that.to(pos)
        })
      }

      if (activeIndex == pos) {
        return this.pause().cycle()
      }

      return this.slide(pos > activeIndex ? 'next' : 'prev', $(this.$items[pos]))
    }

    , pause: function (e) {
      if (!e) this.paused = true
      if (this.$element.find('.next, .prev').length && $.support.transition.end) {
        this.$element.trigger($.support.transition.end)
        this.cycle(true)
      }
      clearInterval(this.interval)
      this.interval = null
      return this
    }

    , next: function () {
      if (this.sliding) return
      return this.slide('next')
    }

    , prev: function () {
      if (this.sliding) return
      return this.slide('prev')
    }

    // LAZY LOAD START
    , load: function (img) {
      this.sliding = false
      this.loading.removeClass('hide')

      img.attr('src', img.attr('lazy-src'))
      img.removeAttr('lazy-src')
      img.attr('lazy-load', 'loading')
    }

    , resume: function (img) {
      var $next = img.parents('.item')
          , children = $next.parents('.carousel-inner').children()
          , nextPos = children.index($next)

      this.loading.addClass('hide')
      this.to(nextPos)

      this.options.interval && this.cycle()
    }
    // LAZY LOAD END

    , slide: function (type, next) {
      var $active = this.$element.find('.item.active')
          , $next = next || $active[type]()
          , isCycling = this.interval
          , direction = type == 'next' ? 'left' : 'right'
          , fallback = type == 'next' ? 'first' : 'last'
          , that = this
          , e

      this.sliding = true

      isCycling && this.pause()

      $next = $next.length ? $next : this.$element.find('.item')[fallback]()

      e = $.Event('slide', {
        relatedTarget: $next[0]
        , direction: direction
      })

      if ($next.hasClass('active')) return

      //LAZY LOAD START
      var $nextLazyImg = $next.find('img[lazy-src]')
      if ($nextLazyImg.length) {
        this.load($nextLazyImg)
        return this
      }
      // LAZY LOAD END

      if (this.$indicators.length) {
        this.$indicators.find('.active').removeClass('active')
        this.$element.one('slid', function () {
          var $nextIndicator = $(that.$indicators.children()[that.getActiveIndex()])
          $nextIndicator && $nextIndicator.addClass('active')
        })
      }

      if ($.support.transition && this.$element.hasClass('slide')) {
        this.$element.trigger(e)
        if (e.isDefaultPrevented()) return
        $next.addClass(type)
        $next[0].offsetWidth // force reflow
        $active.addClass(direction)
        $next.addClass(direction)
        this.$element.one($.support.transition.end, function () {
          $next.removeClass([type, direction].join(' ')).addClass('active')
          $active.removeClass(['active', direction].join(' '))
          that.sliding = false
          setTimeout(function () {
            that.$element.trigger('slid')
          }, 0)
        })
      } else {
        this.$element.trigger(e)
        if (e.isDefaultPrevented()) return
        $active.removeClass('active')
        $next.addClass('active')
        this.sliding = false
        this.$element.trigger('slid')
      }

      isCycling && this.cycle()

      return this
    }

  }


  /* CAROUSEL PLUGIN DEFINITION
   * ========================== */

  var old = $.fn.carousel

  $.fn.carousel = function (option) {
    return this.each(function () {
      var $this = $(this)
          , data = $this.data('carousel')
          , options = $.extend({}, $.fn.carousel.defaults, typeof option == 'object' && option)
          , action = typeof option == 'string' ? option : options.slide
      if (!data) $this.data('carousel', (data = new Carousel(this, options)))
      if (typeof option == 'number') data.to(option)
      else if (action) data[action]()
      else if (options.interval) data.pause().cycle()
    })
  }

  $.fn.carousel.defaults = {
    interval: 5000
    , pause: 'hover'
  }

  $.fn.carousel.Constructor = Carousel


  /* CAROUSEL NO CONFLICT
   * ==================== */

  $.fn.carousel.noConflict = function () {
    $.fn.carousel = old
    return this
  }

  /* CAROUSEL DATA-API
   * ================= */

  $(document).on('click.carousel.data-api', '[data-slide], [data-slide-to]', function (e) {
    var $this = $(this), href
        , $target = $($this.attr('data-target') || (href = $this.attr('href')) && href.replace(/.*(?=#[^\s]+$)/, '')) //strip for ie7
        , options = $.extend({}, $target.data(), $this.data())
        , slideIndex

    $target.carousel(options)

    if (slideIndex = $this.attr('data-slide-to')) {
      $target.data('carousel').pause().to(slideIndex).cycle()
    }

    e.preventDefault()
  })

}(window.jQuery);

/**------------------------------------Lazy Load Carousel Ends--------------------------------**/
