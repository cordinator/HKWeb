<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>



<s:layout-render name="/buying-guide/bgGeneral.jsp" title="FAT BURNERS - All You Need to Know">
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

<s:layout-component name="htmlHead">
  <meta name="description" content="Discover the role of vitamins and supplements that are essential for overall well-being of men." />
  <meta name="keywords" content="Men's Health, Men's Health Benefits, Men's Health Vitamins, Men's health Vitamins" />


  <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/buying-guide/fatBurner/fatBurner.css"
        media="screen">

</s:layout-component>

<s:layout-component name="bgContent">

<div class="wrapper">
<div class="fbContainer1">
  <div class="fbContainerInside">
    <div class="fbContainerInside1">
      <h1 class="heading-text">FAT<br/>
        BURNERS</h2>
      <h1 class="mrgn-bt-10">All You Need to Know</h1>
      <ul class="fbUl">
        <li><a href="javascript:void(0)" data-target="#intro">Introduction</a></li>
        <li><a href="javascript:void(0)" data-target="#work">How do they work?</a></li>
        <li><a href="javascript:void(0)" data-target="#contain">What they contain?</a></li>
        <li><a href="javascript:void(0)" data-target="#advise">Precautions, Advised Usage & Known side-effects</a></li>
        <li><a href="javascript:void(0)" data-target="#choose">How to Choose a Fat Burner?</a></li>
      </ul>

    </div>
    <!--  fbContainerInside1 close -->

    <div class="fbContainerInside2">
      <img src="images/topImg.png" /></div>
    <!--  fbContainerInside2 close -->

  </div>
  <!--  mhContainerInside close -->

</div>
<!--  fbContainer1 close -->

<div class="fbContainer2">
</div>
<!--  fbContainer2 close -->

<div class="fbContainer3" >
  <div class="fbContainerInside">
    <div class="fbContainerInside1" id="intro">
      <h3 class="pHeading">Introduction</h3>
           <p class="mrgn-b-10">This supplement guide is meant to inform you about usage
        norms, precautions and side effects concerning the use of fat
        burners.</p>
      <p class="mrgn-b-10">Fat burners can be herbal or manufactured stimulants that<br />

        are meant to aid or help in the burning of calories. Before
        using any fat burning compound you must decide on your
        dosage and know how these compounds will affect your body.
      </p>
      <p>Only with proper diet control and exercise can weight loss be
        achieved with fat burners. They are supplements that combined
        along with a good fitness regime can achieve wonders
        based on your innate body metabolism and functioning.</p>
    </div>
    <!--  fbContainerInside1 close -->

    <div class="fbContainerInside2">
      <div class="mrgn-t-50 mrgn-l-30"><h2>In India one in every three citizens exceed their ideal weight. Obesity takes a heavy toll on your body.
        Obesity is linked to:</h2>
        <p class="mrgn-bt-20"><img class="mrgn-r-10" src="images/heartIcon.png" />Heart Attack/Heart Diseases</p>
        <p class="mrgn-b-20"><img class="mrgn-r-10" src="images/bloodVesselsIcon.png" />Damage to Blood Vessels</p>
        <p class="mrgn-b-20"><img class="mrgn-r-10" src="images/strokeIcon.png" />Stroke</p>
        <p class="mrgn-b-20"><img class="mrgn-r-10" src="images/kidneyIcon.png" />Kidney Failure</p>
        <p class="mrgn-b-20"><img class="mrgn-r-10" src="images/liverIcon.png" />Liver Diseases</p>
        <p class="mrgn-b-20"><img class="mrgn-r-10" src="images/lungIcon.png" />Sleep Apnea & Lung Disorder</p>


      </div>
    </div>
    <!--  fbContainerInside2 close -->

  </div>
  <!--  fbContainerInside close -->

</div>
<!--  fbContainer3 close -->

<div class="fbContainer4">
  <div class="fbContainerInside">
    <div class="fbContainerInside1">
      <h3 class="pHeading" id="work">How do Fat Burners work?</h3>
      <p class="mrgn-bt-10">Fat burners affect different bodies in different ways and
        depending on your metabolism would achieve different results.
        Most fat burners usually work by giving your metabolism a
        push or increase, which results in weight
        loss when you
        work-out. Such compounds are called thermogenics or thermogenic fat burners. Some
        also contain stimulants to aid in
        rigorous work-outs. Others
        help to curb appetite
        and thereby achieve weight loss.
        Affecting the hormone
        level in your body to burn more fat is
        also one way that
        some fat burners work. Fat burners are also
        meant to
        increase focus and act as energy boosters. A few fat

        burners also contain diuretics that help you lose body
        water weight and thus lose weight for a
        short while.</p>
    </div>
    <!--  fbContainerInside1 close -->

    <div class="fbContainerInside2">
      <div class="outerBorder">
        <img class="mrgn-bt-30 mrgn-l-40 pad-lr-20" src="<hk:vhostImage/>/buying-guide/fatBurner/images/tradmillIcon.png" /><img class="mrgn-l-40" src="<hk:vhostImage/>/buying-guide/fatBurner/images/foodIcon.png" />
        <p class="mrgn-lr-20"><span class="textLight">Remember,</span> fat burners are supplements.
          Only with exercise and strict diet control will there
          be substantial weight reduction. If along with
          fat burners you eat just as much as you normally
          would it would defeat the purpose of consuming
          the fat burner.</p>
      </div>
    </div>
    <!--  fbContainerInside1 close -->

  </div>
  <!--  fbContainerInside close -->
</div>
<!--  fbContainer4 close -->

<div class="fbContainer5">
  <div class="fbContainerInside">
    <h3 class="pHeading" id="contain">What they contain</h3>
    <p>As far as fat burners are concerned all manufactures of fat burners mostly use their own unique mix of compounds.
      So it is important that you read the label carefully and get to know the mix of ingredients. However,
      there are some compounds that usually turn up in many different fat burners.</p>
    <div class="solution"><img src="<hk:vhostImage/>/buying-guide/fatBurner/images/caffeine.png" />
      <p class="pad-t-10"><span class="textLight">Caffeine:</span> Is said to aid fat loss if taken
        before work-out since it increases the
        metabolism of fat. It acts as a stimulant
        and also increases your focus. Most fat
        burners contain caffeine in some form.</p>
    </div>
    <!--  solution close -->

    <div class="solution mrgn-l-30"><img src="<hk:vhostImage/>/buying-guide/fatBurner/images/yohimbe.png" />
      <p class="pad-t-10"><span class="textLight">Yohimbe:</span> It is an evergreen tree whose
        bark is used in many forms of medication.
        It is said to increase lipolysis, that is the
        burning of fat accumulated in the body.</p></div>
    <!--  solution close -->

    <div class="solution mrgn-l-30"><img src="<hk:vhostImage/>/buying-guide/fatBurner/images/capsaicin.png" />
      <p class="pad-t-10"><span class="textLight">Capsaicin:</span> Is the active ingredient in
        peppers. It is said to aid in the increase
        of the rate of burning of the body&#39;s fat as
        well as reducing the absorption of fat.</p></div>
    <!--  solution close -->

    <div class="cl"></div>
    <!-- cl close -->


    <!-- variantResultView id close-->

    <div class="solution"><img src="<hk:vhostImage/>/buying-guide/fatBurner/images/greenTea.png" />
      <p class="pad-t-10"><span class="textLight">Green Tea Extract:</span> Contains the compounds
        polyphenols and catechins
        which are said to increase the body&#39;s
        metabolism and help in weight loss.</p>
    </div>
    <!--  solution close -->

    <div class="solution mrgn-l-30"><img src="<hk:vhostImage/>/buying-guide/fatBurner/images/grape.png" />
      <p class="pad-t-10"><span class="textLight">Grape Seed Extract:</span> Is a natural compound
        that is thought to decrease appetite
        and absorption of fat. It also increases
        metabolism in the body and aids
        other compounds in fat burners.</p></div>
    <!--  solution close -->

    <div class="solution mrgn-l-30"><img src="<hk:vhostImage/>/buying-guide/fatBurner/images/chromium.png" />
      <p class="pad-t-10"><span class="textLight">Chromium:</span> Is usually available in the
        form of Chromium Picolinate and it is a
        compound said to curb appetite.</p></div>
    <!--  solution close -->

    <div class="cl"></div>
    <!-- cl close -->


    <!-- variantResultView id close-->

  </div>
  <!--  fbContainerInside close -->

</div>
<!--  fbContainer5 close -->
<div class="cl"></div>
<!-- cl close -->

<div class="fbContainer6">
  <div class="fbContainerInside">

    <h3 class="pHeading" id="advise">Precautions, Advised Usage and Side-effects</h3>
    <p class="pad-tb-10">You should keep in mind the following points:<br />
    <ul class="fbUl">
    <li class="pad-b-10">If you are starting using fat burners then your intake should not exceed the dosage specified, at least at first.</li>
    <li class="pad-b-10">You should avoid taking fat burners after 6 o'clock, as some compounds in fat burners might affect your sleep.</li>
    <li class="pad-b-10">Drinking lots of water and staying hydrated is also very important. It aids in fighting dehydration as well as expelling toxins from the body.</li>
    <li class="pad-b-10">Any pre-existing medication or medical condition can make using fat burners tricky. You should always exercise caution when
      dealing with substances that alter your bodies physical functioning.</li>
    <li class="pad-b-10">And remember if you are ever unsure always consult a physician first.</li>


    <li>Another important term that you should be aware of is 'cycling'</li>  </ul>
    <p>
      <span class="textLight">Cycling:</span> Most often, after using a thermogenic supplement for some time the human body eventually develops tolerance towards the compound.
      As a result the effects of the fat burner on your body will decrease. Instead of increasing the dosage in such a case, it is always advised to rather cycle off,
      or stop using fat burners for 2-3 weeks. After such a rest period you start taking the fat burner supplements for the same period of time and then cycle off again. This is referred to as cycling.</p>

    <div class="sideEffects mrgn-t-30">
    <p class="mrgn-b-10"><span class="textLight">Side-effects of Fat Burners</span><br />
      With overuse of most fat burners you may experience one or more of the following symptoms:  </p>
    <img src="<hk:vhostImage/>/buying-guide/fatBurner/images/side-effects.png" alt="Side Effects" />
    </div>

  </div>
  <!--  fbContainerInside close -->

</div>
<!--  fbContainer6 close -->

<div class="fbContainer5">
  <div class="fbContainerInside" id="choose">
    <h3 class="pHeading">How To Choose a Fat Burner?</h3>
    <p class="pad-b-20 pad-t-10">Four questions you need to answer before you choose a fat burner</p>
    <div class="fbContainerInside1">
      <span class="textLight">What do you need from your fat burner? Identify your need.</span> <p class="pad-t-10">
      Different ingredients have different uses. What should YOUR fat burner do?</p>

      <p class="pad-t-10 pad-r-10"><span class="fnt-bold">Control your appetite?</span> Chromium picollinate is one of the ingredients that achieve appetite control.</p>
      <p class="pad-r-10 pad-t-10"><span class="fnt-bold">Increase your metabolism?</span> Thermogenics like caffeine, green tea extract & capsaicin are usually used.

      <p class="fnt-bold pad-t-10">Give you an energy boost?</p>
      <p>Caffeine & Yohimbe are the usual ingredients to look for.</p>
      <p class="pad-r-10 pad-t-10"><span class="fnt-bold">Make you lose weight fast for an upcoming escapade?</span> Diuretic supplements would make you lose water weight <br />
        fast, but it only lasts for a short while. </p>


    </div>
    <!-- fbContainerInside1 close-->

    <div class="fbContainerInside2">


      <span class="textLight">Caffeine/Stimulants not good for you?</span>
      <p>If drinking even one cup of coffee leaves you jittery and sleepless then you should avoid fat burners with the stimulants Caffeine, Yohimbe(Yohimbine) & Synephrine. Instead go in for herbal or stimulant free fat burners. Substitues like green tree extract and L-Carnitine are most widely used instead of these stimulants.</p>
      <p class="textLight mrgn-t-10">Usual or a stronger fat burner?</p>
      <p>Prolonged use of fat burners are never recommended, if however you are not planning to use fat burners for more than six months at the most then you can use one of the stronger fat burners.</p>
      <p class="textLight mrgn-t-10">Consult a physician?</p>
      <p class="mrgn-b-40">Consulting a physician is always a good idea before you opt in for fat burners usually, ESSENTIAL if you are on medication.</p>
    </div>
    <!-- fbContainerInside2-->

    <div class="cl"></div>

    <span class="textLight">Product Showcase</span>
    <p>After going through the previous sections you should now be able to choose the best fat burner for you.

      <br/> Before you decide which one to buy have a look at some of our top-selling fat burners.</p>


    <div class="prodDec">One of the stronger fat burners</div>
    <div class="prodDec mrgn-l-75">Completely herbal and caffeine free</div>
    <div class="prodDec mrgn-l-75">Boosts metabolism and helps control appetite</div>
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="48812,50594,15802" showAddToCart="true"/>

    <div class="cl"></div>


    <div class="prodDec">Thermogenic effect with energy boost</div>
    <div class="prodDec mrgn-l-75">Reduces hunger cravings & energizes your body</div>
    <div class="prodDec mrgn-l-75">Rich in caffeine</div>

    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="47056,42652,13472" showAddToCart="true"/>

  </div>
  <!--  fbContainerInside close -->
</div>
<!--  fbContainer3 close -->




</div>
<!--  wrapper close -->


</s:layout-component>

<s:layout-component name="bgScriptComponent">
  <script>
    $(document).ready(function () {

    });

  </script>


  <script type="text/javascript">
    $('body').on('click','a[data-target]',function(){
      HK.utils.Scroll.toElement($($(this).attr('data-target')));
    })

  </script>

  <script type="text/javascript">
    $('body').on('click','a[data-target]',function(){
      HK.utils.Scroll.toElement($($(this).attr('data-target')));
    })

  </script>


  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>


</s:layout-component>
</s:layout-render>