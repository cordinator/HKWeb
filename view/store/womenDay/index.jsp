<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/store/womenDay/women.css"
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
      <a href="http://www.healthkart.com/"> <img src="<hk:vhostImage/>/store/womenDay/images/HK-Logo.png"/></a>
    </div>

    <img class="mrgn-b-15" src="<hk:vhostImage/>/store/womenDay/images/womens-day.jpg"/>

    <div>
      <div class="float-l">
        <a href="http://www.healthkart.com/women-care/safety-n-hygiene/intimate-care?navKey=CL-554&catPrefix=pc-ic~hd-brs"><img src="<hk:vhostImage/>/store/womenDay/images/IntimateCare.jpg"/></a>
      </div>
      <div class="float-l mrgn-l-15">
        <a href="http://www.healthkart.com/women-care/safety-n-hygiene/self-defence?navKey=CL-515&catPrefix=pc-sd~&brands=161~677~"><img src="<hk:vhostImage/>/store/womenDay/images/PepperSpray.jpg"/></a>
        <a href="http://www.healthkart.com/fitness/muscle-building-equipments/dumbells-n-weights?navKey=CL-609&itracker=w:cmenu%7C;p:3%7C;c:dumbells-n-weights%7C"><img class="mrgn-l-10" src="<hk:vhostImage/>/store/womenDay/images/Dumbbells.jpg"/></a>
        <div class="cl"></div>
        <a href="http://www.healthkart.com/beauty?navKey=CP-bty"><img class="mrgn-t-15" src="<hk:vhostImage/>/store/womenDay/images/Perfectwomen.jpg"/></a>
      </div>

    </div>
  <div class="cl"></div>

      <div class="mrgn-bt-15">
        <a href="http://www.healthkart.com/personal-n-baby-care/vision-care/sunglasses?navKey=CL-418&catPrefix=eye-sg~&brands=&fl=sg-ftr-ideal:unisex,women,;&perPage=24&sortBy=DISC&sortType=DESC"><img class="float-l" src="<hk:vhostImage/>/store/womenDay/images/Sunglass.jpg"/></a>
        <a href="http://www.healthkart.com/vitamins-n-supplements/shop-by-usage/womens-health?navKey=CL-912&catPrefix=hnut-wohea~hnut-calwo~hnut-aywh~hnut-iron~hnut-sexw~hnut-seww~hnut-mulw~hnut-herwh~&brands=&fl=&perPage=24&sortBy=RANK&sortType=ASC&&excludeOOS=true"><img class="mrgn-l-14" src="<hk:vhostImage/>/store/womenDay/images/healthsupplement.jpg"/></a>
      </div>


  <div>

    <div class="float-l mrgn-r-13">
      <a href="http://www.healthkart.com/beauty/make-up?navKey=CL-446&catPrefix=bt-liplnr~bt-mu-nl~bt-nlplsh~byt-new-fc~bt-mu-e~bt-eylash~bt-nptrt~bt-mirror~bt-twzr~bt-sndr~bt-nptls~bt-mu-rmv~arti~bt-pwdr~bt-mu-wps~bt-eycrlr~bt-eyshdw~bt-cnclr~bt-brshap~bt-othr~bt-mu~bt-mu-bdy~bt-eyelnr~bt-prmr~bt-blush~bt-mscra~bt-mkup~sticker-nai~bt-lpstk~ink-nail~bt-lpgls~bt-fndtn~art-nail~bt-mu-kit~bt-hgltr~bt-mu-l~bt-kohl~bt-eyebrw~bt-nprmv~&brands=633~&fl=&perPage=24&sortBy=DISC&sortType=DESC&&itracker=w:bnr%7Cbty%7CONE%7C;p:3%7C;c:nyx-upto-40-off!%7C;"><img class="mrgn-b-15" src="<hk:vhostImage/>/store/womenDay/images/Nyxmakeup.jpg"/></a>
      <div class="cl"></div>
      <a href="http://www.healthkart.com/fitness/muscle-building-equipments/ankle-n-wrist-weights?navKey=CL-611&catPrefix=spt-fw-aw~&brands=&fl=&perPage=24&sortBy=RANK&sortType=ASC&minPrice=185.0&maxPrice=2124.0&"><img src="<hk:vhostImage/>/store/womenDay/images/weightedclothings.jpg"/></a>
      <a href="http://www.healthkart.com/fitness/weight-loss-equipments/fitness-n-yoga-mats?navKey=CL-596&catPrefix=spt-anc-fm~&brands=&fl=&perPage=24&sortBy=RANK&sortType=ASC&minPrice=255.0&maxPrice=6503.0&"><img class="mrgn-l-10" src="<hk:vhostImage/>/store/womenDay/images/Yoga.jpg"/></a>


    </div>

    <div class="float-l">
      <a href="http://www.healthkart.com/parenting/feeding-n-nursing/breast-feeding-aids/breast-pumps?navKey=SCT-bb-bp&catPrefix=bb-bp~&sortBy=PRC&sortType=DESC"><img src="<hk:vhostImage/>/store/womenDay/images/BreastPump.jpg"/></a>
    </div>

  </div>
  <div class="cl"></div>

  <a href="http://www.healthkart.com/buying-guide/womenHealth/index.jsp"><img class="mrgn-bt-15" src="<hk:vhostImage/>/store/womenDay/images/womenshealth.jpg"/></a>




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