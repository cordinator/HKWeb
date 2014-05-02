<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

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
    <s:layout-render name="/store/gosf/gosfHeader.jsp"/>
  </s:layout-component>

  <s:layout-component name="msHeading">

    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">
    <div class="wrapper gosfExclu">
      <span class="gosfH1">Exclusive on HealthKart</span>

      <a href="http://www.healthkart.com/sv/airance-automatic-air-freshener-dispenser-and-refill/SP-23474?navKey=VRNT-45251"><img src="<hk:vhostImage/>/assets/images/gosf/Airance-automatic-air-freshner.jpg" /></a>
      <a href="http://www.healthkart.com/sv/beurer-shiatsu-massage-chair-%28mg310%29/SP-2787?navKey=VRNT-3887"><img src="<hk:vhostImage/>/assets/images/gosf/Beurer-Shiatsu-Chair.jpg" /></a>
      <a href="http://www.healthkart.com/sv/bremed-rotatable-ultrasonic-humidifier/SP-15821?navKey=VRNT-36336"><img src="<hk:vhostImage/>/assets/images/gosf/Bremed-rotatable-ultrasonic.jpg" /></a>
      <a href="http://www.healthkart.com/sv/chicco-hot-humidifier-humi-relax/SP-1903?navKey=VRNT-2924"><img src="<hk:vhostImage/>/assets/images/gosf/chicco-hot-humidifiers.jpg" /></a>
      <a href="http://www.healthkart.com/sv/eureka-forbes-trendy-xeon-vacuum-cleaner/SP-16393?navKey=VRNT-36558"><img src="<hk:vhostImage/>/assets/images/gosf/Eureka-forbes-trendy-xeon-vacuum.jpg" /></a>
      <a href="http://www.healthkart.com/sv/facemate-dual-wave-ultrasonic-face-massager/SP-4166?navKey=VRNT-6554"><img src="<hk:vhostImage/>/assets/images/gosf/facemate-dual-wave-ultrasonic.jpg" /></a>
      <a href="http://www.healthkart.com/sv/healthline-leg-foot-massager%28fm-11%29-green/SP-18811?navKey=VRNT-38341"><img src="<hk:vhostImage/>/assets/images/gosf/Healthline-leg-foot-Massager.jpg" /></a>
      <a href="http://www.healthkart.com/sv/homedics-shiatsu-massage-cushion-heat-nvibrator-mcs-300ha/SP-6834?navKey=VRNT-9971"><img src="<hk:vhostImage/>/assets/images/gosf/Homedics-shiatsu.jpg" /></a>
      <a href="http://www.healthkart.com/sv/jsb-hf25-neck-and-shoulder-tapping-massager/SP-17887?navKey=VRNT-37553"><img src="<hk:vhostImage/>/assets/images/gosf/JSB-neck-and-shoulder.jpg" /></a>
      <a href="http://www.healthkart.com/sv/jsb-hf12-oxygen-and-blood-circulation-massager/SP-20619?navKey=VRNT-41034"><img src="<hk:vhostImage/>/assets/images/gosf/JSB-oxygen-and-blood-massager.jpg" /></a>
      <a href="http://www.healthkart.com/sv/morphy-richards-steam-mob-%28with-demo-cd%29-vacuum-cleaner/SP-18110?navKey=VRNT-37730"><img src="<hk:vhostImage/>/assets/images/gosf/Morphy-Richards-Steam-mob-vacuum.jpg" /></a>
      <a href="http://www.healthkart.com/sv/philips-hd8753-83-intelia-automatic-espresso-machine/SP-23779?navKey=VRNT-45764"><img src="<hk:vhostImage/>/assets/images/gosf/Philips-intelia-automatic.jpg" /></a>
      <a href="http://www.healthkart.com/sv/philips-hd8325-01-manual-espresso-machine/SP-23762?navKey=VRNT-45746"><img src="<hk:vhostImage/>/assets/images/gosf/philips-manual-espresso.jpg" /></a>
      <a href="http://www.healthkart.com/sv/philips-fc6130-01-vacuum-cleaner/SP-18752?navKey=VRNT-38328"><img src="<hk:vhostImage/>/assets/images/gosf/philips-vacuum-cleaner.jpg" /></a>

      <a href="http://www.healthkart.com/sv/adidas-dual-grip-medicine-ball/SP-12360?navKey=VRNT-19809"><img src="<hk:vhostImage/>/assets/images/gosf/Adidas-Dual-Grip-Medicine-Ball.jpg" /></a>
      <a href="http://www.healthkart.com/sv/emmi-dent-6-ultra-sonic-toothbrush/SP-16388?navKey=VRNT-36553"><img src="<hk:vhostImage/>/assets/images/gosf/Emmident.jpg" /></a>
      <a href="http://www.healthkart.com/sv/inalsa-maxi-cream-coffee-maker/SP-17828?navKey=VRNT-37495"><img src="<hk:vhostImage/>/assets/images/gosf/Inalsa-Maxi-Cream-Coffee.jpg" /></a>
      <a href="http://www.healthkart.com/sv/iso-solid-adjustable-kettlebell/SP-19756?navKey=VRNT-39709"><img src="<hk:vhostImage/>/assets/images/gosf/ISO-Solid-Adjustable-Kettlebell.jpg" /></a>
      <a href="http://www.healthkart.com/sv/manufaktura-bath-n-body-oil/SP-3518?navKey=VRNT-35354"><img src="<hk:vhostImage/>/assets/images/gosf/Manufactura-Bath-and-Body-oil.jpg" /></a>
      <a href="http://www.healthkart.com/sv/manufaktura-sensuous-mediterranean-spa-cologne/SP-7989?navKey=VRNT-35314"><img src="<hk:vhostImage/>/assets/images/gosf/Manufactura-sensuous-mediterranian-spa-cologne.jpg" /></a>
      <a href="http://www.healthkart.com/sv/morphy-richards-europa-espresso-cappuccino--coffee-maker/SP-18050?navKey=VRNT-37668"><img src="<hk:vhostImage/>/assets/images/gosf/Morphy-Richards-Europa-Espresso.jpg" /></a>
      <a href="http://www.healthkart.com/sv/powerblock-power-block-sport-9.0-%28pair%29/SP-12900?navKey=VRNT-21033"><img src="<hk:vhostImage/>/assets/images/gosf/Power-block-block-sport.jpg" /></a>
      <a href="http://www.healthkart.com/sv/power-block-sport-ib-s50-dumbbell/SP-20209?navKey=VRNT-40340"><img src="<hk:vhostImage/>/assets/images/gosf/power-block-sport-IB-s0.jpg" /></a>
      <a href="http://www.healthkart.com/sv/prestige-pecmd-1.0-coffee-maker/SP-18851?navKey=VRNT-38392"><img src="<hk:vhostImage/>/assets/images/gosf/Prestige-PECMD-Coffee-Maker.jpg" /></a>
      <a href="http://www.healthkart.com/sv/reebok-vibrant-training-gloves-%28pair%29/SP-23900?navKey=VRNT-45970"><img src="<hk:vhostImage/>/assets/images/gosf/Reebok-Vibrant-Training-Gloves.jpg" /></a>
      <a href="http://www.healthkart.com/sv/reebok-vibrant-trampoline/SP-23882?navKey=VRNT-45943"><img src="<hk:vhostImage/>/assets/images/gosf/Reebok-Vibrant-Trampoline.jpg" /></a>
      <a href="http://www.healthkart.com/sv/sklz-hopz-pro/SP-13934?navKey=VRNT-22967"><img src="<hk:vhostImage/>/assets/images/gosf/SKLZ-hopz-pro.jpg" /></a>
      <a href="http://www.healthkart.com/sv/sunflame-sf-721-coffee-maker-%28espresso-+-drip%29/SP-19192?navKey=VRNT-38726"><img src="<hk:vhostImage/>/assets/images/gosf/Sunflame-SF-721-Coffee-Maker.jpg" /></a>
      <%--<a href="#"><img src="<hk:vhostImage/>/assets/images/gosf/Sunflame-SF-721-Fresco-Coffee.jpg" /></a>--%>
      <a href="http://www.healthkart.com/sv/suunto-core-all-black-sports-watch/SP-19677?navKey=VRNT-39584"><img src="<hk:vhostImage/>/assets/images/gosf/Suunto-Core-all-black.jpg" /></a>
      <a href="http://www.healthkart.com/sv/suunto-m2-fuchsia-hr-monitor-%28female%29/SP-19656?navKey=VRNT-39527"><img src="<hk:vhostImage/>/assets/images/gosf/Suunto-M2-Fuschia.jpg" /></a>
      <a href="http://www.healthkart.com/sv/trisa-impulse-plaque-clean/SP-10568?navKey=VRNT-16627"><img src="<hk:vhostImage/>/assets/images/gosf/Trisa-impluse-plaque-clean.jpg" /></a>
      <a href="http://www.healthkart.com/sv/trisa-junior-plaque-clean/SP-10567?navKey=VRNT-16626"><img src="<hk:vhostImage/>/assets/images/gosf/Trisa-Junior-Plaque-Clean.jpg" /></a>
      <a href="http://www.healthkart.com/sv/trisa-professional-plaque-clean/SP-10566?navKey=VRNT-16625"><img src="<hk:vhostImage/>/assets/images/gosf/Trisa-Professional-Plaque.jpg" /></a>
      <a href="http://www.healthkart.com/sv/trisa-sonic-power-toothbrush-sensitive/SP-10510?navKey=VRNT-16530"><img src="<hk:vhostImage/>/assets/images/gosf/Trisa-sonic-power.jpg" /></a>
      <a href="http://www.healthkart.com/sv/trisa-electronic-sonic-power-adult---rechargeable-%28medium%29/SP-10569?navKey=VRNT-16628"><img src="<hk:vhostImage/>/assets/images/gosf/Trisa-sonic-power-rechargable.jpg" /></a>
      <a href="http://www.healthkart.com/sv/tunturi-trampoline/SP-13481?navKey=VRNT-21962"><img src="<hk:vhostImage/>/assets/images/gosf/Tunturi-Trampoline.jpg" /></a>
      <a href="http://www.healthkart.com/sv/usi-adjustable-kettlebell/SP-19635?navKey=VRNT-39506"><img src="<hk:vhostImage/>/assets/images/gosf/USI-Adjustable-Kettlebell.jpg" /></a>
      <a href="http://www.healthkart.com/sv/vacurect-otc-sdx-model/SP-20290?navKey=VRNT-40596"><img src="<hk:vhostImage/>/assets/images/gosf/Vacurect.jpg" /></a>

      <a href="http://www.healthkart.com/sv/beurer-activity-sensor-%28as50%29/SP-2771?navKey=VRNT-3870"><img src="<hk:vhostImage/>/assets/images/gosf/Beurer-activity-sensor.jpg" /></a>
      <a href="http://www.healthkart.com/sv/beurer-heart-rate-monitor-with-altitude-measurement%28pm-90%29/SP-2806?navKey=VRNT-3906"><img src="<hk:vhostImage/>/assets/images/gosf/Beurer-Heart-Rate-Monitor.jpg" /></a>
      <a href="http://www.healthkart.com/sv/eas-myoplex-original/SP-8579?navKey=VRNT-13257"><img src="<hk:vhostImage/>/assets/images/gosf/EAS-Myoplex-original-chocolate.jpg" /></a>
      <a href="http://www.healthkart.com/sv/jsb-deluxe-3d-pedometer/SP-7190?navKey=VRNT-10684"><img src="<hk:vhostImage/>/assets/images/gosf/JSB-Deluxe-3D-Pedometer.jpg" /></a>
      <a href="http://www.healthkart.com/sv/labrada-lean-body-carb-watcher/SP-9843?navKey=VRNT-15241"><img src="<hk:vhostImage/>/assets/images/gosf/labrada-Lean-body-carb-watcher-chocolate.jpg" /></a>
      <a href="http://www.healthkart.com/sv/labrada-lean-body-mrp-original/SP-9629?navKey=VRNT-14870"><img src="<hk:vhostImage/>/assets/images/gosf/Labrada-lean-body-original.jpg" /></a>
      <a href="http://www.healthkart.com/sv/omron-step-counter---activity-monitor-%28hj-313-ap%29/SP-20604?navKey=VRNT-41006"><img src="<hk:vhostImage/>/assets/images/gosf/Omron-Step-Counter-Activity-monitor.jpg" /></a>
      <a href="http://www.healthkart.com/sv/polar-cs-200-cad-cycling-computer-heart-rate-monitor/SP-23542?navKey=VRNT-45416"><img src="<hk:vhostImage/>/assets/images/gosf/Polar-CS-200-CAD-Cycling-Heart-rate-monitor.jpg" /></a>
      <a href="http://www.healthkart.com/sv/polar-ft-7-heart-rate-monitor/SP-12884?navKey=VRNT-21013"><img src="<hk:vhostImage/>/assets/images/gosf/Polar-FT7-Heart-Rate-Monitor.jpg" /></a>
      <a href="http://www.healthkart.com/sv/polar-ft-60-heart-rate-monitor/SP-12880?navKey=VRNT-21006"><img src="<hk:vhostImage/>/assets/images/gosf/Polar-FT60-Heart-Rate-Monitor.jpg" /></a>
      <a href="http://www.healthkart.com/sv/polar-ft-80-heart-rate-monitor/SP-12881?navKey=VRNT-21007"><img src="<hk:vhostImage/>/assets/images/gosf/Polar-FT80-Heart-Rate-Monitor.jpg" /></a>
      <a href="http://www.healthkart.com/sv/suunto-quest-black-%28heart-rate-monitor%29/SP-19650?navKey=VRNT-39521"><img src="<hk:vhostImage/>/assets/images/gosf/Suunto-Quest-Black-heart-rate-monitor.jpg" /></a>
      <a href="http://www.healthkart.com/sv/tunturi-dumbbell-tower/SP-13566?navKey=VRNT-22234"><img src="<hk:vhostImage/>/assets/images/gosf/Tunturi-dumbbell-tower.jpg" /></a>
      <a href="http://www.healthkart.com/sv/tunturi-multi-utility-deluxe-bench-gamma/SP-13571?navKey=VRNT-22239"><img src="<hk:vhostImage/>/assets/images/gosf/Tunturi-multi-utility-deluxe.jpg" /></a>



        <a href="http://www.healthkart.com/sv/aquafit-aq-650a-treadmill/SP-24572?navKey=VRNT-47382"><img src="<hk:vhostImage/>/assets/images/gosf/Aquafit-AQ650A-Treadmill.jpg" /></a>
        <a href="http://www.healthkart.com/sv/aquafit-aq-1005-4-in-1-manual-treadmill/SP-24600?navKey=VRNT-47431"><img src="<hk:vhostImage/>/assets/images/gosf/Aquafit-AQ-1005-4-in-1.jpg" /></a>
        <a href="http://www.healthkart.com/sv/body-fuel-bf-22-treadmill/SP-24896?navKey=VRNT-48144"><img src="<hk:vhostImage/>/assets/images/gosf/BodyFuel-BF-22-Treadmill.jpg" /></a>
        <a href="http://www.healthkart.com/sv/celebrate-life-t-7000e-treadmill/SP-13176?navKey=VRNT-21436"><img src="<hk:vhostImage/>/assets/images/gosf/Celebrate-Life-T7000E.jpg" /></a>
        <a href="http://www.healthkart.com/sv/cosco-alpha-x1.0-motorised-commercial-treadmill/SP-19881?navKey=VRNT-39934"><img src="<hk:vhostImage/>/assets/images/gosf/Cosco-Alpha-X1.0-Motorized.jpg" /></a>

        <a href="http://www.healthkart.com/sv/cosco-cmtm-jk-8010-a-motorised-treadmill/SP-19879?navKey=VRNT-39932"><img src="<hk:vhostImage/>/assets/images/gosf/Cosco-CMTM-JK-8010.jpg" /></a>
        <a href="http://www.healthkart.com/sv/cosco-ctm-510-treadmill/SP-13215?navKey=VRNT-21478"><img src="<hk:vhostImage/>/assets/images/gosf/Cosco-CTM-510-Treadmill.jpg" /></a>
        <a href="http://www.healthkart.com/sv/life-fitness-elevation-95te-engage-treadmill/SP-13265?navKey=VRNT-21566"><img src="<hk:vhostImage/>/assets/images/gosf/Life-itness-elevation-95TE.jpg" /></a>


        <a href="http://www.healthkart.com/sv/life-span-tr-1200-dt-treadmill/SP-20111?navKey=VRNT-40194"><img src="<hk:vhostImage/>/assets/images/gosf/Lifespan-TR-1200-DT.jpg" /></a>

        <a href="http://www.healthkart.com/sv/rollerblade-spark-80-inline-skates/SP-12666?navKey=VRNT-20626"><img src="<hk:vhostImage/>/assets/images/gosf/Rollerblade-Crossfire-80-inline-skates.jpg" /></a>
        <a href="http://www.healthkart.com/sv/rollerblade-crossfire-100-inline-skates/SP-12664?navKey=VRNT-20621"><img src="<hk:vhostImage/>/assets/images/gosf/Rollerblade-Crossfire-100-inline-skates.jpg" /></a>


        <a href="http://www.healthkart.com/sv/spirit-ct-800-commercial-treadmill/SP-23593?navKey=VRNT-45479"><img src="<hk:vhostImage/>/assets/images/gosf/Spirit-CT-800-Comercial-Treadmill.jpg" /></a>
        <a href="http://www.healthkart.com/sv/spirit-dt-510-office-treadmill-desk/SP-19793?navKey=VRNT-39766"><img src="<hk:vhostImage/>/assets/images/gosf/Spirit-DT-510-Office-Treadmill-Desk.jpg" /></a>

        <a href="http://www.healthkart.com/sv/spirit-lct-80-senior-citizens-rehab-treadmill/SP-19792?navKey=VRNT-39765"><img src="<hk:vhostImage/>/assets/images/gosf/Spirit-LCT-80-Senior-Citizen-Rehab.jpg" /></a>
        <a href="http://www.healthkart.com/sv/true-fitness-tm30xt-treadmill/SP-24142?navKey=VRNT-46519"><img src="<hk:vhostImage/>/assets/images/gosf/True-Fitness-TM30XT-Treadmill.jpg" /></a>

        <a href="http://www.healthkart.com/sv/tunturi-abdominal-board-delta/SP-13569?navKey=VRNT-22237"><img src="<hk:vhostImage/>/assets/images/gosf/Tunturi-Abdominal-Board.jpg" /></a>

        <a href="http://www.healthkart.com/sv/tunturi-aerobic-stepper/SP-14270?navKey=VRNT-23985"><img src="<hk:vhostImage/>/assets/images/gosf/Tunturi-Aerobic-Stepper.jpg" /></a>
        <a href="http://www.healthkart.com/sv/tunturi-weightlifting-jacket/SP-14271?navKey=VRNT-23986"><img src="<hk:vhostImage/>/assets/images/gosf/Tunturi-Weightlifting-Jacket.jpg" /></a>
        <a href="http://www.healthkart.com/sv/turbuster-tr-450a-4-in-1-treadmill/SP-14430?navKey=VRNT-24351"><img src="<hk:vhostImage/>/assets/images/gosf/Turbuster-TR-450-A-4-in-1.jpg" /></a>


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