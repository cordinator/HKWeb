<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/store/diabetesWeek/diabetes.css"
      media="screen">

<s:layout-render name="/store/msGeneral.jsp">

<%
  boolean isSecure = WebContext.isSecure();
  pageContext.setAttribute("isSecure", isSecure);

  PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
  if (principal != null) {
    pageContext.setAttribute("user_hash", principal.getUserHash());
    pageContext.setAttribute("gender", principal.getGender());
    pageContext.setAttribute("orderCount", principal.getOrderCount());
  } else {
    pageContext.setAttribute("user_hash", "guest");
    pageContext.setAttribute("gender", null);
    pageContext.setAttribute("orderCount", null);
  }
%>



<s:layout-component name="msHeader">

</s:layout-component>

<s:layout-component name="msHeading">

</s:layout-component>
<!---- banner close --->



<s:layout-component name="msContent">
  <div class="wrapper">
    <div style="text-align: center; border-bottom: 1px solid #b4b4b4; padding-bottom:10px; margin-bottom: 30px; margin-top: 30px;">
      <a href="http://www.healthkart.com/"> <img src="<hk:vhostImage/>/store/diabetesWeek/images/HK-Logo.png"/></a>
    </div>

    <img class="mrgn-b-15" src="<hk:vhostImage/>/store/diabetesWeek/images/Daibetes-Banner.jpg"/>


  <div class="imgBorder">


    <div>
      <div class="float-l">
        <a href="http://www.healthkart.com/sv/abbott-glucerna-sr/SP-9938?navKey=VRNT-15446"><img src="<hk:vhostImage/>/store/diabetesWeek/images/abbottGlucerna.jpg"/></a>
      </div>
      <div class="float-l mrgn-l-14">
        <a href="http://www.healthkart.com/health-devices/blood-pressure/bp-monitors?navKey=SCT-hd-bpm&ac_sel=BP%20Monitors%20in%20Blood%20Pressure"><img src="<hk:vhostImage/>/store/diabetesWeek/images/omronGlucometer.jpg"/></a>
        <div class="cl"></div>
        <a href="http://www.healthkart.com/sv/accu-chek-integra-test-strips/SP-4383?navKey=VRNT-6825"><img class="mrgn-t-15" src="<hk:vhostImage/>/store/diabetesWeek/images/serichaDrink.jpg"/></a>
      </div>

    </div>
  <div class="cl"></div>

      <div class="mrgn-bt-15">
        <a href="http://www.healthkart.com/combo/accu-chek-half-century-combo/DC014?productReferrerId=12"><img class="float-l" src="<hk:vhostImage/>/store/diabetesWeek/images/accuChek.jpg"/></a>
        <a href="http://www.healthkart.com/sv/equinox-upper-arm-bp-monitor-%28eq-bp-101%29/SP-20588?navKey=VRNT-40990"><img class="mrgn-l-14" src="<hk:vhostImage/>/store/diabetesWeek/images/bpMonitor.jpg"/></a>
      </div>


  <div>

    <div class="float-l mrgn-r-13">
      <a href="http://www.healthkart.com/sv/bayer-contour-plus-blood-glucose-monitoring-system/SP-25339?navKey=VRNT-50009"><img class="mrgn-b-15" src="<hk:vhostImage/>/store/diabetesWeek/images/contourPlus.jpg"/></a>
      <div class="cl"></div>
      <a href="http://www.healthkart.com/sv/equinox-digital-weighing-scale-eb-eq-9300-%28black%29/SP-4516?navKey=VRNT-7023"><img src="<hk:vhostImage/>/store/diabetesWeek/images/equinoxWeighing.jpg"/></a>
      <a href="http://www.healthkart.com/vitamins-n-supplements/top-brands/healthviva?navKey=CL-920"><img class="mrgn-l-10" src="<hk:vhostImage/>/store/diabetesWeek/images/healthViva.jpg"/></a>


    </div>

    <div class="float-l">
      <a href="http://www.healthkart.com/sv/tonico-juice/SP-14587?navKey=VRNT-24645"><img src="<hk:vhostImage/>/store/diabetesWeek/images/onicoSlimming.jpg"/></a>
    </div>

  </div>


   </div>
  <div class="cl"></div>


</s:layout-component>

<s:layout-component name="msFooter">
  <s:layout-render name="/store/gosf/gosfFooter.jsp"/>
</s:layout-component>

<s:layout-component name="msScriptComponent">
  <script>
    $(document).ready(function () {

    });

  </script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
</s:layout-component>
</s:layout-render>