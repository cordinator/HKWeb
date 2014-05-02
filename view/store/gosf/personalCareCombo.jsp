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
    <div class="wrapper gosfCombo">
      <span class="gosfH1">Personal Care Combos</span>

      <a href="http://www.healthkart.com/combo/knockout-self-defense-pepper-spray-combo/CMB-DEF01"><img src="<hk:vhostImage/>/assets/images/gosf/knockoutCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/durex-flavours-combo/CMB-PER007"><img src="<hk:vhostImage/>/assets/images/gosf/durexCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/instant-ovulation-kit-combo-pack/CMB-PERS013"><img src="<hk:vhostImage/>/assets/images/gosf/InstantOvulationKitCombo.jpg" /></a>

      <a href="http://www.healthkart.com/combo/skore-cool-condoms-pack-of-3/CMB-PER10"><img src="<hk:vhostImage/>/assets/images/gosf/skoreCoolCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/skore-fruity-condoms-pack-of-3/CMB-PER11"><img src="<hk:vhostImage/>/assets/images/gosf/skoreFruityCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/complete-care-pack-clean-and-dry-cream-and-powder/CMB-PER14"><img src="<hk:vhostImage/>/assets/images/gosf/cleanDryCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/complete-care-pack-clean-and-dry-foam-and-cream/CMB-PER15"><img src="<hk:vhostImage/>/assets/images/gosf/cleanDryFoamCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/complete-care-pack-clean-and-dry-foam-and-powder/CMB-PER16"><img src="<hk:vhostImage/>/assets/images/gosf/cleanDryPowderCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/twin-care-clean-and-dry-foam-pack-of-2/CMB-PER17"><img src="<hk:vhostImage/>/assets/images/gosf/twinCareCombo.jpg" /></a>

      <a href="http://www.healthkart.com/combo/ayu-care-vaji-tailam/CMB-PER21"><img src="<hk:vhostImage/>/assets/images/gosf/vajiTailamCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/skore-assorted-pack-of-7-lovers-combo/CMB-PER7"><img src="<hk:vhostImage/>/assets/images/gosf/skoreAssortedCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/durex/CMB-PER8"><img src="<hk:vhostImage/>/assets/images/gosf/durex6AssortedCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/skore-assorted-flavor-of-3/CMB-PER9"><img src="<hk:vhostImage/>/assets/images/gosf/skore3Assorted.jpg" /></a>
      <a href="http://www.healthkart.com/combo/knock-out-pepper-spray-combo/CMB-PERS005"><img src="<hk:vhostImage/>/assets/images/gosf/knockout10Combo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/nicorette/CMB-PERS006"><img src="<hk:vhostImage/>/assets/images/gosf/nicoretteCombo.jpg" /></a>

      <a href="http://www.healthkart.com/combo/moods-combo/CMB-PERS008"><img src="<hk:vhostImage/>/assets/images/gosf/moods6Combo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/moods-lubes-combo/CMB-PERS009"><img src="<hk:vhostImage/>/assets/images/gosf/MoodsLubesCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/velvet-condom-for-women/CMB-PERS020"><img src="<hk:vhostImage/>/assets/images/gosf/VelvetCondomCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/moods-extreme-pack-of-3/CMB-PERS021"><img src="<hk:vhostImage/>/assets/images/gosf/MoodsExtremeCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/moods-combo-pack-of-3/CMB-PERS022"><img src="<hk:vhostImage/>/assets/images/gosf/MoodsCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/durex-apple-condoms-combo/CMB-PERS025"><img src="<hk:vhostImage/>/assets/images/gosf/DurexAppleCondomsCombo.jpg" /></a>

      <a href="http://www.healthkart.com/combo/durex-combo-pack/CMB-PERS026"><img src="<hk:vhostImage/>/assets/images/gosf/DurexComboPack.jpg" /></a>
      <a href="http://www.healthkart.com/combo/durex-flavours-combo/CMB-PERS028"><img src="<hk:vhostImage/>/assets/images/gosf/DurexFlavoursCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/durex-performa-condoms-combo/CMB-PERS029"><img src="<hk:vhostImage/>/assets/images/gosf/DurexPerformaCondomsCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/durex-superthin-condoms-combo/CMB-PERS030"><img src="<hk:vhostImage/>/assets/images/gosf/DurexSuperthinCondomsCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/moods-assorted-pack-duo-pack/CMB-PERS032"><img src="<hk:vhostImage/>/assets/images/gosf/MoodsAssortedCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/manforce-pleasure-condoms-combo/CMB-PERS033"><img src="<hk:vhostImage/>/assets/images/gosf/ManforcePleasureCombo.jpg" /></a>

      <a href="http://www.healthkart.com/combo/moods-dotted-condoms-combo/CMB-PERS035"><img src="<hk:vhostImage/>/assets/images/gosf/MoodsDottedCondomsCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/moods-absolute-xtasy-condoms-combo/CMB-PERS037"><img src="<hk:vhostImage/>/assets/images/gosf/MoodsAbsoluteXtasyCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/oral-b-toothbrush-combo/CMB-PP092"><img src="<hk:vhostImage/>/assets/images/gosf/oral-L-ToothbrushCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/self-defence-pepper-spray-alarm/CMB-SELF001"><img src="<hk:vhostImage/>/assets/images/gosf/SelfDefensePepperCombo.jpg" /></a>

      <a href="http://www.healthkart.com/combo/fertility-detox-combo/CMB-FER04"><img src="<hk:vhostImage/>/assets/images/gosf/FertilityDetoxCombo.jpg" /></a>

      <a href="http://www.healthkart.com/combo/dental-care-combo/SENS-CMB-01"><img src="<hk:vhostImage/>/assets/images/gosf/DentalCareCombo.jpg" /></a>
      <a href="http://www.healthkart.com/combo/nuby-wipes-special-value-pack/CMB-BAB0419"><img src="<hk:vhostImage/>/assets/images/gosf/NubycleanwipesC.jpg" /></a>




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