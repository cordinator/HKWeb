<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>


    <div id="footer">



        <div class="container clearfix">
            <div class="ftr-main-txt">
                <span class="fnt-bold"> authentic products</span>
                <span class="mrgn-lr-10">|</span>
                <span class="fnt-bold"> free delivery on orders over rs. 499</span>
                <span class="mrgn-lr-10">|</span>
                <span class="fnt-bold">secure payment system</span>
            </div>

            <div class="ftr-link-cntnr clearfix">
                <div class="span3 alpha">
                    <h4>Healthkart</h4>
                    <ul>
                        <li><a href="/beta/hk/AboutUs.action">About Us</a></li>
                        <li><a href="/beta/hk/Careers.action">Careers</a></li>
                        <li><a href="/beta/hk/TermsConditions.action">Terms &amp; Conditions</a></li>
                        <li><a href="http://www.healthkart.com/resources">Blog</a></li>
                        <li><a href="/beta/brand/BrandListing.action">Brand Directory</a> </li>
                        <li><a rel="nofollow" href="/core/loyaltypg/LoyaltyIntroduction.action">Loyalty</a></li>
                        <li><a href="?view=mobile">View Mobile Site</a></li>
                    </ul>
                </div>
                <div class="span3 alpha">
                    <h4>Can We Help You</h4>
                    <ul>
                        <li><a href="/core/user/MyAccount.action">Your Account</a></li>
                        <li><a href="/beta/hk/FAQ.action?reftag=delivery">Delivery Policies</a></li>
                        <li><a href="/beta/hk/FAQ.action?reftag=return">Returns Policy</a></li>
                        <li><a href="/beta/hk/FAQ.action">FAQs and Help</a></li>
                        <li><a href="/beta/hk/ContactUs.action">Contact Us</a></li>
                    </ul>
                </div>

                <div class="span3 alpha">
                    <h4>Categories</h4>
                    <ul>

                        <li><a href="http://www.healthkart.com/sports-nutrition?navKey=CP-nt-sn&amp;itracker=w:emenu|;p:1|;c:sports-nutrition|;">Sports Nutrition</a></li>

                        <li><a href="http://www.healthkart.com/fitness?navKey=CP-sv-fitness&amp;itracker=w:emenu|;p:1|;c:fitness|;">Fitness</a></li>

                        <li><a href="http://www.healthkart.com/sports?navKey=CP-sv-sport&amp;itracker=w:emenu|;p:1|;c:sports|;">Sports</a></li>

                        <li><a href="http://www.healthkart.com/vitamins-n-supplements?navKey=CP-c1fn&amp;itracker=w:emenu|;p:1|;c:vitamins-n-supplements|;">Vitamins &amp; Supplements</a></li>

                        <li><a href="http://www.healthkart.com/health-food-n-drinks?navKey=CP-ds&amp;itracker=w:emenu|;p:1|;c:health-food-n-drinks|;">Health Food &amp; Drinks</a></li>

                        <li><a href="http://www.healthkart.com/health-devices?navKey=CP-hd&amp;itracker=w:emenu|;p:1|;c:health-devices|;">Health Devices</a></li>

                        <li><a href="http://www.healthkart.com/diabetes?navKey=CP-dia&amp;itracker=w:emenu|;p:1|;c:diabetes|;">Diabetes</a></li>

                    </ul>
                </div>
                <div class="span3 alpha">
                    <h4>More categories</h4>
                    <ul>

                        <li><a href="http://www.healthkart.com/elderly-n-patient-care?navKey=CP-sv-patient&amp;itracker=w:emenu|;p:1|;c:elderly-n-patient-care|;">Elderly &amp; Patient Care</a></li>

                        <li><a href="http://www.healthkart.com/personal-n-baby-care?navKey=CP-sv-perso&amp;itracker=w:emenu|;p:1|;c:personal-n-baby-care|;">Personal &amp; Baby Care</a></li>

                        <li><a href="http://www.healthkart.com/women-care?navKey=CP-sv-women&amp;itracker=w:emenu|;p:1|;c:women-care|;">Women Care</a></li>

                        <li><a href="http://www.healthkart.com/beauty?navKey=CP-bty&amp;itracker=w:emenu|;p:1|;c:beauty|;">Beauty</a></li>

                        <li><a href="http://www.healthkart.com/winter-care?navKey=CP-sv-winter&amp;itracker=w:emenu|;p:1|;c:winter-care|;">Winter Care</a></li>

                    </ul>
                </div>

                <div class="subscibe-mail-cntnr">
                    <p class="label-txt">Sign Up for emails and latest offers</p>

                    <div class="span4">
                        <input type="text" value="" placeholder="Email address" id="subscriptionEmail" name="subscriptionEmail">
                    </div>
                    <div class="mrgn-l-30 clr-cont">
                        <input type="submit" class="btn btn-gray fnt-sz10" value="submit" name="submitSubscription" id="submitSubscription">
                    </div>
                </div>
            </div>
            <div class="clearfix about-hk">
                HealthKart.com is India's largest online health &amp; fitness store for men, women, and kids. Shop online from the
                latest collections of health, fitness, beauty, sports, eye care, parenting and similar products featuring the best
                brands.
            </div>
            <div class="clearfix fnt-sz9">
                <div class="cont-lft mrgn-t-10">
                    <span class="txt-top">Pay using: </span>
                    <span class="icn icn-pmt-methods"></span>
                    <span class="txt-top">| Net Banking | Cash on Delivery</span>
                </div>
                <div class="cont-rht">
                    <span class="txt-middle fnt-caps">CopyRight &copy; 2013-2014, HealthKart.com, or its affiliates </span>
                    <span class="txt-middle mrgn-r-5"> | Connect with us:</span>

                    <div class="disp-inln txt-middle mrgn-t-10">
                        <a rel="nofollow" href="https://www.facebook.com/healthkart" target="_blank" class="icn icn-fb"></a>
                        <a rel="nofollow" href="https://twitter.com/healthkart" target="_blank" class="icn icn-twitter"></a>
                        <a rel="nofollow" href="https://plus.google.com/+healthkart/posts" target="_blank" class="icn icn-google-plus"></a>
                    </div>
                </div>
            </div>

        </div>
        <div class="go-to-top-cntnr" style="position: fixed; top: 85%; right: 1%; display: block;">
            <a class="go-to-top cont-rht hide" title="Back to Top" href="javascript:void(0)" style="display: inline;"></a>
        </div>

    </div>



    <script type="text/javascript" src="http://static.healthkart.com/assets/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="http://static.healthkart.com/assets/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="http://static.healthkart.com/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="http://static.healthkart.com/assets/js/handlebars.min.js"></script>
    <script type="text/javascript" src="http://static.healthkart.com/assets/js/devJs/handlebarsCommon.js?v=1.3"></script>
    <script type="text/javascript" src="http://static.healthkart.com/assets/js/lazyload.min.js"></script>

    <script type="text/javascript" src="http://static.healthkart.com/assets/js/devJs/common.js?v=1.45"></script>

    <script type="text/javascript">

    var CONTEXT_ROOT = "";
    var IMAGE_PATH = "http://static.healthkart.com/assets";
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

    <script type="text/javascript" src="http://static.healthkart.com/assets/js/cart/cart.js"></script>
    <script type="text/javascript">

        /*Fixing the left nav*/
        function fixLeftNav() {
            var initialHeight = $(".cmpre-varnts-tbl thead tr:last .varnt-title").find('input[type="submit"]').offset().top;
            $("#cmpre-floating-hdr").css("top", initialHeight);
            $(window).scroll(function (e) {
                if ($(window).scrollTop() > initialHeight) {
                    $('#cmpre-floating-hdr').css({
                        position: 'fixed',
                        top: 0,
                        display: 'table'
                    });
                } else {
                    $('#cmpre-floating-hdr').css({
                        display: 'none'
                    });
                }
            });
        }
        if ($(".cmpre-varnts-tbl thead tr:last .varnt-title").find('input[type="submit"]').is(":visible")) {
            fixLeftNav();
        }

        /*Left nav fixing ends here*/
    </script>
    <script type="text/javascript" src="http://static.healthkart.com/assets/js/notify/notify.js"></script>

