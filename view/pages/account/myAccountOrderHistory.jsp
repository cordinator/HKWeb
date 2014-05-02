<%--
  Created by IntelliJ IDEA.
  User: Vaibhav
  Date: 16/07/13
  Time: 13:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp" pageTitle="My Account | Healthkart">
  <s:useActionBean beanclass="com.hk.web.action.beta.account.MyAccountOrderHistoryAction" var="orderHistoryAction"/>
  <c:set var="tabId" value="${orderHistoryAction.tabId}"/>
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
          Orders
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

          <h1>Orders</h1>
          <span class="icn icn-sqre"></span>
        </div>
        <div class="row my-acnt-ht">


          <div class="span4">
            <s:layout-render name="/layouts/accountNavigationLayout.jsp" tabId="${tabId}"/>
          </div>

          <div class="span12">

          <c:if test="${orderHistoryAction.recentOrdersAvailable eq false}">
            No recent orders available
          </c:if>
          <c:forEach items="${orderHistoryAction.recentOrdersApiResponse.orders}" var="recentOrder">
            <c:forEach items="${recentOrder.shoppingCartVariants}" var="orderVariant">
              ${orderVariant.name} : ${orderVariant.variantTotalMrp}
            </c:forEach>
          </c:forEach>
          </div>
        </div>
      </div>
    </div>
  </s:layout-component>

  <s:layout-component name="scriptComponent">

  </s:layout-component>
</s:layout-render>