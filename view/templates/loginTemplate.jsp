<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibInclude.jsp" %>
<s:layout-definition>
  <!DOCTYPE html>
  <html>
  <head>
    <title>
      Login or SignUp to HealthKart.com | HealthKart.com
    </title>
    <s:layout-component name="htmlHead"/>
      <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/default.css" media="screen"/>
      <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-1.9.1.js"></script>
  </head>
  <body>
  <div class="wrapper">
  <s:layout-component name="modal"/>

  <s:layout-component name="header">
  </s:layout-component>

  <h1><s:layout-component name="heading"/></h1>
  <s:layout-component name="content">
  </s:layout-component>
  <s:layout-component name="scriptComponent"/>
  <div id="footer">
     <s:layout-render name="/templates/footer.jsp"/>
  </div>
  </div>
  </body>
  </html>
</s:layout-definition>