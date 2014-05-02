<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>



<s:layout-render name="/buying-guide/bgGeneral.jsp" title="Men's Health Vitamins & Supplements">
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


  <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/buying-guide/mensHealth/menHealth.css"
        media="screen">

</s:layout-component>

<s:layout-component name="bgContent">

<div class="wrapper">
<div class="mhContainer1">
  <div class="mhContainerInside">
    <div class="mhContainerInside1"><img src="<hk:vhostImage/>/buying-guide/mensHealth/images/head.png" /></div>
    <!--  mhContainerInside1 close -->

    <div class="mhContainerInside2"><div class="heading-text">VITAMINS<br />
      & SUPPLEMENTS
    </div>

      <img class="mrgn-b-20" src="<hk:vhostImage/>/buying-guide/mensHealth/images/for.png" />


      <h1 class="heading-text mrgn-b-10">MEN&#39;S HEALTH</h1>
      <p class="mrgn-b-10">Learn and discover about vitamins and supplements<br />
        you need to stay hale and hearty.</p>

      <p>Also, through this page you will find out about:</p>

      <ul class="mhUl">
        <li><a href="javascript:void(0)" data-target="#heading1">Nutrients you don&#39;t get from your meals</a></li>
        <li><a href="javascript:void(0)" data-target="#heading2">Nutrients you need for a healthy life</a></li>
        <li><a href="javascript:void(0)" data-target="#heading3">How to fill the nutritional gap</a></li>
        <li><a href="javascript:void(0)" data-target="#heading4">Benefits of nutrients</a></li>
      </ul>

      A Fitter And Healthier You Is Just A Scroll Away. <img src="<hk:vhostImage/>/buying-guide/mensHealth/images/iconDown.png" /> </div>

    <!--  mhContainerInside2 close -->

    <div class="cl"></div>

  </div>
  <!-- mhContainerInside close -->

</div>
<!-- mhContainer1 close -->

<div class="mhContainer2">
  <div class="mhContainerInside">
    <div class="mrgn-b-35" id="heading1"><img src="<hk:vhostImage/>/buying-guide/mensHealth/images/bottomLine.png" /></div>
    <!-- mrgn-b-35 close -->

    <div class="mhContainerInside1">
      <h3 class="mrgn-b-20">IN REALITY,<br />
        NUTRIENTS FROM A</h3>

      <div class="img-left"><img src="<hk:vhostImage/>/buying-guide/mensHealth/images/veg.png" />VEG MEAL</div>
      <div class="img-right"><img src="<hk:vhostImage/>/buying-guide/mensHealth/images/nonveg.png" />NON-VEG MEAL</div>
      <h3>IS NOT ENOUGH!</h3>

      <hr />
      <p>When your
      <h3>NEED > SUPPLY,</h3>external supplementation may help.</p>
    </div>
    <!-- mhContainerInside1 close -->

    <div class="mhContainerInside2 mrgn-t-25">
      <div class="paddingLeftText">A healthy balanced diet should get most of the nutrients
        you need, without relying on supplements. However, that&#39;s
        not the case. We don&#39;t get enough potassium, magnesium,
        vitamin A, C and D for it to match to the required
        daily amount.
        <p class="mrgn-t-20"><b>Reports show that on an average, men need to eat
          350% more dark green vegetables and 150% more
          fruits daily in order to meet their dietary guidelines.</b></p>
        <p class="mrgn-t-20"><h3 ><b>Huge nutritional gap difficult to fill?</b></h3></p>
        Here&#39;s when supplements come in to picture.
        As a side-note, remember supplements are meant to just
        supplement your diet and are not substitutes for
        a healthy living.</div>
    </div>
    <!-- mhContainerInside2 close -->

    <div class="cl"></div>

  </div>
  <!-- mhContainerInside -->

</div>
<!-- mhContainer2 close -->

<div class="mhContainer3">
  <div class="pad-tb-30" id="heading2"><img src="<hk:vhostImage/>/buying-guide/mensHealth/images/bottomLine.png" /></div>
  <h2 class="pad-b-10"><b>Nutrients You Need For A Healthy Life</b></h2>
  <p>From helping the body turn food into fuel, to fortifying bones and eyesight,<br />
    vitamins and minerals are without doubt "The Health Superstars".<br />
    While the average diet usually includes adequate amounts of essential nutrients,<br />
    the below chart details the key nutrients and the amount needed to keep you smiling.</p>
  <div class="mhContainerInside"><div class="bgImgP"><b>Vitamin A:</b> 900 mcg a day<br />

    <b>Vitamin B1:</b> 1.2 mg a day<br />

    <b>Vitamin B2:</b> 1.3 mg a day<br />

    <b>Vitamin B3:</b> 16 mg a day<br />

    <b>Vitamin B5:</b> 5 mg a day<br />

    <b>Vitamin B6:</b> 1.3 mg a day<br />

    <b>Vitamin B12:</b> 2.4 mcg a day<br />

    <b>Vitamin C:</b> 90 mg a day<br />

    <b>Vitamin D:</b> 15 mcg a day<br />

    <b>Folic Acid:</b> 400 mcg a day<br />

    <b>Calcium:</b> 1000 mg a day<br />

    <b>Magnesium:</b> 400 mg a day<br />

    <b>Potassium:</b> 2,000 mg a day<br />

    <b>Phosphorus:</b> 700 mg a day<br />

    <b>Zinc:</b> 11 mg a day<br />

    <b>Iron:</b> 10 mg a day<br />

    <b>Salt:</b> Sodium- 500 mg;<br />

    Chloride- 750 mg a day</div>
    <p> The above mentioned values are Recommended Dietary Allowances,<br />
      or RDAs for an average Indian man. They are defined as the average daily dietary intake<br />
      of each vitamin and mineral a person needs to stay healthy and steer clear of deficiencies. </p>
    <p class="mrgn-t-10"><h5>*The values, which are all backed by scientific data, are subjected to change <br/>according to region, age and gender.</h5></p>

  </div>
  <!-- mhContainer3 close -->
</div>
<!-- mhContainer3 close -->

<div class="mhContainer4">

  <div class="pad-tb-30" id="heading3"><img src="<hk:vhostImage/>/buying-guide/mensHealth/images/bottomLine.png" /></div>
  <h2 class="pad-b-10"><b>How To Fill The Nutritional Gap?</b></h2>

  <div class="mhContainerInside">

    <div class="mhContainerInside1">

      <div class="img-left"><img src="<hk:vhostImage/>/buying-guide/mensHealth/images/tablet.png" /></div>
      <div class="img-right"><img src="<hk:vhostImage/>/buying-guide/mensHealth/images/spoon.png" /></div>
      <div class="cl"></div>

      <hr />
      <p>Supplements are nothing but essential nutritients
        packed in pills, capsules <br />
        and powders.</p>
    </div>
    <!-- mhContainerInside1 close -->

    <div class="mhContainerInside2">
      <div class="paddingLeftText">When it is not possible to follow a healthy and regular diet
        due to reasons like a busy schedule or unhealthy food
        choices, a daily intake of dietary supplements fulfills the
        nutrient deficiency.
        <p class="mrgn-t-20">Although you can&#39;t compare the effectiveness of having a
          healthy diet with supplementation but the potent
          ingredients in these supplements ensure that your
          nutritional needs are taken care of and overall health gets
          a boost.</p>
        <p class="mrgn-t-20">By complementing your daily meals with suitable
          supplements, don&#39;t expect instant health gains or prevention
          of chronic diseases, what all they do is maintain your health,
          increase immunity and lower the chances of contracting
          diseases that interrupt in your bodily functions.</p>

      </div>
    </div>
    <!-- mhContainerInside2 close -->

    <div class="cl"></div>

  </div>
  <!-- mhCountainerInside close -->

</div>
<!-- mhContainer4 close -->

<div class="mhContainer5">
<div class="pad-tb-30" id="heading4"><img src="<hk:vhostImage/>/buying-guide/mensHealth/images/bottomLine.png" /></div>
<h2 class="pad-b-10"><b>Benefits Of Nutrients</b></h2>
<div class="mhContainerInside">
<div class="bgImgM">
<div class="mhContainerInside1">

  <span class="textDown flot-l">Vitamin A</span>
  <img class="flot-r" src="<hk:vhostImage/>/buying-guide/mensHealth/images/eye.png" />
  <div class="cl"></div>

  <div class="textContainer">
    Promotes good vision, aids in the growth
    of healthy skin and normal development
    of teeth and skeletal tissues.
  </div>


  <span class="flot-l">Vitamin C</span>
  <div class="cl"></div>



  <div class="textContainer">
    Promotes good vision, aids in the growth
    of healthy skin and normal development
    of teeth and skeletal tissues.
  </div>



  <span class="textDown flot-l">Folic Acid</span>
  <img class="flot-r" src="<hk:vhostImage/>/buying-guide/mensHealth/images/folicAcid.png" />
  <div class="cl"></div>

  <div class="textContainer">
    Promotes good vision, aids in the growth
    of healthy skin and normal development
    of teeth and skeletal tissues.
  </div>


  <span class="flot-l">Magnesium</span>
  <div class="cl"></div>



  <div class="textContainer">
    Assists in energy production and is
    responsible for the structural development
    of bones.
  </div>

  <span class="textDown flot-l">Sodium</span>
  <img class="flot-r" src="<hk:vhostImage/>/buying-guide/mensHealth/images/sodium.png" />
  <div class="cl"></div>

  <div class="textContainer">
    Controls blood pressure and maintains
    proper functioning of nerves and
    muscles.
  </div>

  <span class="flot-l">Zinc</span>
  <div class="cl"></div>




  <div class="textContainer">
    Enhances immunity and is responsible
    for a healthy growth of the body.
  </div>

  <span class="textDown flot-l">Glucosamine</span>
  <img class="flot-r" src="<hk:vhostImage/>/buying-guide/mensHealth/images/glucosamine.png" />
  <div class="cl"></div>

  <div class="textContainer">
    Building block of cartilage
    (connective tissues) and relieves joints
    from pain and inflammation.
  </div>


  <span class="flot-l">Acety L-Carnitine</span>
  <div class="cl"></div>



  <div class="textContainer">
    This amino acid transforms fats in to energy
    and boosts antioxidant activity in the body.
  </div>

  <span class="textDown flot-l">Milk Thistle </span>
  <img class="flot-r" src="<hk:vhostImage/>/buying-guide/mensHealth/images/milkThistle.png" />
  <div class="cl"></div>

  <div class="textContainer">
    May be helpful for regular alcoholics
    and protects the liver from bad effects
    of alcohol.
  </div>


  <span class="flot-l">Pycnogenol (extract of pine bark) </span>
  <div class="cl"></div>



  <div class="textContainer">
    Soothes joint pain and reduces muscle cramps.
  </div>


  <span class="textDown flot-l">Garlic</span>
  <img class="flot-r" src="<hk:vhostImage/>/buying-guide/mensHealth/images/garlic.png" />
  <div class="cl"></div>

  <div class="textContainer">
    Helps maintain blood pressure, combats free
    radicals in the body and may boost immunity.
  </div>


  <span class="flot-l">Fiber</span>
  <div class="cl"></div>



  <div class="textContainer">
    Aids in digestion, lowers bad cholesterol
    and helps maintain weight.
  </div>


</div>
<!-- mhContainerInside1 close -->

<div class="mhContainerInside2">

  <div class="manTextPadding">









    <span class="flot-l">Vitamin B</span>
    <div class="cl"></div>



    <div class="textContainer">Help in fat and cell metabolism, assist in
      energy production and are also good for
      skin, hair, eyes, mouth and liver.
    </div>

    <span class="textDown flot-l">Vitamin D</span>
    <img class="flot-r" src="<hk:vhostImage/>/buying-guide/mensHealth/images/vitaminD.png" />
    <div class="cl"></div>

    <div class="textContainer">
      Helps your body to absorb calcium
      and maintain a stronger bone health.
    </div>

    <span class="textDown flot-l">Calcium</span>
    <img class="flot-r" src="<hk:vhostImage/>/buying-guide/mensHealth/images/calcium.png" />
    <div class="cl"></div>

    <div class="textContainer">
      Helps maintain stronger bones and teeth
      and is also good for indigestion.
    </div>


    <span class="flot-l">Potassium</span>
    <div class="cl"></div>



    <div class="textContainer">
      Keeps your heart healthy and may lower
      cholesterol levels.
    </div>

    <span class="textDown flot-l">Phosphorus</span>
    <img class="flot-r" src="<hk:vhostImage/>/buying-guide/mensHealth/images/phosphorus.png" />
    <div class="cl"></div>

    <div class="textContainer">
      Cleans up the waste of the kidneys and
      is essential for the growth, maintenance
      and repair of all tissues and cells in the body.
    </div>



    <span class="textDown flot-l">Iron</span>
    <img class="flot-r" src="<hk:vhostImage/>/buying-guide/mensHealth/images/iron.png" />
    <div class="cl"></div>

    <div class="textContainer">
      Best for anemic people and may be
      useful in promoting a sharp memory.
    </div>


    <span class="flot-l">Co-enzyme Q10</span>
    <div class="cl"></div>



    <div class="textContainer">
      Works as an antioxidant and elevates
      energy levels in the body.
    </div>

    <span class="textDown flot-l">Green Tea</span>
    <img class="flot-r" src="<hk:vhostImage/>/buying-guide/mensHealth/images/greenTea.png" />
    <div class="cl"></div>

    <div class="textContainer">
      Rich in antioxidants, promotes better
      immunity, helps in managing weight
      and overall health.
    </div>


    <span class="flot-l">Ginseng</span>
    <div class="cl"></div>



    <div class="textContainer">
      Gives you energy, reduces fatigue
      and improves alertness and focus.
    </div>


    <span class="textDown flot-l">Fish oil</span>
    <img class="flot-r" src="<hk:vhostImage/>/buying-guide/mensHealth/images/fishoil.png" />
    <div class="cl"></div>

    <div class="textContainer">
      Has essential omega-3 fatty acids EPA
      and DHA. Good for cardiovascular system
      and may also relieve mind from stress.</div>


    <span class="flot-l">Turmeric</span>
    <div class="cl"></div>



    <div class="textContainer">
      Aids in digestion, lowers bad cholesterol
      and helps maintain weight.
    </div>


    <span class="textDown flot-l">Probiotics</span>
    <img class="flot-r" src="<hk:vhostImage/>/buying-guide/mensHealth/images/probiotics.png" />

    <div class="cl"></div>

    <div class="textContainer">Healthy good bacteria that promote healthy
      digestion and maintain overall gut health
    </div>

  </div>
  <!-- manTextPadding close -->

</div>
<!-- mhContainerInside2 close -->

</div>
<!-- bgImgM close -->

</div>
<!-- mhContainerInside -->

</div>
<!-- mhContainer5 close -->
<div class="cl"></div>

<div class="mhContainer6 pad-b-20">
  <div class="pad-tb-30"><img src="<hk:vhostImage/>/buying-guide/mensHealth/images/bottomLine.png" /></div>
  <h2 class="pad-b-10"><b>How To Take Them?</b></h2>

  <div class="mhContainerInside">
    <div class="mhContainerInside1" style="margin-top: -30px;">
      <ul class="mhUlw">
        <li>Never take vitamins on an empty stomach. Something needs
          to be there in your tummy for the nutrients to get absorbed.
        </li>
        <li>Take your supplements after a meal with a glass of room
          temperature water; hot water can destroy the vitamins whilst
          ice can slow the absorption.</li>
        <li>Avoid tea or coffee for 15 minutes before and after taking a supplement as they have been shown to interfere with
          nutrient absorption.
        </li>
        <li>Most pills can be crushed if you find them hard to swallow
          but make sure you check the labelling on your supplement.</li>
      </ul>
    </div>
    <!-- mhContainerInside1 close -->

    <div class="mhContainerInside2"><div class="paddingTLText">
      <img src="<hk:vhostImage/>/buying-guide/mensHealth/images/spoonM.png" /></div>
    </div>

    <!-- mhContainerInside2 close -->


  </div>
  <!-- mhContainerInside -->
</div>
<!-- mhContainer6 close -->


<div class="mhContainer7 mrgn-b-20">
  <div class="pad-tb-30"><img src="<hk:vhostImage/>/buying-guide/mensHealth/images/bottomLine.png" /></div>
  <h2 class="pad-b-20"><b>Choose The Best Ones For You</b></h2>
  <p class="pad-b-20"><i>ARE YOU A WORKAHOLIC?</i></p>
  <p class="pad-b-10">10-6 job defines you. While you still need all the fruits and vegetables<br />
    you can stomach, on those days when you opt for a beer<br />
    rather than a smoothie, the right supplements can help<br />
    to fill in the gaps from a less than ideal diet.</p>

  <p class="pad-b-20">Might we suggest?</p>
</div>
<!-- mhContainer7 close -->

<s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="42577,42200,45158,15339" showAddToCart="true"/>

<div class="mhContainer7 mrgn-b-20">


  <p class="pad-tb-20"><i>ARE YOU A BODYBUILDER?</i></p>
  <p class="pad-b-10">Eating protein daily to get your muscle ripped<br />
    and shredded is what you do. While you are at it,<br />
    your liver and kidney are under constant stress.</p>
  <p class="pad-b-20">Might we suggest?</p>

</div>
<!-- mhContainer7 close -->

<s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="42358,47517,48535,13285" showAddToCart="true"/>

<div class="mhContainer7 mrgn-b-20">


  <p class="pad-tb-20"><i>ARE YOU AN ATHLETE?</i></p>
  <p class="pad-b-10">If you are a regular and a hard trainer or have been<br />
    undergoing a continous fitness regime, you are no les<br />
    than an athlete. A fit body has always been your passion<br />
    and you look forward for a better trained body.</p>
  <p class="pad-b-20">Might we suggest?</p>

</div>
<!-- mhContainer7 close -->

<s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="15308,15350,13643,42558" showAddToCart="true"/>

<div class="mhContainer8">
  <div class="pad-tb-30"><img src="<hk:vhostImage/>/buying-guide/mensHealth/images/bottomLine.png" /></div>
  <h2 class="pad-b-10"><b>How To Take Them</b></h2>
  <p>Here are ways to stack your supplements neatly,<br />
    keep a track on them so that you never miss a dose.</p>

  <div class="mhContainerInside">
    <div class="mhContainerInside1 lastLink">
      <a href="http://www.healthkart.com/sv/equinox-pill-crusher---eq-pb-19040/SP-24076?navKey=VRNT-46440"><img class="mhBimg" src="<hk:vhostImage/>/buying-guide/mensHealth/images/bottomImg1.png" />
      <div class="mhBtext">Crush those hard-to-swallow tablets
        into powder and wash it down with
        juice or shake of your choice.</div></a>
      <div class="cl"></div>

      <a href="http://www.healthkart.com/sv/frio-duo-pen-insulin-wallet/SP-17436?navKey=VRNT-19"><img class="mhBimg" src="<hk:vhostImage/>/buying-guide/mensHealth/images/bottomImg2.png" />
      <div class="mhBtext">Never forget your daily dose with our range of pill
        organisers. They keep all your supplements
        separated and organized.</div></a>


      <div class="cl"></div>

    </div>
    <!-- mhContainerInside1 close -->

    <div class="mhContainerInside2">
      <div class="mrgn-inside2 lastLink">
        <a href="http://www.healthkart.com/sv/vitamin-shoppe-pocket-pack/SP-8428?navKey=VRNT-12953">
        <img class="mhBimg" src="<hk:vhostImage/>/buying-guide/mensHealth/images/bottomImg3.png" />
        <div class="mhBtext">Much like a suitcase for your pills. Consider
          our range of durable, light yet sturdy boxes
          that carry all your supplements
          under one roof.</div> </a>
        <div class="cl"></div>
          <a href="http://www.healthkart.com/sv/equinox-pill-cutter---eq-pb-19022/SP-24068?navKey=VRNT-46431">
        <img class="mhBimg" src="<hk:vhostImage/>/buying-guide/mensHealth/images/bottomImg4.png" />
        <div class="mhBtext">Hate when tablets get stuck in your throat?
          Split them into smaller size and swallow away.</div> </a>


        <div class="cl"></div>
      </div>
    </div>

    <!-- mhContainerInside2 close -->


  </div>
  <!-- mhContainerInside -->
  <a href="http://www.healthkart.com/vitamins-n-supplements/shop-by-usage/men-health?navKey=CL-911&itracker=w:cmenu|;p:3|;c:men-health|;"><img class="mrgn-bt-30" src="<hk:vhostImage/>/buying-guide/mensHealth/images/swallowNow.png" /></a>
</div>
<!-- mhContainer7 close -->

</div>
<!-- wrapper close -->


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