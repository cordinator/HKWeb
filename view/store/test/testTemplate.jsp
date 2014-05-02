<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
    <html>
    <head>
        <title>${title}</title>
        <link rel="stylesheet" href="<hk:vhostCss/>/store/nicorette/css/style.css" type="text/css" media="screen">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script src="<hk:vhostJs/>/store/nicorette/scripts/expand.js" type="text/javascript"></script>
    </head>
    <body>

    <div class="wrapper">
        <s:layout-component name="header">
            <s:layout-render name="/store/test/testHeader.jsp"/>
        </s:layout-component>
    </div>

    <div class="grid_16">
        <s:layout-component name="content"></s:layout-component>
    </div>

    <div>
        <s:layout-component name="footer">
            <jsp:include page="testFooter.jsp"/>
        </s:layout-component>
    </div>

    </body>
    </html>
</s:layout-definition>
