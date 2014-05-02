<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
    <html>
    <head>
        <title>${title}</title>

        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
        <script src="scripts/expand.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(function() {
                $("#content h3.expand").toggler();

            });
        </script>
    </head>
    <body>

    <!-- wrapper -->
    <div class="wrapper">

        <s:layout-component name="header">
            <jsp:include page="nicoretteHeader.jsp"/>
        </s:layout-component>


        <!-- container -->
        <div class="container">
            <s:layout-component name="content"></s:layout-component>
        </div>
        <!-- /container -->

        <!-- footer -->
        <div class="footer clearfix">
            <s:layout-component name="footer">
                <jsp:include page="nicoretteFooter.jsp"/>
            </s:layout-component>
        </div>
        <!-- /footer -->
    </div>
    <!-- /wrapper -->

    </body>
    </html>
</s:layout-definition>