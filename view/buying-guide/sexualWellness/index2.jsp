<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>



<s:layout-render name="/buying-guide/sexualWellness/swGeneral.jsp" title="Herbal Vitamins & Supplements for Sexual Wellness">
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
  <meta name="description" content="Sexual wellness - Learn about of the common sexual problems, their reasons and some herbal vitamins & supplements to rescue them." />
  <meta name="keywords" content="Sexual Wellness, Sexual Benefits, Sexual Vitamins, Sexual Supplements" />


  <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/buying-guide/sexualWellness/css/sexWellness.css" media="screen">
  <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/buying-guide/sexualWellness/css/bootstrap-theme" media="screen">
  <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/buying-guide/sexualWellness/css/bootstrap.css" media="screen">

  <style>
    .container {
      background: none;
      padding:50px 0;
    }

    body {
      min-width: 100% !important;
    }

  </style>

</s:layout-component>

<s:layout-component name="bgContent">

<div class="container">
  <div class="col-md-12">
    <div style="text-align: center; border-bottom: 1px solid #b4b4b4; padding-bottom:10px; margin-bottom: 30px;">
    <a href="http://www.healthkart.com/"> <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/HK-Logo.png"/>      </a>
    </div>

    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/mainBanner.png" class="img-responsive"/>
    <div class="col-md-7 col-md-offset-3 headTxt">
      <div class="mrgn-b-20">A read on some common sexual problems, their causes and how herbal supplements can help.</div>
      <span>It's more common than you think:</span>

      <ul class="topLink">
        <li><a href="javascript:void(0)" data-target="#next">Erectile Dysfunction</a></li>
        <li><a href="javascript:void(0)" data-target="#femaleSex">Female Sexual Dysfunction</a></li>
        <li><a href="javascript:void(0)" data-target="#inhibitedSex">Inhibited Sexual Desire</a></li>
        <li><a href="javascript:void(0)" data-target="#prematureEjaculation">Premature Ejaculation</a></li>
      </ul>


    </div>
    <div class="downArrow2"><a href="javascript:void(0)" data-target="#next"><span class="readMore">Read More</span><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/downArrow.png" alt="Down Arrow" /></a></div>
    <!--- header Close --->
  </div>
</div>
<!--- <!-- vsSW Conatienr Close --->

<div class="blackCont" id="next">
  <div class="container">
    <div class="col-md-12">
      <h3>Condition #1</h3>
      <div class="cl"></div>
      <h2 class="mrgn-t-10">ERECTILE<br />
        DYSFUNCTION</h2>
      <div class="row">
        <p class="col-md-7 mrgn-t-10">It&#39;s the inability to attain or maintain erection
          for an intercourse, also known as ED or impotence.</p></div>

      <div class="mainCauses">
        <h4>MAIN CAUSES</h4>
        <div class="mrgn-b-20"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/bloodFlow.png" alt="Blood Flow" />
          <span>Blood Flow</span>
        </div>
        <div class="mrgn-b-20"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/nerveDisorder.png" alt="Nerve Disorder" />
          <span>Nerve Disorder</span>
        </div>
        <div class="mrgn-b-20"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/obesity.png" alt="Obesity" />
          <span>Obesity</span>
        </div>
        <div class="mrgn-b-20"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/smoking.png" alt="Smoking" />
          <span>Smoking</span>
        </div>
        <div class="mrgn-b-20"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/stress.png" alt="Stress" />
          <span>Stress</span>
        </div>
        <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/injury.png" alt="Injury" />
          <span>Injury</span>
        </div>
      </div>


    </div>
    <!--- Conatienr Close --->
  </div>
</div>
<!--- Erectile Dysfunction Conatienr Close --->

<div class="container">
  <div class="col-md-12">
    <h3 class="mrgn-bt-10">THE SOLUTION</h3>
    <div class="cl"></div>
    <div class="col-md-11 row">
      <h2 class="cont-lft mrgn-r-10">HERBS</h2>
      <h4 class="mrgn-t-15">to your rescue</h4></div>
    <div class="cl"></div>
    <div class="row">
      <div class="col-md-4 col-sm-4 col-xs-12 mrgn-t-15">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/hornyGoatweed.png" class="float-l" />
        <span class="herb-span">Horny Goat Weed</span>
        <div class="cl"></div>
        <p>They call it bishop's hat, fairy wings and rowdy lamb herb. Locked with aphrodisiac properties,
          the herb is known to increase libido to boost your sexual performance and relieve you from erectile dysfunction (ED) & involuntary ejaculation.</p>
      </div>


      <div class="col-md-4 col-sm-4 col-xs-12 mrgn-t-15">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/withaniaSomnifera.png" class="float-l" />
        <span class="herb-span">Withania Somnifera</span>
        <div class="cl"></div>
        <p>The root with strong &quot;horse-like&quot; aroma is commonly known as Ashwagandha.
          For people with low sex drive, it stimulates blood flow, helps maintain an erection for longer. </p>
      </div>

      <div class="col-md-4 col-sm-4 col-xs-12 mrgn-t-15">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/ginkgoBiloba.png" class="float-l" />
        <span class="herb-span">Ginkgo Biloba</span>
        <div class="cl"></div>
        <p>According to studies, Ginkgo enhances the effects of nitric oxide that allows more blood flow to your genital organs. </p>
      </div>

    </div>
    <s:layout-render name="/buying-guide/sexualWellness/sexualWellnessCatalogLayout.jsp" vid="13183,14528,42576" showAddToCart="true"/>

  </div>
</div>
<!-- Herbs to your rescue 1 close -->

<div class="blackCont" id="femaleSex">
  <div class="container">
    <div class="col-md-6">
      <h3>Condition #2</h3>
      <div class="cl"></div>
      <h2 class="mrgn-t-10">FEMALE SEXUAL DYSFUNCTION</h2>
      <p class="mrgn-bt-10">It is that condition when a women is unable to seek pleasure out of an intercourse.</p>
      <div><img class="mrgn-t-10" src="<hk:vhostImage/>/buying-guide/sexualWellness/images/humanFig.png" /></div>
      <div><img class="mrgn-bt-15" src="<hk:vhostImage/>/buying-guide/sexualWellness/images/1in4women.png" alt="1 in 4 women" /></div>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/40women.png" /></div>
      <div class="cl"></div>
      <p class="mrgn-t-20">It has been estimated that about 40% of women are affected by sexual dysfunction to some extent & approximately 1 in 4 women are unable to achieve orgasm </p>
    </div>

    <div class="col-md-6 mrgn-t-35">
      <h4 class="mrgn-b-35">MAIN CAUSES</h4>
      <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/mainCouses.png" alt="Main Causes" class="img-responsive mrgn-t-20" />
    </div>

  </div>
</div>
<!-- Female Sexual Dysfuncion close -->

<div class="container">
  <div class="col-md-12">
    <h3 class="mrgn-bt-10">THE SOLUTION</h3>
    <div class="cl"></div>
    <div class="col-md-11 row">
      <h2 class="cont-lft mrgn-r-10">HERBS</h2>
      <h4 class="mrgn-t-15">to your rescue</h4></div>
    <div class="cl"></div>
    <div class="row">
      <div class="col-md-4 col-sm-4 col-xs-12 mrgn-t-15">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/mucunaPruriens.png" class="float-l" />
        <span class="herb-span">Mucuna Pruriens</span>
        <div class="cl"></div>
        <p>Known as Cowitch, this herb supports the production of a hormone commonly associated with the &#39;pleasure system&#39; of the brain. Besides, it is also useful in increasing sperm count and regularizing ovulation in women.</p>
      </div>

      <div class="col-md-4 col-sm-4 col-xs-12 mrgn-t-15">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/asparagusRacemosus.png" class="float-l" />
        <span class="herb-span">Asparagus Racemosus</span>
        <div class="cl"></div>
        <p>This  Queen of the herbs
          is also known as Shatavari which means &quot;a woman who possesses 100
          husbands&quot;, making it clear that it arouses sexual desire in women. </p>
      </div>

      <div class="col-md-4 col-sm-4 col-xs-12 mrgn-t-15">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/Saffron.png" class="float-l" />
        <span class="herb-span">Saffron </span>
        <div class="cl"></div>
        <p>Since the times when Cleopatra & Romans used Saffron in bathing water or on their marriage beds, this magical herb has been used as a an aphrodisiac that now comes in capsules too.</p>
      </div>
    </div>
    <s:layout-render name="/buying-guide/sexualWellness/sexualWellnessCatalogLayout.jsp" vid="13700,37867,37883" showAddToCart="true"/>
  </div>
</div>
<!-- Herbs to your rescue 2 close -->

<div class="blackCont" id="inhibitedSex">
  <div class="container">
    <div class="col-md-12">
      <h3>Condition #3</h3>
      <div class="cl"></div>
      <h2 class="mrgn-t-10">INHIBITED<br />
        SEXUAL DESIRE</h2>
      <div class="row">
        <p class="mrgn-t-10 col-md-7">The problem is marked by loss of libido which
          in simple words would mean less interest in a sexual activity.</p></div>

      <div class="mrgn-t-20" style="text-align:center">
        <h4 style="text-align:left">MAIN CAUSES</h4>
        <div class="col-md-3 mob-w-50"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/lowLevel.png" alt="Low levels of testosterone" /><div class="cl"></div>
          <span>Low levels of testosterone</span>
        </div>
        <div class="col-md-3 mob-w-50"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/diabetesHighBP.png" alt="Diabetes & high BP" /><div class="cl"></div>
          <span>Diabetes & high BP</span>
        </div>
        <div class="col-md-3 mob-w-50"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/probRelation.png" alt="Problematic relationship" /><div class="cl"></div>
          <span>Problematic relationship</span>
        </div>
        <div class="col-md-3 mob-w-50"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/anxietyDepression.png" alt="Anxiety or depression" /><div class="cl"></div>
          <span>Anxiety or depression</span>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Inhibited Sexual Desire close -->

<div class="container">
  <div class="col-md-12">
    <h3 class="mrgn-bt-10">THE SOLUTION</h3>
    <div class="cl"></div>
    <div class="col-md-11 row">
      <h2 class="cont-lft mrgn-r-10">HERBS</h2>
      <h4 class="mrgn-t-15">to your rescue</h4></div>
    <div class="cl"></div>
    <div class="row">
      <div class="col-md-4 col-sm-4 col-xs-12 mrgn-t-15">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/sawPalmetto.png" class="float-l" />
        <span class="herb-span">Saw Palmetto</span>
        <div class="cl"></div>
        <p>The herb has long been considered as an aphrodisiac & sexual rejuvenator. It is known to inhibit one of the active forms of testosterone in your body for a better sexual drive.</p>
      </div>

      <div class="col-md-4 col-sm-4 col-xs-12 mrgn-t-15">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/gokshura.png" class="float-l" />
        <span class="herb-span">Gokshura</span>
        <div class="cl"></div>
        <p>This small fruit look like hooves of cows, hence named as Gokshura-Go for Cow & Kshura for hoof.
          This one enhances testosterone levels & also revs-up male sexual performance.</p>
      </div>

      <div class="col-md-4 col-sm-4 col-xs-12 mrgn-t-15">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/safedMusli.png" class="float-l" />
        <span class="herb-span">Safed Musli </span>
        <div class="cl"></div>
        <p>The herb enhances the production of testosterone which improves your sexual drive. Besides, it is also used to enhance
          functioning of adrenal gland, important for sexual arousal.</p>
      </div></div>

    <s:layout-render name="/buying-guide/sexualWellness/sexualWellnessCatalogLayout.jsp" vid="13938,14527,44108" showAddToCart="true"/>
  </div>
</div>
<!-- Herbs to your rescue 3 close -->

<div class="blackCont" id="prematureEjaculation">
  <div class="container">
    <div class="col-md-12">
      <h3>Condition #4</h3>
      <div class="cl"></div>
      <h2 class="mrgn-t-10">PREMATURE<br />
        EJACULATION</h2>
      <div class="row">
        <p class="col-md-6 mrgn-t-10">Situation when you ejaculate or &#39;climax&#39; too early
          during sex without satisfying your partner. </p></div>

      <div class="mrgn-t-20" style="text-align:center">
        <h4 style="text-align:left">MAIN CAUSES</h4>
        <div class="col-md-3 mob-w-50 mrgn-b-20"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/noControl.png" alt="No control" /><div class="cl"></div>
          <span>No control</span>
        </div>
        <div class="col-md-3 mob-w-50 mrgn-b-20"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/phychoFactors.png" alt="Stress, Anxiety or other psychological factors" /><div class="cl"></div>
            <span>Stress, Anxiety<br />
            or other<br />
			psychological factors</span>
        </div>
        <div class="col-md-3 mob-w-50 mrgn-b-20"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/aging.png" alt="Aging" /><div class="cl"></div>
          <span>Aging</span>
        </div>
        <div class="col-md-3 mob-w-50"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/softErection.png" alt="Soft erection" /><div class="cl"></div>
          <span>Soft erection</span>
        </div>
      </div>

    </div>
  </div></div>
<!-- PREMATURE EJACULATION close -->

<div class="container">
  <div class="col-md-12">
    <h3 class="mrgn-bt-10">THE SOLUTION</h3>
    <div class="cl"></div>
    <div class="col-md-11 row">
      <h2 class="cont-lft mrgn-r-10">HERBS</h2>
      <h4 class="mrgn-t-15">to your rescue</h4></div>
    <div class="cl"></div>
    <div class="row">
      <div class="col-md-5 col-sm-5 col-xs-12 mrgn-t-15">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/shilajeet.png" class="float-l" />
        <span class="herb-span">Shilajeet</span>
        <div class="cl"></div>
        <p>Being known as a &quot;conqueror of mountains & destroyer of weakness&quot;, this herb literally kills your sexual weakness & relieves you from premature ejaculation too. </p>
      </div>

      <div class="col-md-5 col-sm-5 col-xs-12 mrgn-t-15">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/basil.png" class="float-l" />
        <span class="herb-span">Basil</span>
        <div class="cl"></div>
        <p>Basil, known as a feel-good herb helps you to produce a sense of wellbeing for body & mind. While escalating your libido, it also stimulates your sex dive for a wilder side in you.</p>
      </div>
    </div>

    <s:layout-render name="/buying-guide/sexualWellness/sexualWellnessCatalogLayout.jsp" vid="13704,15678" showAddToCart="true"/>


  </div></div>
<!-- Herbs to your rescue 4 close -->

<div class="blackCont">
  <div class="container">
    <div class="col-md-12">
      <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/beenThere.png" class="img-responsive" />
      <div class="row">
        <p class="col-md-7 col-md-offset-3 col-xs-12 mrgn-t-15">Like our wardrobes, our sexual lives also need an upgradation.This is how you can come out of your cocoon and go all wild.
          Some home therapies to make things better between the sheets... </p>
      </div>

      <div class="row mrgn-t-20" style="text-align:center">
        <div class="col-md-3 mob-w-50 mrgn-b-20"><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/condoms?navKey=CL-414"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/flavouredCondom.png" alt="Condom to play safe" /></a>
          <p class="lastLink"><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/condoms?navKey=CL-414">Don&#39;t underestimate the power of lighting few candles.
            That, & also
            a <span class="textBlue"> flavored condom </span>to play safe.</a></p>
        </div>

        <div class="col-md-3 mob-w-50 mrgn-b-20"><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/sexual-enhancers?navKey=CL-415"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/oilMassage.png" alt="Lube for smooth play" /></a>
          <p class="lastLink"><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/sexual-enhancers?navKey=CL-415">Surprise your spouse with some warm oil massage &amp; keep an <span class="textBlue">organic lube</span> ready for a smooth play.</a></p> </div>

        <div class="col-md-3 mob-w-50 mrgn-b-20"><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/sexual-enhancers?navKey=CL-415"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/sprayHot.png" alt="Spray for prolonged fun" />  </a>
          <p class="lastLink"><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/sexual-enhancers?navKey=CL-415">If she is all set with hottest of her dresses, don&#39;t disappoint her even one bit, <span class="textBlue">prolonged sprays</span> will be your savior in need.</a> </p>
        </div>

        <div class="col-md-3 mob-w-50 mrgn-b-20"><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/condoms?navKey=CL-414"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/femaleCondoms.png" alt="Female Condom" /></a>
          <p class="lastLink"><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/condoms?navKey=CL-414">Make it the other way round this time, you be the man and let him be your beloved. <span class="textBlue">Female condoms</span> at your service to play along.</a> </p>
        </div>
      </div>

    </div>
  </div>

</div><div class="cl"></div>
<!-- PREMATURE EJACULATION close -->


<div class="container didYou-sm"">
  <div class="col-md-12 didYou" style="margin-bottom: 50px;">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/didYouKnow.png" />

    <div class="didImg" style="margin-top: -200px;">
      <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/discreetPackaging.png" />
      <div class="mrgn-t-10">Discreet packaging</div>
    </div>

    <div class="didImg" style="margin-left: 130px; margin-top: 20px;">
      <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/authenticProducts.png" />
      <div class="mrgn-t-10">Authentic products</div>
    </div>

    <div class="didImg" style="margin-left: 420px; margin-top: 20px;">
      <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/wideRange.png" />
      <div class="mrgn-t-10">Wide range of products</div>
    </div>

    <div class="didImg" style="margin-left: 550px; margin-top: -200px;">
      <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/deliveryDoorstep.png" />
      <div class="mrgn-t-10">Delivery at your doorstep</div>
    </div>


  </div>


</div>
<!-- Did you know - Desktop close -->

<div class="container didYou-m" style="text-align:center;">
  <div class="col-xs-12">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/didYouKnow.png" class="mrgn-b-25" />
    <div class="row">
      <div class="col-xs-6 mrgn-b-20">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/discreetPackaging.png"/>
        <div class="mrgn-t-10">Discreet packaging</div>
      </div>

      <div class="col-xs-6 mrgn-b-20">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/wideRange.png" />
        <div class="mrgn-t-10">Wide range of products</div>
      </div>

      <div class="col-xs-6">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/authenticProducts.png" />
        <div class="mrgn-t-10">Authentic products</div>
      </div>

      <div class="col-xs-6">
        <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/deliveryDoorstep.png" />
        <div class="mrgn-t-10">Delivery at your doorstep</div>
      </div>
    </div>



  </div>
</div>
<!-- Did you know - mobile close -->
<div class="cl"></div>

<div class="container" style="text-align: center; border-top: 1px solid #b4b4b4; ">CopyRight &copy; 2013-2014, HealthKart.com, or its affiliates</div>


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


  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>


</s:layout-component>
</s:layout-render>