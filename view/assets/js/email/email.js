if (typeof(HK) == 'undefined') {
  HK = {};
}
  $('#actLink').click(function () {
    HK.Ajax.getJson(
        HK.urls.activationEmail,
        function (responseData) {
          if (responseData.exception) {
            HK.alert({title: "ERROR", content: responseData.messages[0], theme: HK.POPUP.THEME.ALERT});
          } else {
            $('#actLinkDiv').hide();
            HK.confirm({title: "SUCCESS", content: responseData.messages[0]});
          }
        },
        ""
    );
  });