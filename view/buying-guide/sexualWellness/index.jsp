<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>



<s:layout-render name="/buying-guide/bgGeneral.jsp" title="Herbal Vitamins & Supplements for Sexual Wellness">
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


  <style>
    @font-face {
      font-family: 'Open Sans';
      font-style: normal;
      font-weight: 400;
      src: local('Open Sans'), local('OpenSans'), url(http://themes.googleusercontent.com/licensed/font?kit=cJZKeOuBrn4kERxqtaUH3eQMgGoy_nKaqo2cKJRLrBJdxlT5RfGIy95sQWGkHIXZT_wDREvo4O6_6v9ljamcpjDjNODm32iLRYw2SNTAhDi20L9efk2PUOdb5H1Th4EY) format('woff2'), url(http://themes.googleusercontent.com/licensed/font?kit=cJZKeOuBrn4kERxqtaUH3Rfzzo0OiUYJdfKM9TmUas1dxlT5RfGIy95sQWGkHIXZT_wDREvo4O6_6v9ljamcpjDjNODm32iLRYw2SNTAhDi20L9efk2PUOdb5H1Th4EY) format('woff');
    }

    @font-face {
      font-family: 'Open Sans';
      font-style: normal;
      font-weight: 600;
      src: local('Open Sans Semibold'), local('OpenSans-Semibold'), url(http://themes.googleusercontent.com/licensed/font?kit=MTP_ySUJH_bn48VBG8sNSoQSOEeazGh8gh9HUNTvrRMFjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff2'), url(http://themes.googleusercontent.com/licensed/font?kit=MTP_ySUJH_bn48VBG8sNSjBj4j7RKzZd-IY3pDfmla0FjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff');
    }

    @font-face {
      font-family: 'Open Sans';
      font-style: normal;
      font-weight: 700;
      src: local('Open Sans Bold'), local('OpenSans-Bold'), url(http://themes.googleusercontent.com/licensed/font?kit=k3k702ZOKiLJc3WVjuplzIQSOEeazGh8gh9HUNTvrRMFjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff2'), url(http://themes.googleusercontent.com/licensed/font?kit=k3k702ZOKiLJc3WVjuplzDBj4j7RKzZd-IY3pDfmla0FjxAsoMPe6KTmxHr8yBfIjVpFoe6rX3ET310906cqDO5a0y2yM-buDzIWb-IT1VZnJfANE-_pKN9C1ZsKTQQU) format('woff');
    }

    body {
      margin:0;
      padding:0;}

    .container2 {
      width:700px;
      margin:0 auto;
      padding:30px 0;
      overflow:hidden;}

    .blackCont {
      width:100%;
      color:#FFF;
      background-color:#000;}

    .headTxt {
      margin-left:180px;
      font-size:18px;
      line-height: 1.3em;
      float:left;}


    .downArrow2 {
      margin-top:0px;
      margin-right: 40px;
      float: right;}

    .cl {
      clear:both;}

    .container2 h3 {
      padding:5px 10px;
      color:#FFF;
      background-color:#fb8f00;
      float:left;
      text-transform:uppercase;
      font-size:18px;
    }

    .container2 h2 {
      font-size:42px;
      line-height:1em;
      text-transform:uppercase;
    }


    .container2 h4{
      font-size:24px;
      margin-bottom:15px;
    }

    .mainCauses {
      margin-top:30px;
    }
    .mainCauses > div{
      float:left;
      margin-right:40px;
      text-align:center;
    }
    .mainCauses > div:last-child{
      margin-right:0px;
    }

    .mainCauses > div > img{
      display:block;
      clear:both;
      text-align:center;
      margin-bottom:10px;
    }

    .mrgn-t-15 {
      margin-top:15px;}

    .solution {
      margin-top:30px;
      width:210px;
      float:left;}

    .solution img{
      float:left; }

    .solution span{
      font-size:18px;
      margin:10px 0 10px 65px;
      display:block;
    }


    .doneLast {
      margin-top:30px;
    }
    .doneLast > div{
      width:140px;
      float:left;
      margin-right:40px;
      text-align:center;
    }
    .doneLast > div:last-child{
      margin-right:0px;
    }

    .doneLast > div > img{
      display:block;
      clear:both;
      text-align:center;
      margin:0 auto;
    }

    .doneLast > div > p{
      margin-top: 10px;
    }

    .lastLink a, .lastLink a:hover {
      color: #fff;
      text-decoration: none;
    }

    ul.topLink {
      margin-top: 10px;
      padding-left: 17px;
      font-style: italic;
    }

    ul.topLink li{
      margin-top: 10px;
    }

    .readMore {
      font-size: 16px;
      padding-right: 10px;
    }

    .didYou {
      position:relative;
      text-align:center;
      text-transform: uppercase;
      height:530px;
      display: block;
      font-size: 18px;
      padding-top: 50px;
    }

    .didImg {
      position:absolute;
      width:150px;
    }

    .textBlue {
      font-style: italic;
      color: #06ffff;
    }

  </style>

</s:layout-component>

<s:layout-component name="bgContent">

<div class="container2 mrgn-b-25">
  <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/mainBanner.png" alt="Vitamins & Supplements for Sexual Wellness" />
  <div class="span7 headTxt">
    <div class="mrgn-b-20">A read on some common sexual problems, their causes and how herbal supplements </br>can help.</div>
    <span>It's more common than you think:</span>

  <ul class="topLink">
    <li><a href="javascript:void(0)" data-target="#next">Erectile Dysfunction</a></li>
    <li><a href="javascript:void(0)" data-target="#femaleSex">Female Sexual Dysfunction</a></li>
    <li><a href="javascript:void(0)" data-target="#inhibitedSex">Inhibited Sexual Desire</a></li>
    <li><a href="javascript:void(0)" data-target="#prematureEjaculation">Premature Ejaculation</a></li>
  </ul>

  </div>
  <div class="downArrow2"><a href="javascript:void(0)" data-target="#next"><span class="readMore">Read More</span><img src="images/downArrow.png" alt="Down Arrow" /></a></div>
</div><div class="cl"></div>
<!-- vsSW close -->


<div class="blackCont" id="next">
  <div class="container2">
    <h3>Condition #1</h3>
    <div class="cl"></div>
    <h2 class="mrgn-t-10">ERECTILE<br />
      DYSFUNCTION</h2>
    <p class="mrgn-t-10">It&#39;s the inability to attain or maintain erection<br />
      for an intercourse, also known as ED or impotence.</p>

    <div class="mainCauses">
      <h4>MAIN CAUSES</h4>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/bloodFlow.png" alt="Blood Flow" />
        <span>Blood Flow</span>
      </div>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/nerveDisorder.png" alt="Nerve Disorder" />
        <span>Nerve Disorder</span>
      </div>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/obesity.png" alt="Obesity" />
        <span>Obesity</span>
      </div>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/smoking.png" alt="Smoking" />
        <span>Smoking</span>
      </div>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/stress.png" alt="Stress" />
        <span>Stress</span>
      </div>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/injury.png" alt="Injury" />
        <span>Injury</span>
      </div>
    </div>

  </div>
</div><div class="cl"></div>
<!-- Erectile Dysfunction close -->

<div class="container2">
  <h3 class="mrgn-t-10">THE SOLUTION</h3>
  <h2 class="cont-lft mrgn-lr-10">HERBS</h2>
  <h4 class="mrgn-t-15">to your rescue</h4>
  <div class="cl"></div>

  <div class="solution">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/hornyGoatweed.png" />
    <span>Horny Goat Weed</span>
    <div class="cl"></div>
    <p>They call it bishop's hat, fairy wings and rowdy lamb herb. Locked with aphrodisiac properties,
      the herb is known to increase libido to boost your sexual performance and relieve you from erectile dysfunction (ED) & involuntary ejaculation.</p>
  </div>


  <div class="solution mrgn-l-30">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/withaniaSomnifera.png" />
    <span>Withania Somnifera</span>
    <div class="cl"></div>
    <p>The root with strong &quot;horse-like&quot; aroma is commonly known as Ashwagandha.
      For people with low sex drive, it stimulates blood flow, helps maintain an erection for longer. </p>
  </div>

  <div class="solution mrgn-l-30">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/ginkgoBiloba.png" />
    <span>Ginkgo Biloba</span>
    <div class="cl"></div>
    <p>According to studies, Ginkgo enhances the effects of nitric oxide that allows more blood flow to your genital organs. </p>
  </div>

   <div class="cl"></div>
  <s:layout-render name="/buying-guide/sexualWellness/sexualWellnessCatalogLayout.jsp" vid="13183,14528,42576" showAddToCart="true"/>

</div>
<!-- Herbs to your rescue 1 close -->


<div class="blackCont" id="femaleSex">
  <div class="container2">
    <div class="cont-lft" style="width:320px">
    <h3>Condition #2</h3>
    <div class="cl"></div>
    <h2 class="mrgn-t-10">FEMALE SEXUAL <br />
      DYSFUNCTION</h2>
    <p class="mrgn-bt-10">It is that condition when a women is unable<br />
      to seek pleasure out of an intercourse.</p>
    <img class="mrgn-t-10" src="<hk:vhostImage/>/buying-guide/sexualWellness/images/humanFig.png" />
    <img class="mrgn-bt-15" src="<hk:vhostImage/>/buying-guide/sexualWellness/images/1in4women.png" alt="1 in 4 women" />
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/40women.png" />
    <div class="cl"></div>
    <p class="mrgn-t-20">It has been estimated that about 40%
      of women are affected by sexual dysfunction to some extent & approximately 1 in 4 women are unable to achieve orgasm </p>

  </div>

    <div class="cont-rht mrgn-t-35" style="text-align:center; width:380px;">
      <h4 class="mrgn-b-35">MAIN CAUSES</h4>
      <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/mainCouses.png" alt="Main Causes" />
    </div>

  </div>
</div>
<!-- Female Sexual Dysfuncion close -->


<div class="container2">
  <h3 class="mrgn-t-10">THE SOLUTION</h3>
  <h2 class="cont-lft mrgn-lr-10">HERBS</h2>
  <h4 class="mrgn-t-15">to your rescue</h4>
  <div class="cl"></div>
  <div class="solution">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/mucunaPruriens.png" />
    <span>Mucuna Pruriens</span>
    <div class="cl"></div>
    <p>Known as Cowitch, this herb supports the production of a hormone commonly associated with the &#39;pleasure system&#39; of the brain. Besides, it is also useful in increasing sperm count and regularizing ovulation in women.</p>
  </div>

  <div class="solution mrgn-l-30">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/asparagusRacemosus.png" />
    <span>Asparagus Racemosus</span>
    <div class="cl"></div>
    <p>This  Queen of the herbs
      is also known as Shatavari which means &quot;a woman who possesses 100
      husbands&quot;, making it clear that it arouses sexual desire in women. </p>
  </div>

  <div class="solution mrgn-l-30">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/Saffron.png" />
    <span>Saffron </span>
    <div class="cl"></div>
    <p>Since the times when Cleopatra & Romans used Saffron in bathing water or on their marriage beds, this magical herb has been used as a an aphrodisiac that now comes in capsules too.</p>
  </div>
  <div class="cl"></div>
  <s:layout-render name="/buying-guide/sexualWellness/sexualWellnessCatalogLayout.jsp" vid="13700,37867,37883" showAddToCart="true"/>

</div>
<!-- Herbs to your rescue 2 close -->


<div class="blackCont" id="inhibitedSex">
  <div class="container2">
    <h3>Condition #3</h3>
    <div class="cl"></div>
    <h2 class="mrgn-t-10">INHIBITED<br />
      SEXUAL DESIRE</h2>
    <p class="mrgn-t-10">The problem is marked by loss of libido which<br />
      in simple words would mean less interest in a sexual activity.</p>

    <div class="mainCauses">
      <h4>MAIN CAUSES</h4>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/lowLevel.png" alt="Low levels of testosterone" />
            <span>Low levels <br />
of testosterone</span>
      </div>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/diabetesHighBP.png" alt="Diabetes & high BP" />
            <span>Diabetes<br />
& high BP</span>
      </div>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/probRelation.png" alt="Problematic relationship" />
            <span>Problematic<br />
relationship</span>
      </div>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/anxietyDepression.png" alt="Anxiety or depression" />
            <span>Anxiety<br />
or depression</span>
      </div>
    </div>

  </div>
</div><div class="cl"></div>
<!-- Inhibited Sexual Desire close -->

<div class="container2">
  <h3 class="mrgn-t-10">THE SOLUTION</h3>
  <h2 class="cont-lft mrgn-lr-10">HERBS</h2>
  <h4 class="mrgn-t-15">to your rescue</h4>
  <div class="cl"></div>
  <div class="solution">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/sawPalmetto.png" />
    <span>Saw Palmetto</span>
    <div class="cl"></div>
    <p>The herb has long been considered as an aphrodisiac & sexual rejuvenator. It is known to inhibit one of the active forms of testosterone in your body for a better sexual drive.</p>
  </div>

  <div class="solution mrgn-l-30">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/gokshura.png" />
    <span>Gokshura</span>
    <div class="cl"></div>
    <p>This small fruit look like hooves of cows, hence named as Gokshura-Go for Cow & Kshura for hoof.
      This one enhances testosterone levels & also revs-up male sexual performance.</p>
  </div>

  <div class="solution mrgn-l-30">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/safedMusli.png" />
    <span>Safed Musli </span>
    <div class="cl"></div>
    <p>The herb enhances the production of testosterone which improves your sexual drive. Besides, it is also used to enhance
      functioning of adrenal gland, important for sexual arousal.</p>
  </div>
  <div class="cl"></div>

  <s:layout-render name="/buying-guide/sexualWellness/sexualWellnessCatalogLayout.jsp" vid="13938,14527,44108" showAddToCart="true"/>

</div>
<!-- Herbs to your rescue 3 close -->

<div class="blackCont" id="prematureEjaculation">
  <div class="container2">
    <h3>Condition #4</h3>
    <div class="cl"></div>
    <h2 class="mrgn-t-10">PREMATURE<br />
      EJACULATION</h2>
    <p class="mrgn-t-10">Situation when you ejaculate or &#39;climax&#39; too early<br />
      during sex without satisfying your partner. </p>

    <div class="mainCauses">
      <h4>MAIN CAUSES</h4>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/noControl.png" alt="No control" />
        <span>No control</span>
      </div>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/phychoFactors.png" alt="Stress, Anxiety or other psychological factors" />
            <span>Stress, Anxiety<br />
            or other<br />
			psychological factors</span>
      </div>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/aging.png" alt="Aging" />
        <span>Aging</span>
      </div>
      <div><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/softErection.png" alt="Soft erection" />
        <span>Soft erection</span>
      </div>
    </div>

  </div>
</div><div class="cl"></div>
<!-- PREMATURE EJACULATION close -->

<div class="container2">
  <h3 class="mrgn-t-10">THE SOLUTION</h3>
  <h2 class="cont-lft mrgn-lr-10">HERBS</h2>
  <h4 class="mrgn-t-15">to your rescue</h4>
  <div class="cl"></div>
  <div class="solution">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/shilajeet.png" />
    <span>Shilajeet</span>
    <div class="cl"></div>
    <p>Being known as a &quot;conqueror of mountains & destroyer of weakness&quot;, this herb literally kills your sexual weakness & relieves you from premature ejaculation too. </p>
  </div>

  <div class="solution mrgn-l-30">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/basil.png" />
    <span>Basil</span>
    <div class="cl"></div>
    <p>Basil, known as a feel-good herb helps you to produce a sense of wellbeing for body & mind. While escalating your libido, it also stimulates your sex dive for a wilder side in you.</p>
  </div>
  <div class="cl"></div>

  <s:layout-render name="/buying-guide/sexualWellness/sexualWellnessCatalogLayout.jsp" vid="13704,15678" showAddToCart="true"/>


</div>
<!-- Herbs to your rescue 4 close -->

<div class="blackCont">
  <div class="container2">
    <img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/beenThere.png" />
    <p class="span7 headTxt mrgn-bt-15">Like our wardrobes, our sexual lives also need an upgradation.This is how you can come out of your cocoon and go all wild.
      Some home therapies to make things better between the sheets... </p>
    <div class="cl"></div>

    <div class="doneLast">
      <div><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/condoms?navKey=CL-414"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/flavouredCondom.png" alt="Condom to play safe" /></a>
        <p class="lastLink"><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/condoms?navKey=CL-414">Don&#39;t underestimate the power of lighting few candles.
          That, & also
          a <span class="textBlue"> flavored condom </span>to play safe.</a></p>
      </div>
      <div><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/sexual-enhancers?navKey=CL-415"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/oilMassage.png" alt="Lube for smooth play" /></a>
        <p class="lastLink"><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/sexual-enhancers?navKey=CL-415">Surprise your spouse with some warm oil massage &amp; keep an <span class="textBlue">organic lube</span> ready for a smooth play.</a></p> </div>
      <div><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/sexual-enhancers?navKey=CL-415"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/sprayHot.png" alt="Spray for prolonged fun" />  </a>
        <p class="lastLink"><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/sexual-enhancers?navKey=CL-415">If she is all set with hottest of her dresses, don&#39;t disappoint her even one bit, <span class="textBlue">prolonged sprays</span> will be your savior in need.</a> </p>
      </div>
      <div><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/condoms?navKey=CL-414"><img src="<hk:vhostImage/>/buying-guide/sexualWellness/images/femaleCondoms.png" alt="Female Condom" /></a>
        <p class="lastLink"><a href="http://www.healthkart.com/personal-n-baby-care/sexual-care/condoms?navKey=CL-414">Make it the other way round this time, you be the man and let him be your beloved. <span class="textBlue">Female condoms</span> at your service to play along.</a> </p>
      </div>
    </div>

  </div>
</div>

<div class="cl"></div>
<!-- PREMATURE EJACULATION close -->


<div class="container2 didYou">
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


<div class="cl"></div>
<!-- Did you know close -->


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