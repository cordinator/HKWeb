if (typeof(HK) == 'undefined') {
  HK = {};
}


HK.Location = function () {
  return{
    /*initializePlaceAutoComp: function (cityId) {
     var autoElem = $('input:text#placeName');
     var autoMinLen = 2;

     var onPlaceAutoCompleteSuccess = function (responseData) {
     return $.map(responseData.results.places, function (item) {
     return{
     label: item.nm,
     value: item.nm,
     placeId: item.id,
     pincode: item.pin.pin
     };
     });
     };

     var onPlaceAutoCompleteSelect = function (ui) {
     if (ui.item) {
     $('input:hidden#place-id').val(ui.item.placeId);
     $('input:text#pincode').val(ui.item.pincode);
     }
     };

     HK.AutoCompleterStatic().autocomplete(
     autoElem,
     HK.urls.locationApi + "/" + cityId + "/places/",
     onPlaceAutoCompleteSuccess,
     onPlaceAutoCompleteSelect,
     autoMinLen
     );
     },*/

    initializeCityAutoComp: function (stateId) {
      var autoElem = $('input:text#cityName');
      var autoMinLen = 2;

      var onCityAutoCompleteSuccess = function (responseData) {
        return $.map(responseData.results.cities, function (item) {
          return{
            label: item.nm,
            value: item.nm,
            cityId: item.id
          };
        });
      };

      var onCityAutoCompleteSelect = function (ui) {
        if (ui.item) {
          var cityId = ui.item.cityId;
          $('input:hidden#city-id').val(cityId);
          //          HK.Location().initializePlaceAutoComp(cityId);
        }
      };

      HK.AutoCompleterStatic().autocomplete(
          autoElem,
          HK.urls.locationApi + "/" + stateId + "/cities/",
          onCityAutoCompleteSuccess,
          onCityAutoCompleteSelect,
          autoMinLen
      );
    },

    initializeStateAutoComp: function (countryId) {
      var autoElem = $('input:text#state');
      var autoMinLen = 2;

      var onStateAutoCompleteSuccess = function (responseData) {
        return $.map(responseData.results.states, function (item) {
          return{
            label: item.nm,
            value: item.nm,
            stateId: item.id
          };
        });
      };

      var onStateAutoCompleteSelect = function (ui) {
        if (ui.item) {
          var stateId = ui.item.stateId;
          $('input:hidden#state-id').val(stateId);
          HK.Location().initializeCityAutoComp(stateId);
        }
      };

      HK.AutoCompleterStatic().autocomplete(
          autoElem,
          HK.urls.locationApi + "/" + countryId + "/states/",
          onStateAutoCompleteSuccess,
          onStateAutoCompleteSelect,
          autoMinLen
      );
    },

    initializeCountryAutoComp: function () {
      var autoElem = $('input:text#country');
      var autoMinLen = 2;

      var onStateAutoCompleteSuccess = function (responseData) {
        return $.map(responseData.results.countries, function (item) {
          return{
            label: item.nm,
            value: item.nm,
            countryId: item.id
          };
        });
      };

      var onStateAutoCompleteSelect = function (ui) {
        if (ui.item) {
          var countryId = ui.item.countryId;
          $('input:hidden#country-id').val(countryId);
          HK.Location().initializeStateAutoComp(countryId);
        }
      };

      HK.AutoCompleterStatic().autocomplete(
          autoElem,
          HK.urls.locationApi + "/countries/",
          onStateAutoCompleteSuccess,
          onStateAutoCompleteSelect,
          autoMinLen
      );
    },

    getLocationDetails: function (pincode, callback) {
      var onSuccess = function (responseData) {
        callback(responseData);
      };

      var onError = function () {
        // do something if required..!
      };
      HK.Ajax.getJson(
          HK.urls.locationApi + "/" + pincode + "/location/details",
          onSuccess,
          onError
      );

    },

    validateAddress: function () {
      var doSubmit = true;
      if (HK.validator.isNull('[name=name]')) {
        doSubmit = false;
        HK.validator.hideErrMsg('[name=name]');
        HK.validator.showErrMsg('[name=name]', HK.errs.enterName);
      }
      else {
        HK.validator.hideErrMsg('[name=name]');
      }
      if (HK.validator.isNull('[name=contactNo]')) {
        doSubmit = false;
        HK.validator.hideErrMsg('[name=contactNo]');
        HK.validator.showErrMsg('[name=contactNo]', HK.errs.enterPhoneNumber);

      }
      else if (!HK.validator.isPhoneNumber('[name=contactNo]')) {
        doSubmit = false;
        HK.validator.hideErrMsg('[name=contactNo]');
        HK.validator.showErrMsg('[name=contactNo]', HK.errs.invalidPhoneNumber);
      }
      else {
        HK.validator.hideErrMsg('[name=contactNo]');
      }
/*
      if (!HK.validator.isNull('[name=alternateContactNo]')) {
        if (!HK.validator.isPhoneNumber('[name=alternateContactNo]')) {
          doSubmit = false;
          HK.validator.hideErrMsg('[name=alternateContactNo]');
          HK.validator.showErrMsg('[name=alternateContactNo]', HK.errs.invalidPhoneNumber);
        }
        else {
          HK.validator.hideErrMsg('[name=alternateContactNo]');

        }
      }*/
      if (HK.validator.isNull('[name=line1]')) {
        doSubmit = false;
        HK.validator.hideErrMsg('[name=line1]');
        HK.validator.showErrMsg('[name=line1]', HK.errs.enterAddLine);
      }
      else {
        HK.validator.hideErrMsg('[name=line1]');
      }

      if (HK.validator.isNull('[name=pincode]')) {
        doSubmit = false;
        HK.validator.hideErrMsg('[name=pincode]');
        HK.validator.showErrMsg('[name=pincode]', HK.errs.invalidPincode);
      }
      else if (!HK.validator.isNumber('[name=pincode]')) {
        doSubmit = false;
        HK.validator.hideErrMsg('[name=pincode]');
        HK.validator.showErrMsg('[name=pincode]', HK.errs.invalidPincode);
      }
      else {
        HK.validator.hideErrMsg('[name=pincode]');
      }

      if (HK.validator.isNull('[name=stateId]')) {
        doSubmit = false;
        HK.validator.hideErrMsg('[name=stateId]');
        HK.validator.showErrMsg('[name=stateId]', HK.errs.enterState);
      }
      else {
        HK.validator.hideErrMsg('[name=stateId]');
      }
      if (HK.validator.isNull('[name=cityName]')) {
        doSubmit = false;
        HK.validator.showErrMsg('[name=cityName]', HK.errs.enterCity);
      }
      else {
        HK.validator.hideErrMsg('[name=cityName]');
      }


      /*console.log(doSubmit);*/
      return doSubmit;

    }
  };
};