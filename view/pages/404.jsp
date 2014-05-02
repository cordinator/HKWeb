<%@include file="/includes/taglibInclude.jsp" %>
<%@ page isErrorPage="true" %>
<s:layout-render name="/templates/errorTemplate.jsp" pageTitle="Error 404 | Healthkart" errorCode="404">
  <s:layout-component name="content">
    <div class="container clearfix">
        <div class="row mrgn-bt-50">
            <div class="span8 left-404-msg">
                <div class="msg1">error</div>
                <div class="msg2">404</div>
            </div>
            <div class="span7 offset1 right-404-msg mrgn-t-20">
                <p>This page is like Santa.</p>
                <p>Doesn't exist.</p>
                <p>Sorry :(</p>
            </div>
        </div>
    </div>
  </s:layout-component>
</s:layout-render>