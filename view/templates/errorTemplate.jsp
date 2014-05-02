<%@ page import="com.hk.constants.marketing.TagConstants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibInclude.jsp" %>
<s:layout-definition>
  <!DOCTYPE html>
  <html lang="en">
  <head>
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
    <link rel="shortcut icon" href="<hk:vhostImage/>/assets/images/favicon.ico" />
    <title>${pageTitle}</title>
    <s:layout-component name="htmlHead"/>
      <%--css start--%>
    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/bootstrap.css"
          media="screen">
    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/default.css"
          media="screen">
      <%--css finish--%>
  </head>
  <body>
  <s:layout-render name="/layouts/embed/tagManager.jsp"
                   pageType="error"
                   errorCode="${errorCode}"
      />
  <div class="wrapper">
    <s:layout-component name="header">
      <div id="header">
        <s:layout-render name="/templates/errorHeader.jsp"/>
      </div>
    </s:layout-component>
    <s:layout-component name="content">
    </s:layout-component>

    <s:layout-component name="footer">
      <div id="footer">
        <s:layout-render name="/templates/errorFooter.jsp"/>
      </div>
    </s:layout-component>
  </div>
  </body>
  </html>
</s:layout-definition>