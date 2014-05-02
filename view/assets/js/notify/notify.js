/**
 * Created with IntelliJ IDEA.
 * User: Sachit
 * Date: 9/13/13
 * Time: 4:14 PM
 * To change this template use File | Settings | File Templates.
 */
if (typeof(HK) == 'undefined') {
    HK = {};
}
$('.hide-if-nojs').show();
function submitNotifyData() {
    var currEle = $('#notify-submit');
    var name = $('#notifyDialog').find('.widget-box [name="notifyUserName"]').val();
    var email = $('#notifyDialog').find('.widget-box [name="notifyEmail"]').val();
    var variantId = $('.notifyBtn ').attr("oldVariantId");
    HK.element.loader.add(currEle, true);
    var url = HK.urls.notifyUpdate;
    var map = {
        'nm': name,
        'email': email,
        'variant': variantId
    };
    var onSuccess = function (responseData) {
        if (responseData.results.success) {
            HK.element.loader.remove(currEle, true);
            var suucessMsg = responseData.messages;
            $('#notifyDialog').find('.dialog-subcntnr').hide();
            $('#notifyDialog').find('.resp-msg').show().addClass('sucss-txt-small').html(suucessMsg);
            /*console.log(responseData);*/
        }
        else  {
            HK.element.loader.remove(currEle, true);
            var errorMsg = responseData.messages;
            $('#notifyDialog').find('.dialog-subcntnr').hide();
            $('#notifyDialog').find('.resp-msg').show().addClass('err-txt').html(errorMsg);
            if (responseData.results.accntLnk != null) {
                var accntLink = (responseData.results.accntLnk);
                $('#notifyDialog').find('.resp-msg').show().addClass('err-txt').html(errorMsg + 'Please <a href="' + accntLink + '"> click here </a> to go to My Account and subscribe again. ');
            }
        }
    };
    var onError = function (xhr, a_status) {
        HK.element.loader.remove(currEle, true);
    };
    HK.Ajax.postJson(url, map, onSuccess, onError);

};

$('.notifyBtn').click(function (e) {
    HK.utils.Scroll.toElement('body', 500);
    var currEle = $(this);
    var name,  email, isError;
    var url = HK.urls.notifyUserDetails;
    HK.element.loader.add(currEle, true);
    var onSuccess = function (responseData) {
        HK.element.loader.remove(currEle, true);
        var resultArray = responseData.results;
        name = resultArray.nm;
        email = resultArray.email;
        if (!resultArray.isSubscribedForNotify) {
            var resMsg = responseData.messages[0];
            var actLink = resultArray.accntLnk;
            HK.alert({title: 'We cannot allow that!', content: resMsg + '<br> Please <a href="' + actLink + '"> click here </a> to go to My Account and subscribe again. ', theme: HK.POPUP.THEME.ALERT});
        } else if (name != null && email != null) {
            $('#notifyDialog').find('.widget-box [name="notifyUserName"]').val(name);
            $('#notifyDialog').find('.widget-box [name="notifyEmail"]').val(email);
            ShowHide('notifyDialog', '0');

        }
        else {
            ShowHide('notifyDialog', '0');

        }
    };
    var onError = function (xhr, a_status) {
        HK.element.loader.remove(currEle, true);
    };
    HK.Ajax.getJson(url, onSuccess, onError);
});

$('.close-dialog').click(function () {
    ShowHide('notifyDialog', '1');
});
$('#overlayDIV').click(function () {
    ShowHide('notifyDialog', '1');
});

$('#notify-submit').click(function () {
    var doSubmit = true;
    if (HK.validator.isNull('[name=notifyUserName]')) {
        HK.validator.showErrMsg('[name=notifyUserName]', HK.errs.enterName);
        doSubmit = false;
    }
    else {
        HK.validator.hideErrMsg('[name=notifyUserName]');
    }
    if (HK.validator.isNull('[name=notifyEmail]')) {
        HK.validator.hideErrMsg('[name=notifyEmail]');
        HK.validator.showErrMsg('[name=notifyEmail]', HK.errs.enterEmail);
        doSubmit = false;
    }
    else if (!HK.validator.isEmail('[name=notifyEmail]')) {
        HK.validator.hideErrMsg('[name=notifyEmail]');
        HK.validator.showErrMsg('[name=notifyEmail]', HK.errs.invalidEmail);
        doSubmit = false;
    }
    else {
        HK.validator.hideErrMsg('[name=notifyEmail]');
    }

    if (!doSubmit) {
        return false;
    }
    submitNotifyData();
});