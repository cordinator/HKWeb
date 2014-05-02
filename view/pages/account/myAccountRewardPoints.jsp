<%--
Created by IntelliJ IDEA.
User: Sachit
Date: 8/27/13
Time: 12:53 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.hk.common.constants.user.RoleConstants" %>
<%@ page import="com.hk.constants.rest.HKWebMessageConstants" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-render name="/templates/general.jsp">
    <s:useActionBean beanclass="com.hk.web.action.beta.reward.RewardPointAction" var="rewardPointAction"/>
    <c:set var="tabId" value="${rewardPointAction.tabId}"/>

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
                Reward Points
            </span>
        </div>
        <%--breadcrumbs ends--%>

        <%--unverified email Msg begins--%>
        <shiro:hasRole name="<%=RoleConstants.HK_UNVERIFIED%>">
            <div class="err-cntnr" id="actLinkDiv">
                <span class="icn-warning-small"></span>

                <div>
                    <ul>
                        <li>Your email id is not verified, kindly click on the link sent to your mail to apply offer
                            coupons.
                            <a class="txt-blue" href="javascript:void(0)" id="actLink"> Click here</a> to resend the
                            email.
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

            <h1 class="">Reward Points</h1>

            <span class="icn icn-sqre"></span>
        </div>

        <div class="row my-acnt-ht">
            <div class="span4">
                <s:layout-render name="/layouts/accountNavigationLayout.jsp" tabId="${tabId}"/>
            </div>
            <c:choose>
                <c:when test="${rewardPointAction.apiResponse eq false}">
                    <%=HKWebMessageConstants.ERROR%>
                </c:when>
                <c:otherwise>
                    <div class="span11 offset1">
                        <c:choose>
                            <c:when test="${rewardPointAction.rewardPointsList != null and fn:length(rewardPointAction.rewardPointsList)>0}">
                                <p class="fnt-sz14"> Total redeemable points: <span class="fnt-bold">${rewardPointAction.rewardPoints}</span></p>
                                <table class="table table-striped reward-tbl">
                                    <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Transaction</th>
                                        <th>Credit</th>
                                        <th>Debit</th>
                                        <th>Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${rewardPointAction.rewardPointsList}" var="rewardPtsList"
                                               varStatus="ctr">
                                        <tr>
                                            <td>
                                                <fmt:formatDate value="${rewardPtsList.txnDate}"/>


                                            </td>
                                            <td>${rewardPtsList.gatewayOrderId}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${rewardPtsList.creditAmount != null}">
                                                        ${rewardPtsList.creditAmount}
                                                    </c:when>
                                                    <c:otherwise>
                                                        -
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${rewardPtsList.debitAmount != null}">
                                                        ${rewardPtsList.debitAmount}
                                                    </c:when>
                                                    <c:otherwise>
                                                        -
                                                    </c:otherwise>
                                                </c:choose>

                                            </td>
                                            <td>${rewardPtsList.status}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <c:if test="${!(rewardPointAction.perPage > fn:length(rewardPointAction.rewardPointsList))}">
                                <div class="load-more-cntnr">
                                    <a href="javascript:void(0)" data-perPage="${rewardPointAction.perPage} "
                                       data-pageNo="${rewardPointAction.pageNo}" class="btn btn2 btn-gray"
                                       id="loadMore">Load More</a>
                                </div>
                                </c:if>
                            </c:when>
                            <c:otherwise>
                                <%=HKWebMessageConstants.REWARD_POINTS_NOT_AVAILABLE%>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </s:layout-component>
    <s:layout-component name="scriptComponent">
        <script type="text/javascript">
            $(document).ready(function () {
                $('[data-tab-id=${addressAction.tabId}]').show();
                function getMonthName(datestring){
                    var myDateAsString = datestring;
                    var d = new Date(myDateAsString);
                    var monthNames = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ];
                    var month = monthNames[d.getMonth()];
                    var date =  d.getDate();
                    var year =  d.getFullYear();
                    var formattedDate =  month + " " + date + ", " + year;
                    /*console.log(formattedDate);*/
                    return formattedDate;
                }
                $('#loadMore').click(function () {
                    var currEle = $(this);
                    HK.element.loader.add(currEle, true);
                    var perPage = $('#loadMore').attr('data-perPage');
                    var pageNo = $('#loadMore').attr('data-pageNo');
                    var pageNoVal = parseInt(pageNo);
                    pageNoVal = pageNoVal + 1;
                    $('#loadMore').attr('data-pageNo', pageNoVal);
                    var rewardPointsTemplateHTML = $('#reward-pts-view').html();
                    var rewardTemplate = Handlebars.compile(rewardPointsTemplateHTML);
                    HK.Ajax.getJson(
                            HK.urls.rewardPoint + "?pageNo=" + pageNoVal + "&perPage=" + perPage,
                            function (responseData) {
                                var exceptionChk =responseData.results.exception;
                                var arrayList = responseData.results.rwdPts;
                                if (exceptionChk == true ){
                                    HK.alert({title: 'Alert!', content: 'We are sorry. Please try again.', theme: HK.POPUP.THEME.ALERT});
                                    HK.element.loader.remove(currEle, true);
                                }
                                else{
                                    if (arrayList.length != 0) {
                                        for (var i = 0, len = arrayList.length; i < len; i++) {
                                            arrayList[i].txn_dt = getMonthName(arrayList[i].txn_dt);
                                            var html = rewardTemplate(arrayList[i]);
                                            $('.reward-tbl tbody').append(html);
                                        }
                                        if(perPage > arrayList.length){
                                            HK.element.disable(currEle);
                                            currEle.attr('id', '').removeClass('btn2').html('No more results!').off('click');
                                            HK.element.loader.remove(currEle, true);
                                        }else{
                                            HK.element.loader.remove(currEle, true);
                                        }
                                    }
                                    else{
                                        HK.element.disable(currEle);
                                        currEle.attr('id', '').removeClass('btn2').html('No more results!').off('click');
                                        HK.element.loader.remove(currEle, true);
                                        //HK.alert({title: 'Alert!', content: 'No more reward points available for your account.', theme: HK.POPUP.THEME.ALERT});
                                    }
                                }

                            }, ""
                    )
                });
            });
        </script>
        <script id="reward-pts-view" type="text/x-handlebars-template">
            <tr>
                <td>{{txn_dt}}</td>
                <td>{{gId}}</td>
                <td>
                    {{#if crdt_amnt}}
                    {{crdt_amnt}}
                    {{else}}
                    -
                    {{/if}}
                </td>
                <td>

                    {{#if dbt_amnt}}
                    {{dbt_amnt}}
                    {{else}}
                    -
                    {{/if}}
                </td>
                <td>{{status}}</td>
            </tr>
        </script>
    </s:layout-component>
</s:layout-render>