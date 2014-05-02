if (typeof(HK) == 'undefined') {
  HK = {};
}

/*review actions start here*/

$('a.review').click(function () {
  var reviewId = $(this).attr("reviewId");
  var reviewTypeId = $(this).attr("reviewTypeId");
  HK.Ajax.getJson(
      HK.urls.review + reviewId + HK.urls.reviewVote + reviewTypeId,
      function (responseData) {
        if(responseData.exception){
          HK.alert({title:"NOT ALLOWED",content:responseData.messages[0],theme:HK.POPUP.THEME.ALERT});
        }else{
          HK.confirm({title:"SUCCESS",content:responseData.messages[0]});
        }
      },
      ""
  );
});


$('.hk-give-star li').click(function () {
      var rating = $(this).children('a').html();
      var width = (rating / 5) * 100;
      $(this).siblings('.user-rating').css('width', width + '%');
      var storeVariantId = $('#storeVariantId').val();
      var params = {
        "storeVariantId": storeVariantId,
        "starRating": rating };
      HK.Ajax.postJson(
          HK.urls.reviewRate,params,
          function (responseData) {
            if(responseData.exception){
              HK.confirm({title:"NOT ALLOWED",content:responseData.messages[0],theme:HK.POPUP.THEME.ALERT});
            }else{
              HK.confirm({title:"SUCCESS",content:responseData.messages[0]});
//              location.reload();
            }
          }
      );
    }
);