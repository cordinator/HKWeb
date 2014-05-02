<%@ page import="com.hk.common.constants.user.RoleConstants" %>

<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 17/07/13
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp">
  <s:useActionBean beanclass="com.hk.web.action.beta.account.MyAccountAddressAction" var="addressAction"/>
  <c:set var="tabId" value="${addressAction.tabId}"/>
  <s:layout-component name="content">
    <div class="mainContainer">
      <div class="container clearfix">
          <%--breadcrumbs begins--%>
        <div class="hk-breadcrumb-cntnr">
            <span>
    <a href="/" title="Home">

    Home
              </a>
            </span>
          <span>&raquo;</span>
          <span>
            <s:link beanclass="com.hk.web.action.beta.account.MyAccountAction">
              Account
            </s:link>
          </span>
          <span>&raquo;</span>
            <span class="fnt-bold">
                Addresses
            </span>
        </div>
          <%--breadcrumbs ends--%>

          <%--unverified email Msg begins--%>
        <shiro:hasRole name="<%=RoleConstants.HK_UNVERIFIED%>">

          <div class="err-cntnr" id="actLinkDiv">
            <span class="icn-warning-small"></span>

            <div>
              <ul>
                <li>Your email id is not verified, kindly click on the link sent to your mail to apply offer coupons.
                  <a class="txt-blue" href="javascript:void(0)" id="actLink"> Click here</a> to resend the email.
                </li>
              </ul>
            </div>
            <span class="icn icn-close2 remove-error"></span>
          </div>
        </shiro:hasRole>
          <%--unverified email Msg ends--%>

          <%--Error/success Msg begins--%>
        <s:layout-render name="/layouts/errorLayout.jsp"/>
          <%--Error/success Msg ends--%>


        <div class="ttl-cntnr">
          <span class="icn icn-sqre "></span>

          <h1 class="">Addresses</h1>
          <span class="icn icn-sqre"></span>
        </div>
        <div class="row my-acnt-ht">
          <div class="span4">
            <s:layout-render name="/layouts/accountNavigationLayout.jsp" tabId="${tabId}"/>
          </div>
          <div class="span11 offset1">
            <div class="span10 alpha ">
              <s:form beanclass="com.hk.web.action.beta.account.MyAccountAddressAction" name="selectAddress"
                      method="POST">
                <s:hidden name="tabId" value="4"/>
                <s:layout-render name="/layouts/createAddressLayout.jsp" shippingAddress="${addressAction.address}"
                                 states="${addressAction.stateList}" contactNo="${addressAction.address.contactNumber}"
                                 addressId="${addressAction.address.id}"
                                 alternateContactNo="${addressAction.address.alternateContactNumber}"/>
              </s:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </s:layout-component>
  <s:layout-component name="scriptComponent">
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/location/location.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/email/email.js"></script>

    <script type="text/javascript">
      $(document).ready(function () {
        $('[data-tab-id=${addressAction.tabId}]').show();
        $('[name=addAddressForUser]').click(function (event) {
          var doSubmit = HK.Location().validateAddress();
          /*console.log(doSubmit);*/
          if (doSubmit != true) {
            event.preventDefault();
          }
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
      });
    </script>
  </s:layout-component>
</s:layout-render>