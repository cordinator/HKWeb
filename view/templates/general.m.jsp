<%@ page import="com.hk.common.constants.EnvConstants" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibInclude.jsp" %>
<s:layout-definition>
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <%@include file='_frontEndLogging.jsp' %>

      <script type="text/javascript">
      var CONTEXT_ROOT = "${pageContext.request.contextPath}";
      var IMAGE_PATH = "<hk:vhostImage/>/assets";
    </script>
      <meta name="mobileoptimized" content="0" />
     <link rel="icon" href="/favicon.ico" />
      <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <meta charset="utf-8"/>
   <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="description" content="${seoData.metaDescription}"/>
    <meta name="keywords" content="${seoData.metaKeyword}"/>

    <link href="<hk:vhostCss/>/assets/css/common.m.css?v=0.11" media="screen" rel="stylesheet" type="text/css">

 <script type="text/javascript" src="<hk:vhostJs/>/assets/js/common.m.js"></script>
 <%-- <script type="text/javascript" src="<hk:vhostJs/>/assets/js/swipe.m.js"></script> --%>
 
    <%-- <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/jquery-ui.min.js"></script> --%>
   <%-- <script type="text/javascript" src="<hk:vhostJs/>/assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/handlebars.js"></script>
    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/handlebarsCommon.js"></script>
     --%>
    <%--  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/devJs/common.m.js"></script> --%>
    
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
    <s:layout-component name="htmlHead"/>
      <%--css start--%>

      <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ui/jquery.ui.all.css"
      media="screen">--%>
    
      <%--js start--%>
      <!-- Start Visual Website Optimizer Asynchronous Code -->
      <script type='text/javascript'>
          var _vwo_code=(function(){
              var account_id=61646,
                      settings_tolerance=2000,
                      library_tolerance=2500,
                      use_existing_jquery=false,
// DO NOT EDIT BELOW THIS LINE
                      f=false,d=document;return{use_existing_jquery:function(){return use_existing_jquery;},library_tolerance:function(){return library_tolerance;},finish:function(){if(!f){f=true;var a=d.getElementById('_vis_opt_path_hides');if(a)a.parentNode.removeChild(a);}},finished:function(){return f;},load:function(a){var b=d.createElement('script');b.src=a;b.type='text/javascript';b.innerText;b.onerror=function(){_vwo_code.finish();};d.getElementsByTagName('head')[0].appendChild(b);},init:function(){settings_timer=setTimeout('_vwo_code.finish()',settings_tolerance);this.load('//dev.visualwebsiteoptimizer.com/j.php?a='+account_id+'&u='+encodeURIComponent(d.URL)+'&r='+Math.random());var a=d.createElement('style'),b='body{opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important;}',h=d.getElementsByTagName('head')[0];a.setAttribute('id','_vis_opt_path_hides');a.setAttribute('type','text/css');if(a.styleSheet)a.styleSheet.cssText=b;else a.appendChild(d.createTextNode(b));h.appendChild(a);return settings_timer;}};}());_vwo_settings_timer=_vwo_code.init();
      </script>
      <!-- End Visual Website Optimizer Asynchronous Code -->
  </head>
  <body itemscope itemtype="http://schema.org/WebPage" data-spy="scroll" data-target="#NavBox" <%--data-offset="10"--%>>
  <s:layout-render name="/layouts/embed/tagManager.jsp"
                   pageType="${pageType}"
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
                   svTags="${svTags}"
                   cTags="${cTags}"
                   bTags="${bTags}"
                   cTagList="${cTagList}"
                   bTagList="${bTagList}"
      />
  <noscript>
      <div class="js-disble-cntnr">For a better experience on Healthkart, Please enable JavaScript in your browser.</div>
  </noscript>
	<div class="mask" onclick="toggleMenu(event)" style="display: none;"> </div>
  <div class="main-wrapper">
    <s:layout-component name="modal"/>

    <s:layout-component name="header">

      <div id="header">
        <c:if test="${showOldHKLink eq true}">
        </c:if>
        <c:if test="${type == null || type == ''}">
          <s:layout-render name="/templates/header.m.jsp" showMenu="${showMenu}"/>
        </c:if>
        <c:if test="${type == 'login'}">
          <s:layout-render name="/templates/header.m.jsp"/>
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
            <s:layout-render name="/templates/footer.m.jsp"/>
          </div>
        </c:if>
    </s:layout-component>
  </div>
  <s:layout-component name="scriptComponent"/>
  </body>
  </html>
</s:layout-definition>
