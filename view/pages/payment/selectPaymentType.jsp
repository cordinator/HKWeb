<%@ page import="com.hk.common.constants.EnvConstants" %>
<%@ page import="com.hk.common.constants.payment.EnumPaymentType" %>
<%@ page import="com.hk.constants.payment.PaymentGatewayParameters" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp" type="paymentFlow">
<%
    response.setHeader("Cache-Control", "no-cache, no-store, max-age=0");
    response.setHeader("pragma", "no-cache");
    response.setDateHeader("Expires", -1);
%>
<s:useActionBean beanclass="com.hk.web.action.beta.order.SelectPaymentModeAction" var="paymentModeAction"/>
<c:set var="selectedAddress" value="${paymentModeAction.selectedAddress}"/>
<c:set var="orderPreparedForPurchaseResponse" value="${paymentModeAction.orderPreparedForPurchaseResponse}"/>
<c:set var="orderPricingDto" value="${orderPreparedForPurchaseResponse.orderPricingDto}"/>
<c:set var="cashOnDelivery" value="<%=EnumPaymentType.COD.getId()%>"/>
<c:set var="hkPayCashOnDelivery" value="999"/>
<c:set var="online" value="<%=EnumPaymentType.ONLINE_PAYMENT.getId()%>"/>
<c:set var="isDevEnv" value="<%=EnvConstants.isDevEnv()%>"/>

<c:set var="redirectAction" value=""/>

<s:layout-component name="content">
<div class="mainContainer">
<div class="container clearfix">
    <%--checkout strip flow begins  --%>
<div class="ttl-cntnr">
        <span class="icn icn-sqre">
        </span>

    <h1 class="chckout-hdr"> Checkout </h1>

    <span class="icn icn-sqre"></span>
</div>


<div class="ttl-cntnr">
    <span class="page-title"> Shipping address </span>
    <span class="page-title current"> Payment </span>
    <span class="page-title"> Order complete </span>
</div>


    <%--checkout strip flow ends--%>

<c:if test="${paymentModeAction.paymentFail eq true}">
    <div class="pmt-status-cntnr">
        <div class="icn-holder">
            <span class="icn-warning-large"></span>
        </div>
        <div class="warning-txt-cntnr">
            <h2>YOUR PAYMENT WAS NOT SUCESSFUL</h2>

            <p>The reason for this might be a network error or a communication error between the bank and the payment
                gateway. There also might be a good possibility that you entered incorrect information with your present
                card.
                Please try the payment again with a different payment mode or a different card.</p>
        </div>
    </div>
</c:if>
<div class="span16 mrgn-t-35">
    <div class="span8 brdr-r">


        <div class="span7 alpha">
            <span class="fnt-caps fnt-bold">shipping address</span>
                <%-- TODO : Need to work on this on later stage
                <span class="icn icn-sqre-blue mrgn-l-20"></span> <a href="#">change</a>
                --%>
        </div>
        <p class="span5 alpha mrgn-t-20">${selectedAddress.name}</p>

        <p class="span5 alpha">${selectedAddress.line1}, ${selectedAddress.landmark}<c:if test="${fn:length(selectedAddress.landmark)>0}">, </c:if></p>

        <p class="span5 alpha"> ${selectedAddress.cityName},</p>

        <p class="span5 alpha">${selectedAddress.stateName} - ${selectedAddress.pincode}</p>

        <p class="span5 alpha">Ph: ${selectedAddress.contactNumber}<c:if test="${fn:length(selectedAddress.alternateContactNumber)>0}">, </c:if>
        ${selectedAddress.alternateContactNumber}
        </p>


    </div>
    <div class="span7">

        <c:if test="${orderPricingDto ne null}">
            <p class="fnt-caps fnt-bold">Order Details</p>

            <p class="mrgn-t-20 fnt-sz13">YOU PAY : <span class="fnt-caps">Rs. ${orderPricingDto.totalPayable}</span>
            </p>

            <p class="fnt-sz13">TOTAL ITEMS : <span
                    class="fnt-caps">${orderPreparedForPurchaseResponse.itemsInCart}</span></p>
        </c:if>
    </div>

</div>
<div class="span16 mrgn-t-35">

    <div class="mrgn-bt-30 txt-cntr fnt-caps"> choose a payment type</div>
    <div id="v-nav">
        <ul id="nav">
            <c:forEach items="${paymentModeAction.selectPaymentModeResponses}" var="paymentModeResponse"
                       varStatus="ctr">
                <c:choose>
                    <c:when test="${ctr.first}">
                        <li tab="tab${ctr.index+1}" class="first current">${paymentModeResponse.displayName}</li>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${ctr.last}">
                                <li tab="tab${ctr.index+1}" class="last">${paymentModeResponse.displayName}</li>
                            </c:when>
                            <c:otherwise>
                                <li tab="tab${ctr.index+1}">${paymentModeResponse.displayName}</li>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </ul>
        <span class="cntnr-border"> </span>
        <s:form action="<%=EnvConstants.HK_PAY_PAYMENT_URL%>" method="POST" id="payFrm">
            <input type="hidden" name="<%=PaymentGatewayParameters.ADDRESS%>"
                   value="${paymentModeAction.selectedAddress.line1}"/>
            <input type="hidden" name="<%=PaymentGatewayParameters.CITY%>"
                   value="${paymentModeAction.selectedAddress.cityName}"/>
            <input type="hidden" name="<%=PaymentGatewayParameters.STATE%>"
                   value="${paymentModeAction.selectedAddress.stateName}"/>
            <input type="hidden" id="hkPayPhone" name="<%=PaymentGatewayParameters.PHONE%>"
                   value="${paymentModeAction.selectedAddress.contactNumber}" id="contactPhn"/>
            <input type="hidden" name="<%=PaymentGatewayParameters.POSTAL_CODE%>"
                   value="${paymentModeAction.selectedAddress.pincode}"/>
            <input type="hidden" id="hkPayName" name="<%=PaymentGatewayParameters.NAME%>"
                   value="${paymentModeAction.selectedAddress.name}" id="name"/>
            <input type="hidden" name="<%=PaymentGatewayParameters.EMAIL%>" value="${paymentModeAction.email}"/>
            <input type="hidden" name="<%=PaymentGatewayParameters.RETURN_URL%>"
                   value="<%=EnvConstants.getHkPayReturnUrl()%>"/>
            <input type="hidden" name="<%=PaymentGatewayParameters.ACCOUNT_ID%>"
                   value="<%=PaymentGatewayParameters.hk_accountId%>"/>
            <input type="hidden" name="<%=PaymentGatewayParameters.GATEWAY_ORDER_ID%>" id="gatwyOrdrid" value=""/>
            <input type="hidden" name="<%=PaymentGatewayParameters.DESCRIPTION%>" value="ONLINE TRANSACTION"/>
            <input type="hidden" name="<%=PaymentGatewayParameters.SECURE_HASH%>" id="payChckSm" value=""/>
            <input type="hidden" name="<%=PaymentGatewayParameters.AMOUNT%>" value="${paymentModeAction.amountStr}"/>
            <input type="hidden" name="<%=PaymentGatewayParameters.COUNTRY%>" value="IND"/>
            <input type="hidden" name="<%=PaymentGatewayParameters.PAYMENT_OPTION%>" value="" id="payOpt"/>

            <div class="tab-content">
                <c:forEach items="${paymentModeAction.selectPaymentModeResponses}" var="paymentModeResponse"
                           varStatus="ctr">
                    <div class="tabs" id="tab${ctr.index+1}">

                        <c:choose>
                            <c:when test="${paymentModeResponse.id eq hkPayCashOnDelivery}">
                                <div class="span5 cont-lft cntct-det-cntnr">
                                    <p class="fnt-caps mrgn-b-20">contact details</p>

                                    <div class="span4 alpha">
                                        <label for="user-name">Name</label>
                                        <input type="text" id="user-name" tabindex="10"/>
                                    </div>
                                    <div class="span4 alpha">
                                        <label for="phone">Phone No.</label>
                                        <input type="text" id="phone" tabindex="10"/>
                                    </div>
                                    <div class="row">
                                        <div class="span5 mrgn-bt-20">
                                            <input type="hidden" id="codIssId"
                                                   value="${paymentModeResponse.priorityIssuers[0].issuerIdentifier}"/>
                                            <input type="button" value="Make Payment" class="btn btn-blue crtPay"
                                                   data-cod="999"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="cont-lft span5">
                                    <p class="fnt-caps">terms and conditions </p>

                                    <p class="mrgn-b-10 fnt-caps">for cash on delivery </p>

                                    <p class="mrgn-b-10">
                                        1. Please ensure that you enter the name
                                        and contact number of the person who
                                        will receive the order. Incorrect details can
                                        delay your order.
                                    </p>

                                    <p class="mrgn-b-10">
                                        2. You will receive an automated call on
                                        the contact number given. Please take the
                                        call and respond as per instructions to
                                        verify your order.
                                    </p>

                                    <p class="mrgn-b-10">
                                        3. In case you miss the call, our agent will
                                        call you again to verify. Order will not be
                                        processed till verification happens.
                                    </p>

                                    <p class="mrgn-b-10">
                                        4. Lastly, make sure the person receiving
                                        the order is available to take it at the
                                        designated time of delivery.
                                    </p>
                                </div>
                            </c:when>

                            <c:otherwise>
                                <div class="tab-inner-cont">
                                    <c:forEach items="${paymentModeResponse.priorityIssuers}" var="priorityIssuer">

                                        <p class="pmt-provider  cont-lft">
                                            <input type="radio" name="selectBank"
                                                   value="${priorityIssuer.issuerIdentifier}"
                                                   class="priorIssuer cont-lft"/>
                                            <span class="img-box img-box-115-70 cont-rht"><img
                                                    src="${priorityIssuer.imageUrl}"
                                                    alt="${priorityIssuer.name}"/></span>
                                        </p>
                                    </c:forEach>
                                    <c:if
                                            test="${paymentModeResponse.otherIssuers!=null and fn:length(paymentModeResponse.otherIssuers)>0}">
                                        <p class="cont-lft other-issuer-cont">
                                            <input type="radio" name="selectBank" class="otherIssuer"/>
                                            <span class="fnt-sz10 ">Other Issuer</span>
                                        </p>

                                        <p class="cont-lft othIssSpn hide">
                                            <select class="othIssuer">
                                                <option value="">--Select--</option>
                                                <c:forEach items="${paymentModeResponse.otherIssuers}"
                                                           var="otherIssuer">
                                                    <option value="${otherIssuer.issuerIdentifier}">${otherIssuer.name}</option>
                                                </c:forEach>
                                            </select>
                                        </p>
                                    </c:if>
                                    <p class=" alpha span5 mrgn-bt-20">
                                        <input type="button" value="Make Payment" class="btn btn-blue crtPay"/>
                                    </p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:forEach>
            </div>
            <c:if test="${isDevEnv eq true}">
                <c:set var="redirectAction" value="${pageContext.request.contextPath}/pages/payment/dummyGateway.jsp"/>
                <input type="button" value="DUMMY GATEWAY" class="btn btn-blue crtPay" data-id="dummy"/>
            </c:if>
        </s:form>
        <span class="cntnr-border"> </span>
    </div>
</div>
</div>
</div>
</s:layout-component>
<s:layout-component name="scriptComponent">
    <script type="text/javascript">

        $(document).ready(function () {
            /**------------------------------------Vertical tabbed  navigation -----------------------------**/

            $('.tab-content div.tabs').hide();
            $('.tab-content div.tabs:first').show();
            $('#nav li').click(function () {
                $('#nav li').removeClass("current");
                $(this).addClass("current");
                $('.tab-content div.tabs').hide();
                var indexer = $(this).index(); //gets the current index of (this)  which is #nav li
                $('div.tabs:eq(' + indexer + ')').show(); //uses whatever index the link has to open the corresponding box

            });

            /**------------------------------------------vertical tabbed navigation ends---------------------------- **/

            $('.priorIssuer').click(function () {
                //        $(this).parent().siblings('.othIssSpn').hide();
                $('.othIssSpn').hide();
            });


            $('.otherIssuer').click(function () {
                $('.othIssSpn').show();
            });


            $('.crtPay').click(function () {
                var elm = $(this);
                var dataId = elm.attr("data-id");
                HK.element.disable(elm);
                var issuerId;
                var userName = null;
                var phoneNo = null;
                var paymentMode = null;
                var cod = elm.attr("data-cod");
                var redirectAction = "${redirectAction}";
                if (dataId != null && dataId != "" && redirectAction != "") {
                    $('#payFrm').attr("action", redirectAction);
                }
                else if (cod != null && cod != "") {
                    issuerId = $('#codIssId').val();
                    userName = $('#user-name');
                    phoneNo = $('#phone');
                    if (HK.validator.isNull(userName) || HK.validator.isNull(phoneNo)) {
                        if (HK.validator.isNull(userName))
                            HK.validator.showErrMsg(userName, HK.errs.enterName);
                        else
                            HK.validator.hideErrMsg(userName, HK.errs.enterName);
                        if (HK.validator.isNull(phoneNo))
                            HK.validator.showErrMsg(phoneNo, HK.errs.enterPhoneNumber);
                        else
                            HK.validator.hideErrMsg(phoneNo, HK.errs.enterPhoneNumber);

                        <%--HK.alert({title: "NOT ALLOWED", content: "Please Enter Contact Name and Phone Number", theme: HK.POPUP.THEME.ALERT});--%>
                        HK.element.enable(elm);
                        return false;
                    }
                    $('#hkPayPhone').val(phoneNo.val());
                    $('#hkPayName').val(userName.val());
                } else {
                    issuerId = $('input:radio:checked').val();
                    HK.validator.hideErrMsg(userName, HK.errs.enterName);
                    HK.validator.hideErrMsg(phoneNo, HK.errs.enterPhoneNumber);
                    if (issuerId == null || issuerId == "" || issuerId == "on") {
                        issuerId = elm.parent().siblings('.othIssSpn').children('.othIssuer').val();
                        if (issuerId == null || issuerId == "") {
                            HK.alert({title: "NOT ALLOWED", content: "Please Select Payment Mode", theme: HK.POPUP.THEME.ALERT});
                            HK.element.enable(elm);
                            return false;
                        }
                    }
                }
                $('#payOpt').val(issuerId);

                if (userName != null && phoneNo != null) {
                    paymentMode = "${cashOnDelivery}";
                    userName = userName.val();
                    phoneNo = phoneNo.val();
                } else {
                    paymentMode = "${online}";
                }
                // Now PostJson to create payment and paymentLife cycle and to verify trimmed shopping cartLineItems

                var params = {
                    "amount": "${paymentModeAction.amountStr}",
                    "addressId": ${paymentModeAction.selectedAddress.id},
                    "paymentTypeId": paymentMode,
                    "paymentStatusId": null,
                    "contactName": userName,
                    "contactNo": phoneNo
                };

                HK.Ajax.postJson(
                        HK.urls.paymentCreate, params,
                        function (responseData) {
                            if (responseData.exception) {
                                var ref = HK.alert({title: "NOT ALLOWED", content: responseData.messages[0], theme: HK.POPUP.THEME.ALERT});
                                ref.root.on("remove", function () {
                                    location.href = location.href;
                                });
                            } else {
                                if (responseData.results.shoppingCartTrimmedVariants != null && responseData.results.shoppingCartTrimmedVariants.length > 0) {

                                    var ref = HK.alert({title: "NOT ALLOWED", content: "Some Products Have been Trim due to no available Inventory", theme: HK.POPUP.THEME.ALERT});
                                    /* Need to show pop up and forward accordingly */
                                    ref.root.on("remove", function () {
                                        location.href = location.href;
                                    });
                                } else {
                                    $('#payChckSm').val(responseData.results.paymentChecksum);
                                    $('#gatwyOrdrid').val(responseData.results.gatewayOrderId);
                                    $('#payFrm').submit();
                                }
                            }
                        });
            });
        });
    </script>
</s:layout-component>
</s:layout-render>
