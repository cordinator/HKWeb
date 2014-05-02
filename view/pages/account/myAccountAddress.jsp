<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 17/07/13
  Time: 12:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.hk.constants.rest.HKWebMessageConstants" %>
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
          <c:choose>
            <c:when test="${addressAction.accountLoaded eq true}">
              <div class="span11 offset1">
                <c:choose>
                  <c:when test="${addressAction.userAddressListResponse.addresses!=null and fn:length(addressAction.userAddressListResponse.addresses)>0}">
                <c:forEach items="${addressAction.userAddressListResponse.addresses}" var="address" varStatus="ctr">
                  <div class="span3 address-cntnr">
                    <div class="usr-add">
                      <p class="fnt-caps fnt-bold">${address.name}</p>

                      <div class="add-cntnr fnt-sz10">
                          ${address.line1},
                          ${address.landmark}
                          <c:if test="${fn:length(address.landmark)>0}">, </c:if>
                          ${address.cityName},
                          ${address.stateName} - ${address.pincode}
                        <p>Ph: ${address.contactNumber}<c:if test="${fn:length(address.alternateContactNumber)>0}">, </c:if>
                        </p>
                        <p>${address.alternateContactNumber}</p>
                      </div>
                      <div class="address-action-cntnr ">
                        <s:link class="fnt-sz10" beanclass="com.hk.web.action.beta.account.MyAccountAddressAction"
                                event="editAddress">
                          Edit <span>&raquo;</span>
                          <s:param name="addressId" value="${address.id}"/>
                          <s:param name="tabId" value="4"/>
                        </s:link>
                        <s:link class="fnt-sz10 mrgn-l-20 deleteAddress"
                                beanclass="com.hk.web.action.beta.account.MyAccountAddressAction"
                                event="deleteAddress">
                          Remove <span>&raquo;</span>
                          <s:param name="addressId" value="${address.id}"/>
                        </s:link>
                      </div>
                    </div>
                  </div>
                </c:forEach>
                  </c:when>
                 <c:otherwise>
                   <%=HKWebMessageConstants.ADDRESS_NOT_AVAILABLE%>
                 </c:otherwise>
                </c:choose>
              </div>
            </c:when>
            <c:otherwise>
              <%=HKWebMessageConstants.ERROR%>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </s:layout-component>
  <s:layout-component name="scriptComponent">
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/email/email.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $('[data-tab-id=${addressAction.tabId}]').show();
        $('.deleteAddress').click(function(event){
             event.preventDefault();
             var url = $(this).attr('href');
             HK.confirm({
               title:"Confirm Deletion",
               theme:HK.POPUP.THEME.ALERT,
               content:"Are you Sure to delete this Address?",
               btnArr : [
                 {
                   text:'yes',
                   callback:successCallback,
                   title:"hint"
                 },{
                   text:'no',
                   callback:removeCallback,
                   title:"hint"}
               ]
             });

          function successCallback(){
            location.href=url;
            HK.shadow.show();
          }
          function removeCallback(){
            HK.shadow.hide();
          }
//             event.preventDefault();
        });
      });
    </script>
  </s:layout-component>
</s:layout-render>

