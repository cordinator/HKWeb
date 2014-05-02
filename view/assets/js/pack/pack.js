if (typeof(HK) == 'undefined') {
  HK = {};
}

var keyVariantMap = new Object();
var filterSeperator = "";
var filterKeyValueSeperator = "";

HK.Pack = function() {
  return{
    setKeyVariantMap:function(keyVarMap) {
      keyVariantMap = keyVarMap;
    },

    setFilterSeperators:function(filterSep, filterKeyValSep) {
      filterSeperator = filterSep;
      filterKeyValueSeperator = filterKeyValSep;
    },

    buildFilterKey:function(allAttrSels, currAttrSel, currAttrValOptn) {
      var packId = currAttrSel.parents('div.pack-div').attr('data-packId');
      var packSpCtr = currAttrSel.parents('div.pack-sp-div').attr('data-pack-spCtr');
      var currAttrName = currAttrSel.attr("attr-name");
      var currAttrVal = currAttrValOptn.attr("attr-val-name");
      var filterKey = packId + filterSeperator + packSpCtr + filterSeperator;

      allAttrSels.each(function() {
        var attrName = $(this).attr("attr-name");
        if (attrName != currAttrName) {
          var selectedDiffAttrValue = $(this).find('option.diff-attr-val.selected-val').attr("attr-val-name");
          filterKey += attrName + filterKeyValueSeperator + selectedDiffAttrValue + filterSeperator;
        } else {
          filterKey += currAttrName + filterKeyValueSeperator + currAttrVal + filterSeperator;
        }
      });
      return filterKey;
    },

    buildCurrentSelection:function(attrSelToBeChanged) {
      var currSelection = " in ";
      var attrNameToBeChanged = attrSelToBeChanged.attr('attr-name');
      attrSelToBeChanged.parents('div.variant-diff-attr-div').find('select[attr-name!="' + attrNameToBeChanged + '"] option.diff-attr-val.selected-val').each(function() {
        currSelection += $(this).text().trim() + ", ";
      });
      return currSelection;
    },

    getKeyForVariant:function(variantId) {
      return (_.find(_.keys(keyVariantMap), function(key) {
        return keyVariantMap[key] == variantId;
      }));
    },

    markSelectedOptions: function() {
      $('div.pack-var-div:visible').each(function() {
        var currPackVarDiv = $(this);
        var varId = currPackVarDiv.attr('data-vid');
        var variantKey = HK.Pack().getKeyForVariant(varId);
        var attrValuePairs = variantKey.split(filterSeperator);

        _.each(attrValuePairs, function(attrValuePair) {
          currPackVarDiv.parents('div.pack-sp-div').find('option.diff-attr-val[attr-val-comb="' + attrValuePair + '"]').addClass('selected-val');
        });
      });
      HK.Pack().handleAvailability($('div.variant-diff-attr-div'));
    },

    handleAvailability: function(variantDiffAttrDivs) {
      variantDiffAttrDivs.each(function() {
        var variantDiffAttributesDiv = $(this);
        $(this).find('option.diff-attr-val:not(.selected-val)').each(function() {
          //          var variantDiffAttributesDiv = $(this).parents('.variant-diff-attr-div');
          var parentAttrSel = $(this).parent('select');
          var diffAttrSels = variantDiffAttributesDiv.find('select');
          var key = "";
          var currentAttrValOptn = $(this);
          key = HK.Pack().buildFilterKey(diffAttrSels, parentAttrSel, currentAttrValOptn);

          if (keyVariantMap[key] == null) {
            var currSelection = HK.Pack().buildCurrentSelection(parentAttrSel);
            $(this).attr("title", "Not available" + currSelection);
            $(this).addClass('inactive');
          } else {
            $(this).removeAttr("title");
            $(this).removeClass("inactive");
          }
        });
      });
    },


    //to be called on option click
    changeVariantInPack: function(elem) {
      var parentAttrSel = $(elem);
      var selectedOption = parentAttrSel.find('option:selected');
      //      var parentAttrSel = $(elem).parent('select');
      if (!(selectedOption.hasClass('selected-val'))) {
        //      if (!($(elem).hasClass('selected-val'))) {
        var variantDiffAttributesDiv = selectedOption.parents('.variant-diff-attr-div');
        //        var variantDiffAttributesDiv = $(elem).parents('.variant-diff-attr-div');
        var diffAttrSels = variantDiffAttributesDiv.find('select');
        var key = "";
        //        var currentAttrValOptn = $(elem);

        parentAttrSel.find('option.diff-attr-val.selected-val').removeClass('selected-val');
        selectedOption.addClass('selected-val');
        //        $(elem).addClass('selected-val');

        key = HK.Pack().buildFilterKey(diffAttrSels, parentAttrSel, selectedOption);
        //        key = HK.Pack().buildFilterKey(diffAttrSels, parentAttrSel, currentAttrValOptn);
        var varId;

        if (keyVariantMap[key] == null) {
          var currOption = selectedOption.attr('attr-val-comb');
          //          var currOption = $(elem).attr('attr-val-comb');
          var packId = parentAttrSel.parents('div.pack-div').attr('data-packId');
          var packSpCtr = parentAttrSel.parents('div.pack-sp-div').attr('data-pack-spCtr');

          var keysForCurrentProductInPack = (_.filter(_.keys(keyVariantMap), function(keyEntry) {
            return keyEntry.indexOf(packId + filterSeperator + packSpCtr + filterSeperator) >= 0;
          }));

          var variantKeyCorrToCurrOption = (_.find(keysForCurrentProductInPack, function(keyEntry) {
            return keyEntry.indexOf(currOption) >= 0;
          }));

          parentAttrSel.parents('div.pack-sp-div').find('option.diff-attr-val.selected-val').removeClass('selected-val');
          var attrValuePairs = variantKeyCorrToCurrOption.split(filterSeperator);
          _.each(attrValuePairs, function(attrValuePair) {
            parentAttrSel.parents('div.pack-sp-div').find('option.diff-attr-val[attr-val-comb="' + attrValuePair + '"]').addClass('selected-val');
          });

          //hide current variant
          selectedOption.parents('div.pack-sp-div').find('div.pack-var-div:visible').addClass('hide');
          //          currentAttrValOptn.parents('div.pack-sp-div').find('div.pack-var-div:visible').addClass('hide');

          //show the selected variant
          varId = keyVariantMap[variantKeyCorrToCurrOption];
          selectedOption.parents('div.pack-sp-div').find('div.pack-var-div[data-vId="' + varId + '"]').removeClass('hide');
          //          currentAttrValOptn.parents('div.pack-sp-div').find('div.pack-var-div[data-vId="' + varId + '"]').removeClass('hide');
        } else {
          //hide current variant
          selectedOption.parents('div.pack-sp-div').find('div.pack-var-div:visible').addClass('hide');
          //          currentAttrValOptn.parents('div.pack-sp-div').find('div.pack-var-div:visible').addClass('hide');

          //show the selected variant
          varId = keyVariantMap[key];
          selectedOption.parents('div.pack-sp-div').find('div.pack-var-div[data-vId="' + varId + '"]').removeClass('hide');
          //          currentAttrValOptn.parents('div.pack-sp-div').find('div.pack-var-div[data-vId="' + varId + '"]').removeClass('hide');
        }

        variantDiffAttributesDiv.find('option.diff-attr-val').removeAttr("title");
        variantDiffAttributesDiv.find('option.diff-attr-val').removeClass("inactive");
        HK.Pack().handleAvailability(variantDiffAttributesDiv);
      }
      //reset dropdown for selected option
//      var firstOptionValueInSelect = parentAttrSel.find(':first-child').val();
//      parentAttrSel.val(firstOptionValueInSelect);
    }
  };
};