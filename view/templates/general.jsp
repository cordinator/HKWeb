<%@ page import="com.hk.common.constants.EnvConstants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibInclude.jsp" %>
<s:layout-definition>
<!DOCTYPE html>
<html lang="en">
<head>
  <%@include file='_frontEndLogging.jsp' %>
  <meta name="viewport" content="width=device-width"/>
  <meta name="mobileoptimized" content="0"/>
  <link rel="canonical" href="${canonicalUrl}"/>
  <style>
    @font-face {
      font-family: 'Open Sans';
      font-style: normal;
      font-weight: 400;
      src: local('Open Sans'), local('OpenSans'), url(http://themes.googleusercontent.com/licensed/font?kit=cJZKeOuBrn4kERxqtaUH3eQMgGoy_nKaqo2cKJRLrBJdxlT5RfGIy95sQWGkHIXZT_wDREvo4O6_6v9ljamcpjDjNODm32iLRYw2SNTAhDi20L9efk2PUOdb5H1Th4EY) format('woff2'), url(http://themes.googleusercontent.com/licensed/font?kit=cJZKeOuBrn4kERxqtaUH3Rfzzo0OiUYJdfKM9TmUas1dxlT5RfGIy95sQWGkHIXZT_wDREvo4O6_6v9ljamcpjDjNODm32iLRYw2SNTAhDi20L9efk2PUOdb5H1Th4EY) format('woff');
    }

    @font-face {
      font-family: 'Open Sans';
      font-style: normal;
      font-weight: 600;
      src: local('Open Sans Semibold'), local('OpenSans-Semibold'), url(http://themes.googleusercontent.com/licensed/font?kit=MTP_ySUJH_bn48VBG8sNSoQSOEeazGh8gh9HUNTvrRMFjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff2'), url(http://themes.googleusercontent.com/licensed/font?kit=MTP_ySUJH_bn48VBG8sNSjBj4j7RKzZd-IY3pDfmla0FjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff');
    }

    @font-face {
      font-family: 'Open Sans';
      font-style: normal;
      font-weight: 700;
      src: local('Open Sans Bold'), local('OpenSans-Bold'), url(http://themes.googleusercontent.com/licensed/font?kit=k3k702ZOKiLJc3WVjuplzIQSOEeazGh8gh9HUNTvrRMFjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff2'), url(http://themes.googleusercontent.com/licensed/font?kit=k3k702ZOKiLJc3WVjuplzDBj4j7RKzZd-IY3pDfmla0FjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff');
    }
  </style>
  <link rel="icon" href="/favicon.ico"/>
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=EDGE"/>

  <meta name="description" content="${seoData.metaDescription}"/>
  <meta name="keywords" content="${seoData.metaKeyword}"/>

  <title>
    <c:choose>
      <c:when test="${fn:length(seoData.title) > 0}">
        ${seoData.title}
      </c:when>
      <c:when test="${fn:length(pageTitle)>0}">
        ${pageTitle}
      </c:when>
      <c:otherwise>
        | HealthKart.com
      </c:otherwise>
    </c:choose>
  </title>
  <s:layout-component name="htmlHead"/>
  <c:set var="cssVersion" value="0.25"/>
  <c:set var="jsVersion" value="0.25"/>

  <%--<link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/bootstrap.min.css"
        media="screen">
    <link rel="stylesheet" type="text/css"
        href="<hk:vhostCss/>/assets/css/jquery-ui.min.css"
        media="screen">
    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/default.css?v=1.8"
        media="screen">--%>
    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/HK.css?v=${cssVersion}"
          media="screen">

    <!-- Start Visual Website Optimizer Asynchronous Code -->
    <script type='text/javascript'>
        var _vwo_code=(function(){
            var account_id=61646,
                    settings_tolerance=2000,
                    library_tolerance=2500,
                    use_existing_jquery=false,
// DO NOT EDIT BELOW THIS LINE
                    f=false,d=document;return{use_existing_jquery:function(){return use_existing_jquery;},library_tolerance:function(){return library_tolerance;},finish:function(){if(!f){f=true;var a=d.getElementById('_vis_opt_path_hides');if(a)a.parentNode.removeChild(a);}},finished:function(){return f;},load:function(a){var b=d.createElement('script');b.src=a;b.type='text/javascript';b.innerText;b.onerror=function(){_vwo_code.finish();};d.getElementsByTagName('head')[0].appendChild(b);},init:function(){settings_timer=setTimeout('_vwo_code.finish()',settings_tolerance);this.load('//dev.visualwebsiteoptimizer.com/j.php?a='+account_id+'&u='+encodeURIComponent(d.URL)+'&r='+Math.random());var a=d.createElement('style'),b='body{opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important;}',h=d.getElementsByTagName('head')[0];a.setAttribute('id','_vis_opt_path_hides');a.setAttribute('type','text/css');if(a.styleSheet)a.styleSheet.cssText=b;else a.appendChild(d.createTextNode(b));h.appendChild(a);return settings_timer;}};}());_vwo_settings_timer=_vwo_code.init();
    </script>
<script type="text/javascript">
    var _vis_opt_queue = window._vis_opt_queue || [], _vis_counter = 0, dataLayer = dataLayer || [];
    _vis_opt_queue.push(function () {
        try {
            if (!_vis_counter) {
                var _vis_data = {}, _vis_combination, _vis_id, _vis_l = 0;
                for (; _vis_l < _vwo_exp_ids.length; _vis_l++) {
                    _vis_id = _vwo_exp_ids[_vis_l];
                    if (_vwo_exp[_vis_id].ready) {
                        _vis_combination = _vis_opt_readCookie('_vis_opt_exp_' + _vis_id + '_combi');
                        if (typeof (_vwo_exp[_vis_id].combination_chosen) != "undefined")
                            _vis_combination = _vwo_exp[_vis_id].combination_chosen;
                        if (typeof (_vwo_exp[_vis_id].comb_n[_vis_combination]) != "undefined") {
                            _vis_data["VWO_test_id"] = _vis_id;
                            _vis_data["Variation_name"] = _vwo_exp[_vis_id].comb_n[_vis_combination];
                            _vis_data["Variation_id"] = _vis_combination;
                            _vis_counter++;
                        }
                    }
                }
                // Use the _vis_data object created above to fetch the data,
                if (_vis_counter) {
                    dataLayer.push(_vis_data);
                    dataLayer.push({'event':'VWOCallBack'});
                }
            }
        } catch (err) {};
    });
</script>
    <!-- End Visual Website Optimizer Asynchronous Code -->
</head>
<body itemscope itemtype="http://schema.org/WebPage" data-spy="scroll" data-target="#NavBox" <%--data-offset="10"--%>>
<s:layout-render name="/layouts/embed/tagManager.jsp"
                 pageType="${pageType}"
                 primaryCategory="${primaryCategory}"
                 secondaryCategory="${secondaryCategory}"
                 tertiaryCategory="${tertiaryCategory}"
                 brand="${brand}"
                 variantId="${variantId}"
                 productId="${productId}"
                 variantOfferPrice="${variantOfferPrice}"
                 variantMrp="${variantMrp}"
                 variantDiscount="${variantDiscount}"
                 variantName="${variantName}"
                 variantImageM="${variantImageM}"
                 variantImageS="${variantImageS}"
                 oldVariantId="${oldVariantId}"
                 primaryMenu="${primaryMenu}"
                 secondaryMenu="${secondaryMenu}"
                 tertiaryMenu="${tertiaryMenu}"
                 navKey="${navKey}"
                 oos="${oos}"
                 breadCrumbs="${breadCrumbs}"
                 categoryBrowseNodeList="${categoryBrowseNodeList}"
                 canonicalUrl="${canonicalUrl}"
                 svTags="${svTags}"
                 cTags="${cTags}"
                 bTags="${bTags}"
                 cTagList="${cTagList}"
                 bTagList="${bTagList}"
    />
<noscript>
  <div class="js-disble-cntnr">For a better experience on Healthkart, Please enable JavaScript in your browser.</div>
</noscript>

<div class="wrapper">
  <s:layout-component name="modal"/>

  <s:layout-component name="header">

    <div id="header">
      <c:if test="${showOldHKLink eq true}">
        <div class="link-cntnr">
          <a href="http://www.healthkart.com" title="go to old website">
            <img src="<hk:vhostImage/>/assets/images/new-site-strip.png" width="960" height="25"
                 alt="go to old website"/>
          </a>
        </div>
      </c:if>
      <c:if test="${type == null || type == ''}">
        <c:choose>
          <c:when test="${version== '1'}">
            <s:layout-render name="/templates/header-v1.jsp" pageType= "${pageType}" showMenu="${showMenu}"/>

          </c:when>
          <c:otherwise>
            <s:layout-render name="/templates/header.jsp" pageType= "${pageType}" showMenu="${showMenu}"/>

          </c:otherwise>
        </c:choose>
      </c:if>
      <c:if test="${type == 'login'}">
        <s:layout-render name="/templates/loginHeader.jsp"/>
      </c:if>
      <c:if test="${type == 'paymentFlow'}">
        <s:layout-render name="/templates/headerPaymentFlow.jsp"/>
      </c:if>
    </div>
  </s:layout-component>
  <!--h1><s:layout-component name="heading"/></h1-->
  <s:layout-component name="content">
  </s:layout-component>

  <s:layout-component name="footer">
    <c:if test="${showFooter== null || showFooter == '' || showFooter == 'yes'}">
      <div id="footer">
        <s:layout-render name="/templates/footer.jsp"/>
      </div>
    </c:if>
  </s:layout-component>
</div>

  <%--js start--%>

<%--<script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<hk:vhostJs/>/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<hk:vhostJs/>/assets/js/handlebars.min.js"></script>
<script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js?v=1.3"></script>
<script type="text/javascript" src="<hk:vhostJs/>/assets/js/lazyload.min.js"></script>
&lt;%&ndash;<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.jscrollpane.js"></script>&ndash;%&gt;
<script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/common.js?v=1.46"></script>--%>
<script type="text/javascript" src="<hk:vhostJs/>/assets/js/HK.js?v=${jsVersion}"></script>
  <%--js finish--%>


<script type="text/javascript">

var CONTEXT_ROOT = "${pageContext.request.contextPath}";
var IMAGE_PATH = "<hk:vhostImage/>/assets";
$(document).ready(function () {

  /*autocomp search begins*/

  $('.hk-search-bar .icn-search').click(function () {
    $('#globalSearch').css('background-color', 'gray').trigger('submit')
  });
  $('#globalSearch').submit(function () {
    //$('.hk-search-box').val($.trim($('.hk-search-box').val()));
    var searchQuery =  $('.hk-search-box').val($.trim(encodeURIComponent($('.hk-search-box').val())).replace(/%20/g, " ").replace(/%26/g, "&").replace(/%2C/g,",").replace(/%2B/g, "+").replace(/%3A/g, ":").replace(/%25/g, "%"));
    console.log(searchQuery .length);
    //if (searchQuery .length === 0) {
      if ($.trim($('.hk-search-box').val()).length === 0) {

        $('.hk-search-box').focus();
      //HK.alert({title: HK.titles.wowHold, content: HK.msgs.enterMessage, theme: HK.POPUP.THEME.ALERT});
      return false;
    }

  });
  /*search js dropdown*/
  $('#searchButton').hover(function () {
        $("#searchbox").css("display", "block");
        $("#searchButton").addClass("search-menu-hover");
        $(".icn-dwn-cs").addClass("icn-dwn-cs-hover");
      },
      function () {
        $("#searchbox").css("display", "none");
        $("#searchButton").removeClass("search-menu-hover");
        $(".icn-dwn-cs").removeClass("icn-dwn-cs-hover");
      }
  );
  $('#searchbox').hover(function () {
        $("#searchbox").css("display", "block");
        $("#searchButton").addClass("search-menu-hover");
        $(".icn-dwn-cs").addClass("icn-dwn-cs-hover");
      },
      function () {
        $("#searchbox").css("display", "none");
        $("#searchButton").removeClass("search-menu-hover");
        $(".icn-dwn-cs").removeClass("icn-dwn-cs-hover");
      }
  );

  var acVariantHTML = $('#ac-variants-template').html();
  var acVariantTemplate = Handlebars.compile(acVariantHTML);

  var minLength = 2;
  var autoElem = $('.hk-search-box');
  var autoElemRslt = $('#hk-search-box-result');
  var autoCompleteItems = 10;


  autoElem.autocomplete(
      {
        appendTo: '#hk-search-box-result',
        minLength: 2,
        delay: 50,
        source: function (request, response) {

          var queryStr = '';

          $.ajax({
            url: HK.urls.autoCompleter + '?q=' + encodeURIComponent(request.term) + '&noRs=' + autoCompleteItems,
            dataType: "json",

            success: function (data) {
              var results = data.results;
              var acItems = results.acItems;
              var acVariants = results.acVariants;

              function styleProductName(str) {
                return "<span class='fnt-bold'>" + str + "</span>";
              }

              ;
              function styleBrandName(str) {
                return "<span class='txt-blue'>" + str + "</span>";
              }

              ;

              $('.ui-autocomplete-loading').removeClass("ui-autocomplete-loading");

              if (acItems.length == 0 && acVariants.length == 0) {
                autoElem.autocomplete('close');
              } else {
                var resultArr = $.map(acItems, function (item) {
                  var strArr = (item.nm).split(' in ');
                  var brndNm = (strArr.length > 1) ? styleBrandName(strArr.pop()) : '';

                  var prdNm = strArr.join(' ');
                  var prdNmIdx = prdNm.search(eval("/" + request.term + "/i"));
                  var prdNmRplcStr = prdNm.substr(prdNmIdx, request.term.length);

                  prdNm = prdNm.replace(prdNmRplcStr, styleProductName(prdNmRplcStr));

                  if (brndNm.length > 0) {
                    prdNm += ' in ' + brndNm;
                  }
                  ;
                  var tarPg = item.url + '&ac_sel=' + encodeURIComponent(item.nm);
                  return{
                    label: prdNm,
                    value: item.nm,
                    vId: item.type,
                    targetPage: tarPg,
                    acType: HK.Constants.AC_ITEMS
                  };
                });

                $.merge(resultArr, $.map(acVariants, function (item) {
                  var tarPg = item.url + '&ac_sel=' + encodeURIComponent(item.nm);
                  return{
                    label: item.nm,
                    value: item.nm,
                    vId: item.type,
                    op: item.offer_pr,
                    img: item.s_link,
                    targetPage: tarPg,
                    acType: HK.Constants.AC_VARIANTS

                  };
                }));

                response(resultArr);


              }
            },
            error: function (result) {
              $('.ui-autocomplete-loading').removeClass(
                  "ui-autocomplete-loading");
            }
          });
        },
        select: function (event, ui) {
          /*console.log(ui);*/

          location.href = ui.item.targetPage;
          return false;
        },
        open: function () {
          $('.ui-autocomplete').addClass('z7').width(autoElemRslt.width() - 5).css({'left': '0px', 'right': '0px'});
          autoElemRslt.addClass('z7');
          $(this).removeClass("ui-corner-all");//.addClass( "ui-corner-top" );

        },
        close: function () {
          $('.ui-autocomplete').removeClass('z7');
          autoElemRslt.removeClass('z7');
          $(this).removeClass("ui-corner-top").addClass(
              "ui-corner-all");
        },
        focus: function (event, ui) {
          return ui.item.origLabel;//
        }
      }).data("ui-autocomplete")._renderItem = function (ul, item) {
    var itemLabel = item.label;
    var itemValue = item.value;
    if (item.acType == HK.Constants.AC_ITEMS) {
      return $("<li class='acItemRow'></li>").data("item.autocomplete", item)
          .append("<a href='" + item.targetPage + "'>" + itemLabel + "</a>").appendTo(ul);
    } else {
      return $("<li  class='acVariantRow'></li>").data("item.autocomplete", item).append(
          acVariantTemplate(item)).appendTo(ul);
    }
  };
  /*autocomp search ends*/

  /*menu begins*/

  $('#dropDownbox1 .gm-mc-nm').click(function (event) {
    var curRef = $(this),
        curPrnt = $(this).parents('.gm-mc:first'),
        trgt = curPrnt.find('.gm-sc-cntnr');
    if (trgt.is(':visible')) {

    } else {
      event.preventDefault();
      curPrnt.trigger('mouseenter');
    }
  });
  /*Dropdown js */
  $('#dropDownButton').on("mouseenter click", function (event) {
    //deactivateSubmenu($("#dropDownbox1").find('.maintainHover').parents('.gm-mc'));
    if (event.type == 'click' && $("#dropDownbox1").is(':visible')) {
      $('#dropDownButton').trigger("mouseleave");
      return;
    }
    $("#dropDownbox1").css("display", "block");
    //$("#dropDownButton").addClass("menu-hdr-hover");
    $(".icn-dwn-cs2").addClass("icn-dwn-cs-hover");
  });

  $('#dropDownButton').mouseleave(function () {
    $("#dropDownbox1").css("display", "none");
    $(".icn-dwn-cs2").removeClass("icn-dwn-cs-hover");
  });

  $('#dropDownbox1').hover(function () {
        $("#dropDownbox1").css("display", "block");
        //$("#dropDownButton").addClass("menu-hdr-hover");
        $(".icn-dwn-cs2").addClass("icn-dwn-cs-hover");
      },
      function () {
        $("#dropDownbox1").css("display", "none");
        $(".gm-sc-cntnr").css("display", "none");
        $(".maintainHover").removeClass("maintainHover");

        $(".icn-dwn-cs2").removeClass("icn-dwn-cs-hover");
      }
  );

  $('.gm-mc').mouseover(function (e) {
    var ele = e.currentTarget;
    setTimeout(function () {

      if ($('.gm-sc-cntnr:visible').length == 0 && $(ele).find('a').attr('href') == $('.gm-mc:hover').find('a').attr('href')) {
        $(ele).find('.gm-sc-cntnr').show();
        /*console.log('in');*/
      }
    }, 200);

  });


  var $menu = $(".gm");
  $menu.mouseleave(function () {
    $('.gm-sc-cntnr:visible').hide();
  });
  // jQuery-menu-aim: <meaningful part of the example>
  // Hook up events to be fired on menu row activation.
  $menu.menuAim({
    activate: activateSubmenu,
    deactivate: deactivateSubmenu
  });
  // jQuery-menu-aim: </meaningful part of the example>

  // jQuery-menu-aim: the following JS is used to show and hide the submenu
  // contents. Again, this can be done in any number of ways. jQuery-menu-aim
  // doesn't care how you do this, it just fires the activate and deactivate
  // events at the right times so you know when to show and hide your submenus.
  function activateSubmenu(row) {


    var $row = $(row),

        $submenu = $row.find('.gm-sc-cntnr')
    height = $menu.outerHeight(),
        width = $menu.outerWidth();
    var maxHeight = 0;
    $submenu.find('.span3:last').css('border-right', 'none');
    $row.find('.gm-sc-cntnr').css('font-weight', 'bold');
    // Show the submenu
    $submenu.css({
      display: "block",
      top: -5,
      left: width - 3

    });

    // Keep the currently activated row's highlighted look
    $row.find("a").addClass("maintainHover");

    //Fix vertical line height

    $submenu.find('.span3').each(function () {
      getMaxHeight($(this))
    });
    //  maxHeight = 'auto';
    if (maxHeight > 100) {
      $submenu.find('.span3').height(maxHeight);
    }

    function getMaxHeight(ref) {
      maxHeight = (maxHeight < ref.height()) ? ref.height() : maxHeight;
    }


  }

  function deactivateSubmenu(row) {
    var $row = $(row),
        submenuId = $row.data("submenuId"),
        $submenu = $row.find('.gm-sc-cntnr');

    // Hide the submenu and remove the row's highlighted look
    $submenu.css("display", "none");
    $row.find("a").removeClass("maintainHover");
  }

  // Bootstrap's dropdown menus immediately close on document click.
  // Don't let this event close the menu if a submenu is being clicked.
  // This event propagation control doesn't belong in the menu-aim plugin
  // itself because the plugin is agnostic to bootstrap.
  $(".gm li").click(function (e) {
    e.stopPropagation();
  });
  /*menu ends*/

  $('img.lazy').show().lazyload({threshold: 1000, failure_limit: 10, skip_invisible: false});
  function goToTop() {
    $(window).scroll(function (e) {
      if ($(window).scrollTop() > 100) {
        $('.go-to-top-cntnr').css({
          position: 'fixed',
          top: '90%',
          right: '10px'
        }).fadeIn(300);
      } else {
        $('.go-to-top-cntnr').fadeOut(500);
      }
    });
  }

  goToTop();

  $('[name=submitSubscription]').click(function (event) {
    var doSubmit = true;
    if (HK.validator.isNull('[name=subscriptionEmail]')) {
      HK.validator.hideErrMsg('[name=subscriptionEmail]');
      HK.validator.showErrMsg('[name=subscriptionEmail]', HK.errs.enterEmail);
      doSubmit = false;
    }
    else if (!HK.validator.isEmail('[name=subscriptionEmail]')) {
      HK.validator.hideErrMsg('[name=subscriptionEmail]');
      HK.validator.showErrMsg('[name=subscriptionEmail]', HK.errs.invalidEmail);
      doSubmit = false;
    }
    else {
      HK.validator.hideErrMsg('[name=subscriptionEmail]');
    }

    if (!doSubmit) {
      return false;
    }

    var currEle = $('#submitSubscription');
    var email = $('#subscriptionEmail').val();
    HK.element.loader.add(currEle, true);
    var url = HK.urls.subscribeForMails + email;
    var map = null;
    var onSuccess = function (responseData) {
      if (responseData.results.success) {
        HK.element.loader.remove(currEle, true);
        var suucessMsg = responseData.messages;
        HK.alert({title: 'Thank You !', content: HK.utils.generateHTMLForException(suucessMsg), theme: HK.POPUP.THEME.ALERT});

      }
      else {
        HK.element.loader.remove(currEle, true);
        var errorMsg = responseData.messages;
        var cntnt = HK.utils.generateHTMLForException(errorMsg);
        cntnt.find('li:last').append('<span>. Please <a class="send-lnk" href="/core/user/Signup.action">Click here</a> to create an account with us.</span>');
        HK.alert({title: 'Alert!', content: cntnt, theme: HK.POPUP.THEME.ALERT});

      }
    };
    var onError = function (xhr, a_status) {
      HK.element.loader.remove(currEle, true);
    };
    HK.Ajax.postJson(url, map, onSuccess, onError);
  });
});
</script>
<s:layout-component name="scriptComponent"/>
</body>
</html>
</s:layout-definition>