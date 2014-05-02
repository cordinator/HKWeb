<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/includes/taglibInclude.jsp" %>
<s:layout-definition>
  <script type="text/javascript">
    var google_tag_params = {
      pageType: '${pageType}',
      pId: '${productId}',
      vId: '${variantId}',
      oldVId:'${oldVariantId}',
      g: '${gender}',
      pCat: '${primaryCategory}',
      sCat: '${secondaryCategory}',
      tCat: '${tertiaryCategory}',
      allCats: '',
      brand: '${brand}',
      pName: '${productName}',
      vName:'${variantName}',
      hkp: '${hkPrice}',
      mrp: '${mrp}',
      stock: '${stock}',
      orderCount:'${orderCount}',
      pMenu:'${primaryMenu}',
      sMenu:'${secondaryMenu}',
      tMenu:'${tertiaryMenu}'
    };

  </script>

  <c:if test="${fn:containsIgnoreCase(primaryCategory, 'sports-nutrition') || fn:containsIgnoreCase(primaryMenu, 'sports-nutrition') or fn:containsIgnoreCase(primaryCategory, 'health-nutrition') or fn:containsIgnoreCase(primaryMenu, 'health-nutrition')}">
    <%-- Nutrition account new remarketing tag --%>
    <s:layout-render name="/layouts/embed/_remarketingCodeAdwords.jsp" id="980691662"/>
  </c:if>

  <c:if test="${fn:containsIgnoreCase(primaryCategory, 'beauty') or fn:containsIgnoreCase(primaryMenu, 'beauty')}">
    <%-- Beauty account new remarketing tag --%>
    <s:layout-render name="/layouts/embed/_remarketingCodeAdwords.jsp" id="949650175"/>
  </c:if>

  <c:if test="${fn:containsIgnoreCase(primaryCategory, 'diabetes') or fn:containsIgnoreCase(primaryMenu, 'diabetes')}">
    <%-- Diabetes account new remarketing tag --%>
    <s:layout-render name="/layouts/embed/_remarketingCodeAdwords.jsp" id="1009959035"/>
  </c:if>

  <c:if test="${fn:containsIgnoreCase(primaryCategory, 'health-devices') or fn:containsIgnoreCase(primaryMenu, 'health-devices')}">
    <%-- Health Devices account new remarketing tag --%>
    <s:layout-render name="/layouts/embed/_remarketingCodeAdwords.jsp" id="949530774"/>
  </c:if>

  <c:if test="${fn:containsIgnoreCase(primaryCategory, 'home-living') or fn:containsIgnoreCase(primaryMenu, 'home-living')}">
    <%-- Home Living account new remarketing tag --%>
    <s:layout-render name="/layouts/embed/_remarketingCodeAdwords.jsp" id="990452499"/>
  </c:if>

  <c:if test="${fn:containsIgnoreCase(primaryCategory, 'personal-care') or fn:containsIgnoreCase(primaryMenu, 'personal-care')}">
    <%-- Personal Care account new remarketing tag --%>
    <s:layout-render name="/layouts/embed/_remarketingCodeAdwords.jsp" id="1009976885"/>
  </c:if>

  <c:if test="${fn:containsIgnoreCase(primaryCategory, 'sports') or fn:containsIgnoreCase(primaryMenu, 'sports')}">
    <%-- Sports Care account new remarketing tag --%>
    <s:layout-render name="/layouts/embed/_remarketingCodeAdwords.jsp" id="1008616035"/>
  </c:if>


  <%-- DYPLA / dynamic remarketing account new remarketing tag --%>
  <s:layout-render name="/layouts/embed/_remarketingCodeAdwords.jsp" id="988370835"/>
  <%-- Brand account new remarketing tag --%>
  <%--<s:layout-render name="/layouts/embed/_remarketingCodeAdwords.jsp" id="1018305592"/>--%>
  <%-- aqua bright hk common new remarketing tag --%>
  <s:layout-render name="/layouts/embed/_remarketingCodeAdwords.jsp" id="981492453"/>

  <%-- Script for Facebook Retargeting --%>
	<script type="text/javascript">
	adroll_adv_id = "SKDGP6YYENHVJCJDIKHUF7";
	adroll_pix_id = "JLZMDLGRYBFDFHEIKFE456";
	(function () {
	var oldonload = window.onload;
	window.onload = function(){
	   __adroll_loaded=true;
	   var scr = document.createElement("script");
	   var host = (("https:" == document.location.protocol) ? "https://s.adroll.com" : "http://a.adroll.com");
	   scr.setAttribute('async', 'true');
	   scr.type = "text/javascript";
	   scr.src = host + "/j/roundtrip.js";
	   ((document.getElementsByTagName('head') || [null])[0] ||
	    document.getElementsByTagName('script')[0].parentNode).appendChild(scr);
	   if(oldonload){oldonload()}};
	}());
	</script>

</s:layout-definition>
