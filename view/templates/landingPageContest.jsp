<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibInclude.jsp" %>
<s:layout-definition>
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta name="viewport" content="width=device-width"/>
      <meta name="mobileoptimized" content="0" />
    <link rel="canonical" href="${canonicalUrl}" />
    <style>
        @font-face {
            font-family: 'Open Sans';
            font-style: normal;
            font-weight: 400;
            src: local('Open Sans'), local('OpenSans'), url(http://themes.googleusercontent.com/licensed/font?kit=cJZKeOuBrn4kERxqtaUH3eQMgGoy_nKaqo2cKJRLrBJdxlT5RfGIy95sQWGkHIXZT_wDREvo4O6_6v9ljamcpjDjNODm32iLRYw2SNTAhDi20L9efk2PUOdb5H1Th4EY) format('woff2'), url(http://themes.googleusercontent.com/licensed/font?kit=cJZKeOuBrn4kERxqtaUH3Rfzzo0OiUYJdfKM9TmUas1dxlT5RfGIy95sQWGkHIXZT_wDREvo4O6_6v9ljamcpjDjNODm32iLRYw2SNTAhDi20L9efk2PUOdb5H1Th4EY) format('woff');
        }

        @font-face {
            font-family: 'Open Sans';
            font-style: normal;
            font-weight: 600;
            src: local('Open Sans Semibold'), local('OpenSans-Semibold'), url(http://themes.googleusercontent.com/licensed/font?kit=MTP_ySUJH_bn48VBG8sNSoQSOEeazGh8gh9HUNTvrRMFjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff2'), url(http://themes.googleusercontent.com/licensed/font?kit=MTP_ySUJH_bn48VBG8sNSjBj4j7RKzZd-IY3pDfmla0FjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff');
        }

        @font-face {
            font-family: 'Open Sans';
            font-style: normal;
            font-weight: 700;
            src: local('Open Sans Bold'), local('OpenSans-Bold'), url(http://themes.googleusercontent.com/licensed/font?kit=k3k702ZOKiLJc3WVjuplzIQSOEeazGh8gh9HUNTvrRMFjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff2'), url(http://themes.googleusercontent.com/licensed/font?kit=k3k702ZOKiLJc3WVjuplzDBj4j7RKzZd-IY3pDfmla0FjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff');
        }
    </style>
    <script type="text/javascript">
      var CONTEXT_ROOT = "${pageContext.request.contextPath}";
      var IMAGE_PATH = "<hk:vhostImage/>/assets";
    </script>
      <link rel="icon" href="/favicon.ico" />
      <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <meta charset="utf-8"/>
      <meta http-equiv="X-UA-Compatible" content="IE=EDGE" />

    <meta name="description" content="${seoData.metaDescription}"/>
    <meta name="keywords" content="${seoData.metaKeyword}"/>

    <title>
      <c:choose>
        <c:when test="${fn:length(seoData.title) > 0}">
          ${seoData.title}
        </c:when>
        <c:when test="${fn:length(pageTitle)>0}">
          ${pageTitle}
        </c:when>
        <c:otherwise>
          | HealthKart.com
        </c:otherwise>
      </c:choose>
    </title>
      <%--css start--%>

      <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ui/jquery.ui.all.css"
      media="screen">--%>
    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/bootstrap.css"
          media="screen">

    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/style.css"
          media="screen">
    <link rel="stylesheet" type="text/css"
          href="<hk:vhostCss/>/assets/css/jquery-ui.css"
          media="screen">

      <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/jquery.jscrollpane.css"
      media="screen">--%>
    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/grid.css"
          media="screen">
      <%--<link rel="stylesheet" type="text/css"
     href="${pageContext.request.contextPath}/assets/css/jquery.ui.autocomplete.css" media="all"/>--%>
      <%--css finish--%>
    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/default.css"
          media="screen">
      <%--js start--%>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/handlebars.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js"></script>
      <%--<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.jscrollpane.js"></script>--%>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/common.js?v=1.3"></script>
      <%--js finish--%>
    <s:layout-component name="htmlHead"/>
  </head>
  <body itemscope itemtype="http://schema.org/WebPage" data-spy="scroll" data-target="#NavBox" <%--data-offset="10"--%>>
  <s:layout-render name="/layouts/embed/tagManager.jsp"
                   pageType="contest"
      />
  <noscript>
      <div class="js-disble-cntnr">For a better experience on Healthkart, Please enable JavaScript in your browser.</div>
  </noscript>

  <div class="wrapper">
    <s:layout-component name="modal"/>

    <s:layout-component name="header">

      <div id="header">
        <c:if test="${showOldHKLink eq true}">
          <div class="link-cntnr">
            <a href="http://www.healthkart.com"  title="go to old website" >
              <img src="<hk:vhostImage/>/assets/images/new-site-strip.png" width="960" height="25" alt="go to old website"/>
            </a>
          </div>
        </c:if>
        <c:if test="${type == null || type == ''}">
          <s:layout-render name="/templates/header.jsp" showMenu="${showMenu}"/>
        </c:if>
        <c:if test="${type == 'login'}">
          <s:layout-render name="/templates/loginHeader.jsp"/>
        </c:if>
        <c:if test="${type == 'paymentFlow'}">
          <s:layout-render name="/templates/headerPaymentFlow.jsp"/>
        </c:if>
      </div>
    </s:layout-component>
    <!--h1><s:layout-component name="heading"/></h1-->
    <s:layout-component name="content">
    </s:layout-component>

    <s:layout-component name="footer">
        <c:if test="${showFooter== null || showFooter == '' || showFooter == 'yes'}">
          <div id="footer">
            <s:layout-render name="/templates/footer.jsp"/>
          </div>
        </c:if>
    </s:layout-component>
  </div>
  <s:layout-component name="scriptComponent"/>
  </body>
  </html>
</s:layout-definition>