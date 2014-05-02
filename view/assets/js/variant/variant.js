$(document).ready(function () {
  $('.nav-box li.menu-options a').click(function () {
    var target = $(this).data('target');
    HK.utils.Scroll.toElement($(target));
    $(this).blur();
  });

  var campaign = (function () {
    var box = null;

    function handleCampaignClick(e) {
      e.stopImmediatePropagation();
      showCampaignBox();
    }

    function showCampaignBox() {
      box.show();
    }

    function hideCampaignBox() {
      box.hide();
    }

    function createCampaignBox() {
      var trgt = $('.zoomWrapper'),
          trgtCoordinate = trgt.offset(),
      //trgtLeft = trgtCoordinate.left,
          mrgnTop = trgt.height() + 2,
          trgtWidth = trgt.width() + 2,
          trgtHeight = trgt.height() + 2,
          trgtZ = trgt.css('z-index');
      if (typeof trgtZ === 'number') {
        trgtZ = +1;
      } else {
        trgtZ = 1;
      }
      box = $("<div></div>");
      box.width(trgtWidth);
      box.addClass('hide fnt-sz14');
      box.height(trgtHeight);
      box.css({ 'position': 'absolute', 'margin-top': -mrgnTop, 'z-index': trgtZ, background: 'white' });
      box.html($('.campaign-html').html());
      box.find('.campaign-hide-box').click(hideCampaignBox);
      $('.campaign-html').remove();
      trgt.after(box);
    }

    return {
      sB: showCampaignBox,
      hB: hideCampaignBox,
      hCC: handleCampaignClick,
      cCB: createCampaignBox
    };
  }());


  if (HK.vpc.showCarousel) {
    $('#gallery_01').flexisel({noOfItemsToScroll: 3, visibleItems: 3});
  }

  $("#img_01").elevateZoom({gallery: 'gallery_01', cursor: 'pointer', galleryActiveClass: 'active', zoomWindowHeight: 350, zoomWindowWidth: $('.zoomWidth').width(), zoomWindowOffetx: 60, zoomWindowOffety: '-10', tint: false, tintColour: '#e0e0e0', zoomTintFadeIn: 200, zoomTintFadeOut: 300});

  campaign.cCB();
  $('.img_campaign').parent('div').click(function (e) {
    e.stopImmediatePropagation();
    $(this).find('img').trigger('click');
  });
  $('.img_campaign').click(campaign.hCC);
  //pass the images to Fancybox
  $("#img_01").bind("click", function (e) {
    var ez = $('#img_01').data('elevateZoom');
    $.fancybox(ez.getGalleryList());
    return false;
  });
  $('#gallery_01 img:not(.img_campaign)').click(campaign.hB);


  function buildFilterKey(allAttrDivs, currAttrDiv, currAttrValSpan) {
    var filterKey = "";
    var currAttrName = currAttrDiv.attr("attr-name");
    var currAttrVal = currAttrValSpan.attr("attr-val-name");
    var filterKeyValueSeperator = HK.vpc.filterKeyValueSeperator;
    var filterSeperator = HK.vpc.filterSeperator;
    allAttrDivs.each(function () {
      var attrName = $(this).attr("attr-name");
      if (attrName != currAttrName) {
        var selectedDiffAttrValue = $(this).find('.diff-attr-val.selected-val').attr("attr-val-name");
        filterKey += attrName + filterKeyValueSeperator + selectedDiffAttrValue + filterSeperator;
      } else {
        filterKey += currAttrName + filterKeyValueSeperator + currAttrVal + filterSeperator;
      }
    });
    return filterKey;
  }

  function buildFilterKeyVariantMap() {
    return HK.vpc.availableVariant;
  }

  function buildFilterKeyVariantOOSMap() {
    return HK.vpc.availableVariantOOS;
  }

  function buildCurrentSelection(attrDivToBeChanged) {
    var currSelection = " in ";
    var attrNameToBeChanged = attrDivToBeChanged.attr('attr-name');
    $('li.diff-attr-val.selected-val').each(function () {
      var attrName = $(this).parents('.diff-attr').attr('attr-name');
      if (attrName != attrNameToBeChanged) {
        currSelection += $.trim($(this).text()) + ", ";
      }
    });
    return currSelection;
  }


  var keyVariantMap = buildFilterKeyVariantMap();
  var keyVariantOOSMap = buildFilterKeyVariantOOSMap();
  var variantDiffAttributesDiv = $('.variant-diff-attr-div');
  $('img.img-thumb-box').click(function () {
    var primaryImageDiv = $('.parentImg');
    var primaryImage = primaryImageDiv.find('img');
    var primaryImageCaption = primaryImageDiv.find('p');
    primaryImage.attr("src", $(this).attr("mLink"));
    primaryImage.attr("alt", $(this).attr("alt"));
    primaryImageCaption.text($(this).attr("caption"));
  });

  $('li.diff-attr-val:not(.selected-val)').click(function () {
    function getBaseUrl(vrntId) {
      var navKey = "navKey";
      var keyToLook = "VRNT-";

      function getTrimmedQueryString(queryString) {
        var input = queryString,
            qsArr,
            hasVrntKey = false;

        input = input.replace('?', '');
        qsArr = input.split('&'); //create an array for query string

        for (var i = 0; i < qsArr.length; i++) {
          if (qsArr[i].indexOf(navKey) >= 0) {

            //if query string contains the key remove that element from array
            qsArr.splice(i, 1);
            break;
          }
        }

        return '?' + qsArr.join('&');
      }

      //base url of current page without query string
      var baseUrl = location.protocol + '//' + location.host + location.pathname;

      //query string of current url
      var queryString = location.search;
      queryString = getTrimmedQueryString(queryString);

      if (queryString.length === 1) {
        queryString = queryString + navKey + '=' + keyToLook + vrntId;
      } else {
        queryString = queryString + '&' + navKey + '=' + keyToLook + vrntId;
      }

      return ( baseUrl + queryString );

    }

    var parentAttrDiv = $(this).parents('.diff-attr');
    var diffAttrDivs = variantDiffAttributesDiv.find('.diff-attr');
    var key = "";
    var currentAttrValSpan = $(this);

    var baseUrl = window.location.href;
    var redirectToVariantId;

    key = buildFilterKey(diffAttrDivs, parentAttrDiv, currentAttrValSpan);

    if (keyVariantMap[key] === undefined) {
      redirectToVariantId = $(this).attr("default-variant");
    } else {
      redirectToVariantId = keyVariantMap[key];
    }

    baseUrl = getBaseUrl(redirectToVariantId);


    //baseUrl = baseUrl.concat(redirectToVariantId);
    window.location.href = baseUrl;
  });

  $('li.diff-attr-val:not(.selected-val)').mouseleave(function () {
    //$(this).removeClass('label-important');
    //$(this).removeClass('label-success');
    //$(this).removeClass('bold');
    if ($(this).hasClass('oos')) {

    } else {
      $(this).removeAttr("title");
    }

    //        $(this).tooltip('hide');
  });

  $('li.diff-attr-val:not(.selected-val)').each(function () {
    var parentAttrDiv = $(this).parents('.diff-attr');
    var diffAttrDivs = variantDiffAttributesDiv.find('.diff-attr');
    var currSelection = buildCurrentSelection(parentAttrDiv);
    var key = "";
    var currentAttrValSpan = $(this);
    key = buildFilterKey(diffAttrDivs, parentAttrDiv, currentAttrValSpan);
    if (keyVariantMap[key] == null) {

      $(this).addClass('inactive');
    } else {
      if (keyVariantOOSMap[key] == "true") {
        $(this).addClass('oos');
        $(this).attr('title', "Out of stock " + currSelection);
      }
    }

  });
  $('li.diff-attr-val:not(.selected-val)').mouseenter(function () {
    var parentAttrDiv = $(this).parents('.diff-attr');
    var diffAttrDivs = variantDiffAttributesDiv.find('.diff-attr');
    var key = "";
    var currentAttrValSpan = $(this);
    key = buildFilterKey(diffAttrDivs, parentAttrDiv, currentAttrValSpan);


    if (keyVariantMap[key] == null) {
      var currSelection = buildCurrentSelection(parentAttrDiv);
      if ($(this).hasClass('oos')) {

      } else {
        $(this).attr("title", "Not available" + currSelection);
        //$(this).addClass('label-important');
        /*$(this).tooltip({
         title:"Not available" + currSelection
         });
         $(this).tooltip('show');*/
      }
    } else {
      //$(this).addClass('label-success');
      //$(this).addClass('bold');
    }
  });


  // Read a page's GET URL variables and return them as an associative array.
  function getUrlVars(tmUrl) {
    var vars = [], hash;
    var hashes = tmUrl.slice(tmUrl.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
      hash = hashes[i].split('=');
      vars.push(hash[0]);
      vars[hash[0]] = hash[1];
    }
    //console.log(vars + "is vars");
    return vars;
  }

  /* targetting mantra ajax begins */
  function reqdParamsTm(listItems) {
    var ratingPercent = 0,
        discountPercent = 0,
        discount = 0,
        campaignId = 0,
        position = 0,
        itrackerRcmdParams = 0,
        itrackerRviParams = 0,
        itemURL = listItems.itemURL;

    campaignId = getUrlVars(itemURL)["navKey"].split("VRNT-").toString().replace(",", "")
    position = getUrlVars(itemURL)["ref"];

    rating = listItems.itemRating,
        mrpPrice = listItems.itemMRP,
        offerPrice = listItems.itemPrice;
    if (Number(rating)) {
      ratingPercent = Number(rating) / 5 * 100;
    }
    if (Number(mrpPrice) != Number(offerPrice)) {
      discount = (Number(mrpPrice) - Number(offerPrice)) / Number(mrpPrice) * 100;
      discountPercent = Math.round(discount);
    }
    if (position.indexOf("tm_rhf_rvi_") >= 0) {
      position = position.split("tm_rhf_rvi_").toString().replace(",", "")
      itrackerRviParams = "&itracker=w:rvi|" + HK.vpc.variantId + "|;p:" + position + "|;c:" + campaignId + "|;";
      listItems.itemURL = itemURL + itrackerRviParams;

    }
    else {
      position = position.split("tm_rhf_rec_").toString().replace(",", "")
      itrackerRcmdParams = "&itracker=w:rcmd|" + HK.vpc.variantId + "|;p:" + position + "|;c:" + campaignId + "|;";
      listItems.itemURL = itemURL + itrackerRcmdParams;


    }
    listItems.ratingPercent = ratingPercent;
    listItems.discountPercent = discountPercent;


  }

  if (!navigator.userAgent.match(/msie|trident/i)) {
    HK.Ajax.customReq({url: HK.urls.targetMantraUrl + "?w=rhf,bs&pid=" + HK.vpc.variantId + "&mid=131105&limit=10&json=true",
      success: function (responseData) {
        var recommendedBestSellerCont = $('#recommendedBestSellerItemsCont');
        var recommendedBestSellerTemplate = Handlebars.compile($('#recommendedBestSellerTemplate').html());
        var recViewedContainer = $('#recViewedItemsCont');

        if (responseData.rhf != null) {

          var recViewedList = responseData.rhf.recentHistory.viewedItems;
          var recViewedContainer = $('#recViewedItemsCont');
          var recViewedTemplate = Handlebars.compile($('#recentlyViewedTempate').html());
          var recommendedItemsList = responseData.rhf.recommendations.recommendedItems;


          if (recViewedList.length > 0) {
            recViewedContainer.removeClass('loader');
            var $li = $("<li class='carousel2-varnt-cont '></li>");
            for (var i = 0, len = recViewedList.length; i < len; i++) {

              var recViewed = recViewedList[i];
              reqdParamsTm(recViewed);
              var content = recViewedTemplate(recViewed);
              $li.append(content);
              if ((i + 1) % 2 === 0) {
                recViewedContainer.append($li);
                $li = $("<li class='carousel2-varnt-cont '></li>");
              } else if (i === len - 1) {
                recViewedContainer.append($li);
              }

            }

            $('#recentlyViewed').show();
            if (recViewedList.length > 2) {
              $("#recViewedItemsCont").flexisel({noOfItemsToScroll: 1, visibleItems: 1, animationSpeed: 300});
              HK.utils.resetHeightOfCarousel();
            }
          }
          else {
            //console.log('show msg: "you do not have any recently viewed items"');

          }
          if (recommendedItemsList.length > 0) {
            var widgetName = responseData.rhf.recommendations.subWidgetTitle;
            recommendedBestSellerCont.removeClass('loader');
            for (var i = 0, len = recommendedItemsList.length; i < len; i++) {
              var recommendedItem = recommendedItemsList[i];
              reqdParamsTm(recommendedItem);
              var content = recommendedBestSellerTemplate(recommendedItem);
              recommendedBestSellerCont.append(content);
            }
            $('#WidgetTitle').html('RECOMMENDATIONS BASED ON YOUR BROWSING HISTORY');
            $('#recommendedBestSellerItems').show();
            if (recommendedItemsList.length > 3) {
              $("#recommendedBestSellerItemsCont").flexisel({noOfItemsToScroll: 4, visibleItems: 4, animationSpeed: 300});
              HK.utils.resetHeightOfCarousel();
            }
            fixLeftNav();
          }
        }
        /* if(responseData.bs!=null && responseData.rhf == null) {
         var bestSellerItemsList = responseData.bs.bestSellerItems;
         var widgetName = responseData.bs.subWidgetTitle;
         if (bestSellerItemsList.length > 0) {
         recViewedContainer.removeClass('loader');
         recommendedBestSellerCont.removeClass('loader');
         for (var i = 0, len = bestSellerItemsList.length; i < len; i++) {
         var bestSellerItem = bestSellerItemsList[i];
         reqdParamsTm(bestSellerItem );

         var content = recommendedBestSellerTemplate(bestSellerItemsList[i]);
         recommendedBestSellerCont.append(content);
         }
         $('#recentlyViewed').show();
         $('#noRecViewed').show();
         $('#WidgetTitle').html('Best Seller Items');
         $('#recommendedBestSellerItems').show();
         if (bestSellerItemsList.length > 3) {
         $("#recommendedBestSellerItemsCont").flexisel({noOfItemsToScroll: 4, visibleItems: 4, animationSpeed: 300});
         HK.utils.resetHeightOfCarousel();
         }
         fixLeftNav();
         }
         else {
         //console.log('put no best seller items');
         }
         }*/

      }, dataType: "jsonp"});
  }

  /*targetting matntra ends*/


  ///variant bought together
  HK.Ajax.getJson(

      HK.urls.boughtTogether + "browse/" + HK.vpc.variantId + "/boughtTogether",
      function (responseData) {
        var arrayList = responseData.results.bt_var_lst;
        var btVariantSize = responseData.results.ttl_bt_var;
        if ($("#alsoBought").length > 0) {
          var variantTemplate = Handlebars.compile($('#boughtTogetherItemTemplate').html());
          var variantContainer = $('#btCont');
          variantContainer.removeClass('loader');
          //  console.log(arrayList.length);
          if (arrayList.length != 0) {
            for (var i = 0, len = arrayList.length; i < len; i++) {
              if (i in arrayList) {
                var content = variantTemplate(arrayList[i].bt_var);
                variantContainer.append(content);
              }
            }
            $('.also-bt-li').show();
            $('#alsoBought').show();

            //initialize plugin if elements more then 3
            if (btVariantSize > 3) {
              $("#btCont").flexisel({noOfItemsToScroll: 3, visibleItems: 3, animationSpeed: 300});
              HK.utils.resetHeightOfCarousel();
            }

            $("#btCont").find('.lazy').show();
          }
          else {
            $('.also-bt-li').remove();
            $('#alsoBought').remove();
            $('#btCont').remove();
          }
        }

      }, ""
  );


  /*variant combo begins*/
  HK.Ajax.getJson(

      HK.urls.variantOffer + HK.vpc.oldVariantId + "/combos",
      function (responseData) {
        var arrayList = responseData.results.combos;
        var comboVariantSize = arrayList.length;
        if ($("#offersCont").length > 0) {
          //Element is visible
          var comboVariantTemplate = Handlebars.compile($('#variantComboItemTemplate').html());
          var offersContainer = $('#offersCont');
          offersContainer.removeClass('loader');
          /*console.log(comboVariantSize);*/
          if (comboVariantSize != 0) {
            for (var i = 0, len = arrayList.length; i < len; i++) {
              if (i in arrayList) {
                var content = comboVariantTemplate(arrayList[i]);
                offersContainer.append(content);
              }
            }
            $('.offers-li').show();
            $('#offers').show();

            //initialize plugin if elements more then 3
            if (comboVariantSize > 3) {
              $("#offersCont").flexisel({noOfItemsToScroll: 3, visibleItems: 3, animationSpeed: 300});
              HK.utils.resetHeightOfCarousel();
            }

            $("#offersCont").find('.lazy').show();
          }
          else {
            $('.offers-li').remove();
            $('#offers').remove();
            $('#offersCont').remove();
          }
        }

      }, ""
  );
  /*variant combo ends*/

  /*variant offer begins*/
  HK.Ajax.getJson(

      HK.urls.variantOffer + HK.vpc.oldVariantId + "/freeVariant",
      function (responseData) {
        $('.offerbox').removeClass('hide').addClass('show');
        var freebieResponse = responseData.results;
        var freebieContainer = $('#freebieName');
        freebieContainer.removeClass('loader');
        var freebieName = freebieResponse.nm;
        if (freebieName != null) {
          var freebieHtml = "Free " + freebieName;
          freebieContainer.prepend(freebieHtml);
        }
        else {
          $('.offerbox').remove();
        }
      }, ""
  );
  /*variant offer ends*/


  /*Fixing the left nav*/
  $("#tmWidgetsCont").on('isVisible', fixLeftNav);
  $("#tmWidgetsCont").on('isHidden', fixLeftNav);
  $("#variantCompareGrid").on('isVisible', fixLeftNav);
  $("#variantCompareGrid").on('isHidden', fixLeftNav);
  function fixLeftNav() {
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

  }

  fixLeftNav();
  if ($('#variantCompareView').length > 0 || $('#tmWidgetsCont').length > 0) {
    fixCompareWidget(fixLeftNav);
  }


  /*CompareWidget fixing ends here*/

  /*speak to nutritionist code begins */
  function submitNutritionistData() {
    var currEle = $('#speakToNutritionist-submit');
    var name = $('#speakToNutritionistDialog').find('.widget-box [name="speakToUserName"]').val();
    var phone = $('#speakToNutritionistDialog').find('.widget-box [name="speakToPhone"]').val();
    var email = $('#speakToNutritionistDialog').find('.widget-box [name="speakToEmail"]').val();
    var isSubscribedUpdates;
    if ($('#subscribeCheckbox').is(':checked')) {
      isSubscribedUpdates = 'true';
    }
    else {
      isSubscribedUpdates = 'false';
    }
    var categoryId = $('#speakToNutritionistDialog').find('.widget-box [name="categoryId"]').val();

    HK.element.loader.add(currEle, true);
    var url = HK.urls.speakToNutritionistSubmit;
    var map = {
      'nm': name,
      'email': email,
      'cntNum': phone,
      'subscribe': isSubscribedUpdates,
      'catName': categoryId
    };
    var onSuccess = function (responseData) {
      if (responseData.results.success) {
        HK.element.loader.remove(currEle, true);
        var suucessMsg = responseData.messages;
        $('#speakToNutritionistDialog').find('.dialog-subcntnr').hide();
        $('#speakToNutritionistDialog').find('.resp-msg').show().addClass('sucss-txt-small').html(suucessMsg);
        /*console.log(responseData);*/
      }
      else {
        HK.element.loader.remove(currEle, true);
        var errorMsg = responseData.messages;
        $('#speakToNutritionistDialog').find('.dialog-subcntnr').hide();
        $('#speakToNutritionistDialog').find('.resp-msg').show().addClass('err-txt').html(errorMsg);

      }
    };
    var onError = function (xhr, a_status) {
      HK.element.loader.remove(currEle, true);
    };
    HK.Ajax.postJson(url, map, onSuccess, onError);

  };

  $('.speakToNutritionBtn').click(function (e) {
    HK.utils.Scroll.toElement('body', 500);
    var currEle = $(this);
    var name, email, isError;
    var url = HK.urls.speakToNutritionistDetails;
    HK.element.loader.add(currEle, true);
    var onSuccess = function (responseData) {
      HK.element.loader.remove(currEle, true);
      var resultArray = responseData.results;
      name = resultArray.nm;
      email = resultArray.email;
      if (name != null && email != null) {
        $('#speakToNutritionistDialog').find('.widget-box [name="speakToUserName"]').val(name);
        $('#speakToNutritionistDialog').find('.widget-box [name="speakToEmail"]').val(email);
        ShowHide('speakToNutritionistDialog', '0');

      }
      else {
        ShowHide('speakToNutritionistDialog', '0');

      }
    };
    var onError = function (xhr, a_status) {
      HK.element.loader.remove(currEle, true);
    };
    HK.Ajax.getJson(url, onSuccess, onError);
  });

  $('.close-dialog').click(function () {
    ShowHide('speakToNutritionistDialog', '1');
  })

  $('#overlayDIV').click(function () {
    ShowHide('speakToNutritionistDialog', '1');
  })
  $('#speakToNutritionist-submit').click(function () {
    var doSubmit = true;
    if (HK.validator.isNull('[name=speakToUserName]')) {
      HK.validator.showErrMsg('[name=speakToUserName]', HK.errs.enterName);
      doSubmit = false;
    }
    else {
      HK.validator.hideErrMsg('[name=speakToUserName]');
    }
    if (HK.validator.isNull('[name=speakToEmail]')) {
      HK.validator.hideErrMsg('[name=speakToEmail]');
      HK.validator.showErrMsg('[name=speakToEmail]', HK.errs.enterEmail);
      doSubmit = false;
    }
    else if (!HK.validator.isEmail('[name=speakToEmail]')) {
      HK.validator.hideErrMsg('[name=speakToEmail]');
      HK.validator.showErrMsg('[name=speakToEmail]', HK.errs.invalidEmail);
      doSubmit = false;
    }
    else {
      HK.validator.hideErrMsg('[name=speakToEmail]');
    }

    if (HK.validator.isNull('[name=speakToPhone]')) {
    }

    else if (!HK.validator.isPhoneNumber('[name=speakToPhone]')) {
      doSubmit = false;
      HK.validator.hideErrMsg('[name=speakToPhone]');
      HK.validator.showErrMsg('[name=speakToPhone]', HK.errs.invalidPhoneNumber);
    }
    else {
      HK.validator.hideErrMsg('[name=speakToPhone]');
    }
    if (!doSubmit) {
      return false;
    }
    submitNutritionistData();
  });
  /*speak to nutritionist code ends*/

  /* pincode begins */




  $('.js-chng-pincode').click(function () {
    $('.js-chng-pin-cntnr').hide();
    $('.js-chk-pin-cntnr').show();

  })


  function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toGMTString();
    document.cookie = cname + "=" + cvalue + "; " + expires + ";path=/";
  }

  function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
      var c = $.trim(ca[i]);
      //console.log(c.substring(name.length,c.length));
      if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
  }


  function chkDelPincode(pinCode, currEle) {
    var oldvariantId = HK.vpc.oldVariantId, url, onSuccess, onError
    url = HK.urls.browseUrl + pinCode + "/" + oldvariantId + "/estimatedDeliveryDate";
    if (currEle != undefined)
      HK.element.loader.add(currEle, true);
    onSuccess = function (responseData) {
      if (currEle != undefined)
        HK.element.loader.remove(currEle, true);
      var resultData, estimatedDelDate, isCodFlag, retPincode,estimatedDispDate,msg;
      resultData = responseData.results;
      estimatedDispDate = resultData.estDispatchDate;
      estimatedDelDate = resultData.estDeliveryDate;
      isCodFlag = resultData.isCODAllowed;
      retPincode = resultData.pin;
      msg = responseData.messages[0];

      if(responseData.exception==false)
      setCookie("hkPincode", retPincode, 300);

      dataLayer.push({'event':'check-pincode', 'eventCategory': 'Pincode', 'eventAction': 'Click', 'eventLabel': retPincode});
      if (estimatedDelDate != null) {
        $('.js-chk-pin-cntnr').hide();
        $('#chngPincodeVal').html(retPincode);
        $('#dispDate').html(estimatedDispDate);
        $('#delDate').html(estimatedDelDate);
        $('.nt-avail-cntnr').hide();
        $('.del-cntnr').show();
        $('.js-chng-pin-cntnr').show();
        if (isCodFlag == "true") {
          $('.js-cod-cntnr').css('display', 'inline-block');
        }
        else {
          $('.js-cod-cntnr').html('Cash on Delivery Unavailable').css('display', 'inline-block');

        }

      }
      else{
        $('.js-chk-pin-cntnr').hide();
        $('.del-cntnr').hide();
        $('#chngPincodeVal').html(retPincode);
        $('#nt-avail-msg').html(msg);
        $('.nt-avail-cntnr').show();

        $('.js-cod-cntnr').html('Cash on Delivery Unavailable').css('display', 'inline-block');
        $('.js-chng-pin-cntnr').show();


      }

    };
    onError = function (xhr, a_status) {
      if (currEle != undefined)
        HK.element.loader.remove(currEle, true);
    };

    HK.Ajax.getJson(url, onSuccess, onError);
    if (currEle != undefined)
      HK.element.loader.remove(currEle, true);
  }

  $('.js-chk-pincode').click(function () {
    var pinCode = $.trim($('[name=pincode]').val()), currEle;
    currEle = $(this);
    console.log(currEle);

    if (HK.validator.isNull('[name=pincode]')) {
      $('.js-chk-pin-cntnr').append("<p class='err-txt pin-err'>" + HK.errs.invalidPincode + "</p>")

      return false;
    }
    else if (!HK.validator.isPincode('[name=pincode]')) {
      $('.js-chk-pin-cntnr').find('p').remove();
      $('.js-chk-pin-cntnr').append("<p class='err-txt pin-err'>" + HK.errs.invalidPincode + "</p>")
      return false;
    }
    else {
      $('.js-chk-pin-cntnr').find('p').remove();
      chkDelPincode(pinCode, currEle);
    }

  })


  var cookiePincode = getCookie("hkPincode");
  if (cookiePincode != "") {
    chkDelPincode(cookiePincode);
  }
  else {
    $('.js-chk-pin-cntnr').show();

  }

  /* pincode ends */

});