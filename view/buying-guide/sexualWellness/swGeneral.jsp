<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../includes/taglibInclude.jsp" %>
<s:layout-definition>
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <style>
      .bgMainCont{
        width: 100%;
      }



      @font-face
      {
        font-family: 'Open Sans'
      ;
        font-style: normal
      ;
        font-weight: 400
      ;
        src: local('Open Sans'), local('OpenSans'), url(http://themes.googleusercontent.com/licensed/font?kit=cJZKeOuBrn4kERxqtaUH3eQMgGoy_nKaqo2cKJRLrBJdxlT5RfGIy95sQWGkHIXZT_wDREvo4O6_6v9ljamcpjDjNODm32iLRYw2SNTAhDi20L9efk2PUOdb5H1Th4EY) format('woff2'), url(http://themes.googleusercontent.com/licensed/font?kit=cJZKeOuBrn4kERxqtaUH3Rfzzo0OiUYJdfKM9TmUas1dxlT5RfGIy95sQWGkHIXZT_wDREvo4O6_6v9ljamcpjDjNODm32iLRYw2SNTAhDi20L9efk2PUOdb5H1Th4EY) format('woff')
      ;
      }

      @font-face
      {
        font-family: 'Open Sans'
      ;
        font-style: normal
      ;
        font-weight: 600
      ;
        src: local('Open Sans Semibold'), local('OpenSans-Semibold'), url(http://themes.googleusercontent.com/licensed/font?kit=MTP_ySUJH_bn48VBG8sNSoQSOEeazGh8gh9HUNTvrRMFjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff2'), url(http://themes.googleusercontent.com/licensed/font?kit=MTP_ySUJH_bn48VBG8sNSjBj4j7RKzZd-IY3pDfmla0FjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff')
      ;
      }

      @font-face
      {
        font-family: 'Open Sans'
      ;
        font-style: normal
      ;
        font-weight: 700
      ;
        src: local('Open Sans Bold'), local('OpenSans-Bold'), url(http://themes.googleusercontent.com/licensed/font?kit=k3k702ZOKiLJc3WVjuplzIQSOEeazGh8gh9HUNTvrRMFjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff2'), url(http://themes.googleusercontent.com/licensed/font?kit=k3k702ZOKiLJc3WVjuplzDBj4j7RKzZd-IY3pDfmla0FjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff')
      ;
      }
    </style>
    <script type="text/javascript">
      var CONTEXT_ROOT = "${pageContext.request.contextPath}";
      var IMAGE_PATH = "<hk:vhostImage/>/assets";
    </script>
    <link rel="icon" href="/favicon.ico"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=EDGE"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=yes">

    <title>
        ${title}
    </title>
    <s:layout-component name="htmlHead"/>
    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/style.css"
          media="screen">
    <link rel="stylesheet" type="text/css"
          href="<hk:vhostCss/>/assets/css/jquery-ui.css"
          media="screen">
    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/grid.css"
          media="screen">
    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/assets/css/default.css"
          media="screen">


    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/handlebars.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/common.js"></script>
    <script>
      <%--this is to show "go to cart" message when someone clicks on add to cart button--%>
      $(document).ready(function() {
        $('.addToCart').click(function() {
          $(this).parent().append("<div>Go to <a href='${pageContext.request.contextPath}/beta/cart/Cart.action'>Cart</a></div>");
        });
      });
    </script>
    <s:layout-component name="htmlHead"/>
  </head>
  <body itemscope itemtype="http://schema.org/WebPage" data-spy="scroll" data-target="#NavBox">
  <s:layout-render name="/layouts/embed/tagManager.jsp"
                   pageType="buyingGuide"
                   primaryCategory="${primaryCategory}"
                   secondaryCategory="${secondaryCategory}"
                   tertiaryCategory="${tertiaryCategory}"
                   brand="${brand}"
                   variantId="${variantId}"
                   productId="${productId}"
                   variantOfferPrice="${variantOfferPrice}"
                   variantMrp="${variantMrp}"
                   variantDiscount="${variantDiscount}"
                   variantName="${variantName}"
                   variantImageM="${variantImageM}"
                   variantImageS="${variantImageS}"
                   oldVariantId="${oldVariantId}"
                   primaryMenu="${primaryMenu}"
                   secondaryMenu="${secondaryMenu}"
                   tertiaryMenu="${tertiaryMenu}"
                   navKey="${navKey}"
                   oos="${oos}"
                   breadCrumbs="${breadCrumbs}"
                   categoryBrowseNodeList="${categoryBrowseNodeList}"
                   canonicalUrl="${canonicalUrl}"
      />
  <div class="">



    <div id="bgMainCont">
      <s:layout-component name="bgContent">
      </s:layout-component>
    </div>





  </div>
  <s:layout-component name="bgScriptComponent"/>
  </body>
  </html>
</s:layout-definition>