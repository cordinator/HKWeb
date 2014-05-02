<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>

  <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/store/topNutrition/stylesheets/topNut.css"
        media="screen">


  <%
    PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
    if (principal != null) {
      pageContext.setAttribute("userId", principal.getId());
    } else {
      pageContext.setAttribute("userId", null);
    }

    String roles = RoleConstants.HK_USER + "," + RoleConstants.HK_UNVERIFIED;

    String requestUrI = (String) request.getAttribute("javax.servlet.forward.request_uri");
    if (requestUrI == null) {
      requestUrI = request.getRequestURI();
    }
    String queryString = request.getQueryString();
    StringBuilder stringBuilder = new StringBuilder(requestUrI);
    if (queryString != null) {
      stringBuilder.append("?").append(queryString);
    }
    String originalUrlHeader = stringBuilder.toString();

  %>



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
      <s:layout-render name="/templates/header.jsp" showMenu="${showMenu}"/>
    </c:if>
    <c:if test="${type == 'login'}">
      <s:layout-render name="/templates/loginHeader.jsp"/>
    </c:if>
    <c:if test="${type == 'paymentFlow'}">
      <s:layout-render name="/templates/headerPaymentFlow.jsp"/>
    </c:if>
  </div>


  <%--js start--%>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-1.9.1.min.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-ui.min.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/handlebars.min.js"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js?v=1.3"></script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/lazyload.min.js"></script>
  <%--<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.jscrollpane.js"></script>--%>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/common.js?v=1.46"></script>
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
       $('.hk-search-box').val($.trim(encodeURIComponent($('.hk-search-box').val())).replace(/%20/g, " ").replace(/%26/g, "&").replace(/%2C/g,",").replace(/%2B/g, "+").replace(/%3A/g, ":").replace(/%25/g, "%"));
      //if ($('.hk-search-box').val().length === 0) {
       if ($.trim($('.hk-search-box').val()).length === 0) {
        $('.hk-search-box').focus();
        HK.alert({title: HK.titles.wowHold, content: HK.msgs.enterMessage, theme: HK.POPUP.THEME.ALERT});
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
            top: '85%',
            right: '1%'
          }).fadeIn(500);
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
</s:layout-definition>