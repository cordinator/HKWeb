if ( typeof HK === 'undefined') {
  HK = {};
}


HK.VariantComparison = function() {
  return {

    renderComparisonView : function(svToComp) {
      var template = $('#variantCompareViewTemplate').html(),
          json = {},
          i = 0;
      json.variants = svToComp;

      var html = HK.UIHelper().renderToHtml(template, json);
      $("#variantCompareView").html($.trim(html));


      var emptyTemplate = $('#variantCompareEmptyViewTemplate').html();
      var emptyJson = {};

      if (svToComp.length < 4) {
        var emptyVariantHtml = HK.UIHelper().renderToHtml(emptyTemplate, emptyJson);
        for (i = svToComp.length; i < 4; i++) {

          $("#variantCompareView").append(emptyVariantHtml);
        }
      }

      /*var compareBtnTmpl = $('#variantCompareBtnViewTemplate').html();
       var comapreBtnHtml = HK.UIHelper().renderToHtml(compareBtnTmpl, emptyJson);
       */
      /*$("#variantCompareView").append(comapreBtnHtml);*/

      $(".cmpr-item .clear-cnt").click(function(event) {
        var removeBtn = $(event.currentTarget);
        var varId = removeBtn.attr('varId');
        var catPre = removeBtn.attr('catPre');
        HK.VariantComparison().removeVariantFromComparison(varId, catPre);
      });

        $(".cmpr-btn-cntnr .clear-cnt").click(function(event) {
            HK.VariantComparison().removeAllVariantFromComparison();
        });

      $("#variantCompareGrid .icn-close2").click(function() {
        $("#variantCompareGrid").hide(10, function() {
          $("#variantCompareGrid").trigger('isHidden');
        });
      });


      if (svToComp.length > 0) {
        $("#variantCompareGrid").show(10, function() {

          $("#variantCompareGrid").trigger('isVisible');
        });
      }
    },

    init : function() {
      HK.VariantComparison().getAllVariantsForComparison();

      $('body').on("click",".addToCompare",function(event) {
        var curEle = $(this);

        var addtoCompareChkBox = $(event.currentTarget);
        var varId = addtoCompareChkBox.attr('varId');
        var catPre = addtoCompareChkBox.attr('catPre');

        HK.VariantComparison().addVariantToComparison(varId, catPre, curEle);

      });
    },

    getAllVariantsForComparison : function() {
      /*console.log("getting cmp");*/
      HK.Ajax.getJson(HK.urls.getAllVariantsToCompare, function(resp) {
          if (resp.results.svToComp.length > 0) {
              HK.VariantComparison().renderComparisonView(resp.results.svToComp);
          }
      });
    },

    addVariantToComparison : function(variantId, categoryPrefix, currentElement) {
      var params = {
        "storeVariantId" : variantId,
        "storeCategoryPrefix" : categoryPrefix
      } ;
      if (currentElement.is(':checked') || currentElement.attr('href')) {
        HK.Ajax.postJson(HK.urls.addVariantToCompare, params, function(resp) {
          currentElement.removeAttr('checked');

          if (resp.results.svToComp) {
            HK.VariantComparison().renderComparisonView(resp.results.svToComp);
          }

          if (resp.exception) {
            HK.alert(resp.messages[0]);
            logE.push(logE.create({"error":resp.messages[0],"target":HK.urls.addVariantToCompare,"params":params}));
          } else {
            //scroll to compare widget only if more than one product in comparison list
            if(resp.results.svToComp.length > 1){
              HK.utils.Scroll.toElement($("#variantCompareGrid"));
            }
          }
        });
      }
    },

    removeVariantFromComparison : function(variantId, categoryPrefix) {
      var params = {
        "storeVariantId" : variantId,
        "storeCategoryPrefix" : categoryPrefix
      } ;


      HK.Ajax.postJson(HK.urls.removeVariantToCompare, params, function(resp) {
        if (resp.results.svToComp) {
          HK.VariantComparison().renderComparisonView(resp.results.svToComp);
        } else {
          alert(resp.messages[0]);
        }
        if (resp.results.size == 0) {
          $("#variantCompareGrid").hide();
        }
      });
    },

    removeAllVariantFromComparison : function() {

      HK.Ajax.postJson(HK.urls.removeAllVariantsToCompare, {}, function(resp) {
        /*console.log(resp);
        if (resp.results.svToComp) {
          HK.VariantComparison().renderComparisonView(resp.results.svToComp);
        } else {
          alert(resp.messages[0]);
        }*/
        if (resp.results.size == 0) {
          $("#variantCompareGrid").hide();
        }
      });
    }

  };
};

function fixCompareWidget(callback) {
  var initialHeight = $(".mainContainer").offset().top;
  var fixLeftNav = function(){};
  if( typeof callback === 'function' ){
    fixLeftNav = callback;
  }
  //$("#variantCompareGrid").css("top", initialHeight);
  $(window).scroll(function (e) {
    if ($(window).scrollTop() > initialHeight) {
      /*$('#variantCompareGrid').css({
        position: 'fixed',
        top: '0',
        margin: '0 auto'
      });*/
        fixLeftNav();


    } else {
      /*$('#variantCompareGrid').css({
        position: 'static',
        top: initialHeight,
        margin: '40px auto'
      });*/
      fixLeftNav();

    }
  });
}

HK.VariantComparison().init();

