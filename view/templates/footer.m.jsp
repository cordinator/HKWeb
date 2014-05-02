<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
    <%
        StringBuilder reqUrl = new StringBuilder(request.getContextPath());
        reqUrl.append("?");
        String queryString = request.getQueryString();
        if (queryString != null) {
            reqUrl.append(queryString);
            reqUrl.append("&");
        }
        reqUrl.append("view=desktop");
        pageContext.setAttribute("pageURL", reqUrl);

    %>
    <div class="footer">
        <div class="tcenter"><s:link beanclass="com.hk.web.action.beta.hk.ContactUsAction">Contact</s:link>
            <a class="" href="#">account</a>
            <a class="" href="http://www.healthkart.com/beta/hk/FAQ.action">faqs</a>
            <a class="" href="${pageURL}">View Full Site</a></div>
        <div class="tcenter grey_text font12">© 2011-2013, healthkart.com</div>
    </div>

    <div class="go-to-top-cntnr">
        <a href="javascript:void(0)" title="Back to Top" class="go-to-top cont-rht hide"></a>
    </div>
    <span class=" bold" style="visibility:hidden"></span>
</s:layout-definition>