<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp">
  <s:useActionBean beanclass="com.hk.web.action.beta.review.StoreVariantReviewAction" var="storeVariantAction"/>
  <s:layout-component name="content">
    <div class="mainContainer">
      <div class="container clearfix">

        <%--breadcrumbs begins--%>
        <div class="hk-breadcrumb-cntnr mrgn-bt-10">
          <span>

            <a href="/" title="Home">Home</a>
          </span>
          <span>&raquo;</span>
          <span>
            <a href="${storeVariantAction.storeVariantBasic.url}">${storeVariantAction.storeVariantBasic.name}</a>
          </span>
          <span>&raquo;</span>
          <span class="fnt-bold">Write a Review</span>
        </div>
        <%--breadcrumbs ends--%>


        <div class="ttl-cntnr mrgn-b-10">
          <span class="icn icn-sqre"></span>

          <h1> ${storeVariantAction.storeVariantBasic.name}</h1>
          <span class="icn icn-sqre"></span>
        </div>
        <div class="row">
        <div class="span11 brdr-r pad-r-40">
          <h2 class="fnt-caps">help others! write a review</h2>

          <div class="mrgn-t-10 rev-cntnr" id="write-review-form">
            <div class="row">
              <div class="span2">Your Rating</div>
              <div class="user-input span9">
                <ul class="hk-give-star">
                  <li class="user-rating" style="width:0%"></li>
                  <li><a title="Rate 1 star" class="star-1">1</a></li>
                  <li><a title="Rate 2 stars" class="stars-2">2</a></li>
                  <li><a title="Rate 3 stars" class="stars-3">3</a></li>
                  <li><a title="Rate 4 stars" class="stars-4">4</a></li>
                  <li><a title="Rate 5 stars" class="stars-5">5</a></li>
                </ul>
                <input type="hidden" id="starRating" value=""/>
              </div>
            </div>
            <div class="row">
              <div class="span2" for="title">Review Title</div>
              <div class="user-input span9">
                <input type="text" size="40" id="title" class="review-ttle" value="">
              </div>
            </div>
            <div class="row">
              <div class="span2" for="review">Your Review</div>
              <div class="user-input span9">
                <div class="review-txt-contnr">
                  <textarea rows="" cols="" id="review"></textarea>
                </div>
              </div>
            </div>
            <div class="row">
                <div class="span9 offset2">
                  <input type="button" class="btn btn-blue" value="SUBMIT" id="save"/>
                </div>
            </div>
          </div>
        </div>
        <div class="span4">

          <s:layout-render name="/layouts/variantBasicLayout.jsp"
                           storeVariantBasic="${storeVariantAction.storeVariantBasic}"/>

        </div>
        </div>
      </div>
    </div>

      <c:if test= "${storeVariantAction.storeVariantBasic.showNotifyMe eq true}">
        <s:layout-render name="/layouts/dialogLayout.jsp" dialogId ="notifyDialog" layoutType="notifyDialog" dialogTitle = "Notify Me" dialogBtn="notify-submit" user= "notifyUserName" email="notifyEmail" phone ="notifyPhone"  />
      </c:if>
      <%--do not delete overlayDiv this is for dialog box--%>
      <div id="overlayDIV" class="hide"></div>
  </s:layout-component>

  <s:layout-component name="scriptComponent">
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        var doSubmit = true;

        function hideErrMsg() {
          HK.validator.hideErrMsg(title, HK.errs.enterTitle);
          HK.validator.hideErrMsg(review, HK.errs.enterReview)
          $('.hk-give-star').next('.err-txt').remove();
        }

        $('#save').click(function () {
          var title = $('#title');
          var review = $('#review');
          var starRating = $('#starRating');
          if (HK.validator.isNull(title) || HK.validator.isNull(review) || HK.validator.isNull(starRating)) {
            hideErrMsg();
            if (HK.validator.isNull(title))
              HK.validator.showErrMsg(title, HK.errs.enterTitle);
            if (HK.validator.isNull(review))
              HK.validator.showErrMsg(review, HK.errs.enterReview);
            if (HK.validator.isNull(starRating))
              $('.hk-give-star').after('<p class="err-txt mrgn-t-10">' + HK.errs.enterRating + '</p>');
            return false;
          }
          else {
            hideErrMsg();
          }

          HK.element.disable($('#save'));
          var params = {
            "storeVariantId": ${storeVariantAction.storeVariantBasic.id},
            "title": title.val(),
            "review": review.val(),
            "starRating": starRating.val() };
          HK.Ajax.postJson(
              HK.urls.addReview, params,
              function (responseData) {
                if (responseData.exception) {
                  HK.alert({title: "NOT ALLOWED", content: responseData.messages[0], theme: HK.POPUP.THEME.ALERT});
                  HK.element.enable($('#save'));
                } else {
                  var ref = HK.alert({title: "SUCCESS", content: responseData.messages[0]});
                  ref.root.on("remove", function () {
                        window.location.href = "${storeVariantAction.storeVariantBasic.url}"
                      }
                  );
                }
              });
        });

        $('li').click(function () {
          var rating = $(this).children('a').html();
          var width = (rating / 5) * 100;
          $(this).siblings('.user-rating').css('width', width + '%');
          $('#starRating').val(rating);
        });
      });
    </script>
      <c:if test= "${storeVariantAction.storeVariantBasic.showNotifyMe eq true}">
          <script type="text/javascript" src="<hk:vhostJs/>/assets/js/notify/notify.js?v=1.1"></script>
      </c:if>
  </s:layout-component>
</s:layout-render>