<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 11/06/13
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp" type="paymentFlow">
<s:useActionBean beanclass="com.hk.web.action.beta.order.SelectAddressAction" var="shippingAddressAction"/>
<s:layout-component name="content">
    <div class="mainContainer">
    <div class="container clearfix ">
            <%--TODO need to show on account create--%>
            <%--<div class="span16">
              <div class="accnt-success-cntnr">
                <span class="icn icn-close1 cont-rht"></span>

                <div class="sucess-txt-cntnr">
                  <p class="title">New account created!</p>

                  <p>
                    Thank you for registering with us. An email has been sent to
                    a@frqcy.com. You need to click on the link in the mail to verify
                    your email ID. You can still shop with us without verifying but
                    you will not be able to apply discount coupons
                  </p>
                </div>
              </div>
            </div>--%>
            <%-- checkout strip flow begins--%>
        <div class="ttl-cntnr">
                  <span class="icn icn-sqre">
                  </span>

            <h1 class="chckout-hdr"> Checkout </h1>

            <span class="icn icn-sqre"></span>
        </div>
        <div class="ttl-cntnr">
            <span class="page-title current"> Shipping address </span>
            <span class="page-title "> Payment </span>
            <span class="page-title"> Order complete </span>
        </div>
            <%--checkout strip flow ends--%>

        <div class="span16 mrgn-t-50">

                <%--Error/success Msg begins--%>
            <s:layout-render name="/layouts/errorLayout.jsp"/>
                <%--Error/success Msg ends--%>

            <c:if test="${fn:length(shippingAddressAction.addressList)>0}">
                <div class="span6 txt-cntr fnt-caps alpha">
                    select an address for delivery
                </div>
            </c:if>
            <c:if test="${fn:length(shippingAddressAction.addressList)>0}">
            <div class="span10 txt-cntr fnt-caps"> or
                </c:if>
                <c:if test="${fn:length(shippingAddressAction.addressList)<=0}">
                <div class="span10 txt-cntr mrgn-cntr fnt-caps">
                    </c:if>
                    enter an address for delivery
                </div>
            </div>
            <div class="span16">
                <c:if test="${fn:length(shippingAddressAction.addressList)>0}">
                    <div class="span6 alpha selct-add-section">

                        <c:forEach items="${shippingAddressAction.addressList}" var="addressBlock">

                            <div class="usr-add-cntnr">
                                <s:link class="icn icn-close2  cont-rht"
                                        beanclass="com.hk.web.action.beta.order.SelectAddressAction"
                                        event="deleteAddressForUser">
                                    &nbsp;
                                    <s:param name="addressId" value="${addressBlock.id}"/>
                                </s:link>
                                <div class="usr-add">
                                    <p class="fnt-caps">
                      <span class="adresss-usr-name">${addressBlock.name}
                      </span>
                                    </p>
                                    <span class="adresss-id hide">${addressBlock.id}</span>

                                    <p>
                                        <span class="adresss-txt ">${addressBlock.line1}</span>,
                                        <span class="adresss-landmark">${addressBlock.landmark}</span><c:if test="${fn:length(addressBlock.landmark)>0}">, </c:if>
                                            <%--<span class="adresss-place-name ">${addressBlock.placeName}</span>--%>
                                    </p>

                                    <p>
                                        <span class="address-cityId hide">${addressBlock.cityId}</span>
                                        <span class="address-cityname">${addressBlock.cityName}</span>,
                                    </p>

                                    <p>
                                        <span class="address-state hide">${addressBlock.stateId}</span>

                                        <span>${addressBlock.stateName} - </span>
                                        <span class="address-pincode">${addressBlock.pincode}</span>
                                    </p>

                                    <p> Ph:
                                        <span class="address-mobile-no">${addressBlock.contactNumber}</span><c:if test="${fn:length(addressBlock.alternateContactNumber)>0}">, </c:if>
                                        <span class="address-alt-no">${addressBlock.alternateContactNumber}</span>
                                    </p>

                                </div>
                                <div class="add-action-cntnr cont-lft">
                                    <s:link class="span2 btn btn-gray alpha select-address"
                                            beanclass="com.hk.web.action.beta.order.SelectPaymentModeAction" event="pre">
                                        select
                                        <s:param name="selectedAddressId" value="${addressBlock.id}"/>
                                    </s:link>
                                    <div class="span2">
                                        <span class="icn icn-sqre-blue"></span> <a href="javascript:void(0)"
                                                                                   class="edit-address">edit</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <div
                        class="${fn:length(shippingAddressAction.addressList)>0 ? 'span8 new-add-sectn' : 'span8 mrgn-cntr new-add-sectn'}">
                    <s:form beanclass="com.hk.web.action.beta.order.SelectAddressAction" name="selectAddress" method="POST">
                        <s:layout-render name="/layouts/createAddressLayout.jsp"
                                         shippingAddress="${shippingAddressAction}"
                                         states="${shippingAddressAction.stateList}"
                                         contactNo="${shippingAddressAction.contactNo}"
                                         addressId="${shippingAddressAction.addressId}"
                                         alternateContactNo="${shippingAddressAction.alternateContactNo}"/>
                    </s:form>
                </div>
            </div>
        </div>
    </div>
</s:layout-component>
<s:layout-component name="scriptComponent">
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/autocompleter.js"></script>--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/location/location.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('[name=addAddressForUser]').click(function (event) {
                var doSubmit = HK.Location().validateAddress();
                if (doSubmit != true) {
                    event.preventDefault();
                }
            });
            $('.edit-address').click(function (e) {
                e.stopPropagation();
                var currentAddCntnr = $(this).parents('.usr-add-cntnr').find('.usr-add');
                var addressid = currentAddCntnr.find('.adresss-id').text();
                var adresssUsrName = currentAddCntnr.find('.adresss-usr-name').text();
                var adresssTxt = currentAddCntnr.find('.adresss-txt').text();
                var adresssLandmark = currentAddCntnr.find('.adresss-landmark').text();
                var addressCityId = currentAddCntnr.find('.address-cityId').text();
                var addressCityName = currentAddCntnr.find('.address-cityname').text();
                var addressState = currentAddCntnr.find('.address-state').text();
                var addressPincode = currentAddCntnr.find('.address-pincode').text();
                var addressMobile = currentAddCntnr.find('.address-mobile-no').text();
                var addressAlternateNo = currentAddCntnr.find('.address-alt-no').text();
                $('#addressId').val(addressid);
                $('#user-name').val(adresssUsrName);
                $('#contactNo').val(addressMobile);
                $('#alternateContactNo').val(addressAlternateNo);
                $('#line1').val(adresssTxt);
                $('#landmark').val(adresssLandmark);
                $('#city-id').val(addressCityId);
                $('#cityName').val(addressCityName);
                $('#state').val(addressState);
                $('#pincode').val(addressPincode);
                $('#addAddressForUser').attr("name", "updateAddressForUser");
            });

            $('[name=stateId]').change(function (event) {
                var stateId = $(this).val();
                if (stateId != '') {
                    $('#cityName').val('');
                    HK.Location().initializeCityAutoComp(stateId);
                }
            });
            $('#pincode').blur(function () {
                $('#state').val('');
                $('#cityName').val('');
                var pincode = $(this).val();
                if (pincode != '') {
                    function getCityState(responseData) {
                        if (responseData.results.pin != null) {
                            var cityId = responseData.results.pin.cityId;
                            var cityName = responseData.results.pin.cityNm;
                            var stateId = responseData.results.pin.stateId;
                            var stateName = responseData.results.pin.stateNm;
                            $('#state').val(stateId);
                            $('#cityName').val(cityName);
                            $('#city-id').val(cityId);
                        }
                    };
                    HK.Location().getLocationDetails(pincode, getCityState);
                }
            });
            $('.usr-add-cntnr').click(function (e) {
                var selectedAddLink = $(this).children('.add-action-cntnr').children('.select-address');
                /*console.log(selectedAddLink);*/
                location.href = selectedAddLink.attr('href');
            });
        });
    </script>
</s:layout-component>
</s:layout-render>