<%@ page import="com.hk.constants.account.MyAccountConstants" %>
<%--
  Created by IntelliJ IDEA.
  User: Sachit
  Date: 17/07/13
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/includes/taglibInclude.jsp" %>

<s:layout-definition>
    <c:set var="accountTab" value="<%=MyAccountConstants.ACCOUNT_TAB%>"/>
    <c:set var="editEmailTab" value="<%=MyAccountConstants.EDIT_EMAIL_TAB%>"/>
    <c:set var="changePasswordTab" value="<%=MyAccountConstants.CHANGE_PASSWORD_TAB%>"/>
    <c:set var="addressesTab" value="<%=MyAccountConstants.ADDRESSES_TAB%>"/>
    <c:set var="ordersTab" value="<%=MyAccountConstants.ORDER_HISTORY_TAB%>"/>
    <c:set var="reorderTab" value="<%=MyAccountConstants.REORDERS_TAB%>"/>
    <c:set var="rewardPointsTab" value="<%=MyAccountConstants.REWARD_POINTS_TAB%>"/>
    <ul class="accnt-nav-box">
        <li data-nav-id="${accountTab}" class="${tabId eq accountTab ?'selected':''}">
            <s:link beanclass="com.hk.web.action.beta.account.MyAccountAction" event="pre">
                Account
                <s:param name="tabId" value="${accountTab}"/>
            </s:link>
            <span>&raquo;</span>
        </li>
        <li data-nav-id="${editEmailTab}" class="${tabId eq editEmailTab ?'selected':''}">
            <s:link beanclass="com.hk.web.action.beta.account.MyAccountAction" event="pre">
                Edit Email
                <s:param name="tabId" value="${editEmailTab}"/>
            </s:link>
            <span>&raquo;</span></li>
        <li data-nav-id="${changePasswordTab}" class="${tabId eq changePasswordTab ?'selected':''}">
            <s:link beanclass="com.hk.web.action.beta.account.MyAccountAction" event="pre">
                Change Password
                <s:param name="tabId" value="${changePasswordTab}"/>
            </s:link>
            <span>&raquo;</span></li>
        <li data-nav-id="${addressesTab}" class="${tabId eq addressesTab ?'selected':''}">
            <s:link beanclass="com.hk.web.action.beta.account.MyAccountAddressAction" event="pre">
                Addresses
                <s:param name="tabId" value="${addressesTab}"/>
            </s:link>
            <span>&raquo;</span></li>
        <li data-nav-id="${ordersTab}" class="${tabId eq ordersTab ?'selected':''}">
            <s:link beanclass="com.hk.web.action.beta.account.MyAccountOrderHistoryAction" event="pre">
                Orders
                <s:param name="tabId" value="${ordersTab}"/>
            </s:link>
            <span>&raquo;</span>
        </li>
        <li data-nav-id="${reorderTab}" class="${tabId eq reorderTab ?'selected':''}">
            <s:link beanclass="com.hk.web.action.beta.account.MyAccountReorderAction" event="pre">
                Re-Orders
                <s:param name="tabId" value="${reorderTab}"/>
            </s:link>
            <span>&raquo;</span>
        </li>
        <li data-nav-id="${rewardPointsTab}" class="${tabId eq rewardPointsTab ?'selected':''}">
            <s:link beanclass="com.hk.web.action.beta.reward.RewardPointAction" event="pre">
                Reward Points
                <s:param name="tabId" value="${rewardPointsTab}"/>
            </s:link>
            <span>&raquo;</span>
        </li>
    </ul>
</s:layout-definition>