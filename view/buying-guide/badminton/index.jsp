<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>



<s:layout-render name="/buying-guide/bgGeneral.jsp" title="The art of badminton">
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
  <meta name="description" content="Get all information related to badminton rackets & shuttles at Healthkart.com. Read through an advanced guide to the art of playing badminton." />

  <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/buying-guide/badminton/css/badminton.css"
        media="screen">
</s:layout-component>

<s:layout-component name="bgContent">

<div class="wrapper">

<div class="header-images">
  <div class="image-left">
    <img src="<hk:vhostImage/>/buying-guide/badminton/images/top-image1.png" alt="Shuttlecock" style="margin:18px 0px 18px 40px;" />
    <img src="<hk:vhostImage/>/buying-guide/badminton/images/top-image2.png" alt="Badminton Player"/>
  </div>
  <!-- images left close -->

  <div class="image-right">
    <img src="<hk:vhostImage/>/buying-guide/badminton/images/top-image3.png" alt="The Art of Badminton" style="margin-bottom:32px;"/>
    <img src="<hk:vhostImage/>/buying-guide/badminton/images/top-image4.png" alt="Feather Shuttlecock" style="margin-bottom:34px;" />


    <p>In this page, you&#39;ll get to understand<br />
      how to select the right</p>

    <ul class="bmUl">
      <li><a href="#racket">RACKET</a></li>
      <li><a href="#shuttles">SHUTTLES</a></li>
      <li><a href="#healthBenefits">HOW IT IS GOOD FOR YOU</a></li>
      <li> <a href="#perfectKit">PERFECT KIT</a></li>
    </ul>

    <p><strong>READY PLAYER?</strong>  SCROLL DOWN &raquo;
    </p>
  </div>
  <!-- images right close -->
  <div class="cl"></div>


</div>
<!-- header images close -->
<div class="cl"></div>

<div class="bmContainer">

  <img src="<hk:vhostImage/>/buying-guide/badminton/images/line.png" alt="HealthKart" />
  <h1 class="bmHeading"><strong>RACKETS</strong><br />
    THE BASICS</h1>
  To understand which racket is best for you, one needs to understand what it is.
  <img src="<hk:vhostImage/>/buying-guide/badminton/images/badminton-info.png" alt="Badminton Information" style="padding-top:66px;" />

</div>
<!-- container1 close -->
<div class="cl"></div>


<div class="bmContainer">

  <img src="<hk:vhostImage/>/buying-guide/badminton/images/line.png" alt="HealthKart" />
  <h2 class="bmHeading"  id="racket"><strong>RACKETS</strong><br />
    A BIT MORE</h2>
  <div class="p-text">To ace the game you certainly require the techniques but what <br />
    you also need is the right racket. While picking up a racket, number of factors <br />
    should be taken into consideration.<br />
    <br /><i>The weight distribution of the racket kind of determines the performance.</i><br />
    The weight is distributed in three areas; towards the head, towards the handle or evenly balanced. <br /><br />
    <div class="icon-left"><img src="<hk:vhostImage/>/buying-guide/badminton/images/bmIcon1.png" align="right"/></div>
    <div class="iconP">When more of the weight is at the head, it is called head heavy <br />racket which is designed for the power player with an attacking game.</div>

    <div class="cl"></div>
    <br />
    <div class="iconP">A head light racket, is the one with the weight towards the handle which <br />
      feels lighter and is designed for a more defensive and control player.</div>
    <div class="icon-right"><img src="<hk:vhostImage/>/buying-guide/badminton/images/bmIcon2.png" align="left"/></div>
    <div class="cl"></div> <br />
    <div class="icon-left"><img src="<hk:vhostImage/>/buying-guide/badminton/images/bmIcon3.png" align="right"/></div>
    <div class="iconP">Third one would be an evenly balanced racket which is well suited <br />for an all-court player.</div>

    <div class="cl"></div>
    <img src="<hk:vhostImage/>/buying-guide/badminton/images/cross-line.png" style="margin-top:20px; float:left"  />


  </div>




</div>
<!-- container2 close -->
<div class="cl"></div>





<div class="bmContainerMiddle">
  <div class="bmHeading">DID YOU KNOW?</div>
  <div class="hen-image"><img src="<hk:vhostImage/>/buying-guide/badminton/images/racket-type.png" alt="Badminton Racket" /></div><div class="hen-text">The weight of a badminton racket <br />
  should not exceed more than 100 grams. <br /><br />
  A majority of racket manufacturers use 1U, 2U, 3U, 4U <br />
  to indicate the weight of the racket, 1U being the heaviest <br />
  and 4U the lightest. The weight of high quality rackets <br />
  range from 83 grams to 100 grams.<br />
  <br />
  The best shuttlecocks are made out of feathers from <br />
  the left wing of a goose.
</div>
  <div class="cl"></div>

</div>
<!-- bmContainerMiddle1 close-->
<div class="cl"></div>

<div class="bmContainerMiddle">

  <img src="<hk:vhostImage/>/buying-guide/badminton/images/line.png" />
  <h3 class="bmHeading"><strong>RACKETS</strong><br />
    THE RIGHT RACKET FOR YOU</h3>
  <div class="bmHeading">ARE YOU A BEGINNER?</div><div class="p-text">
  Beginners should opt for an isometric framed racket which has <br />
  a larger sweet spot. It is slightly wider than the conventional <br />
  frame and the top of the head is squared off. <br />
  It is good for beginners as it helps perform quality shots with ease.<br />
  <br />
  for a beginner, may we suggest
</div>
  <div style="text-align: left;">
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="48831,48835,48832" showAddToCart="true"/>
  </div>

  <img src="<hk:vhostImage/>/buying-guide/badminton/images/cross-line.png" style="margin-top:20px;" />




  <div class="bmHeading">ARE YOU AN ENTHUSIAST?</div><div class="p-text">
  Intermediate level players should first try their hands on <br />
  isometric framed rackets. Once they feel they are a pro <br />
  in playing with isometric framed racket only then <br />
  they should move on to conventional frames.<br />
  <br />
  for the enthusiasts, may we suggest
</div>

  <div style="text-align: left;">
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="39596,45734,48840" showAddToCart="true"/>
  </div>



  <img src="<hk:vhostImage/>/buying-guide/badminton/images/cross-line.png" style="margin-top:20px;" />



  <div class="bmHeading">ARE YOU A PRO?</div><div class="p-text">
  Professionals should pick up conventional framed <br />
  rackets which offer more concentrated power. <br />
  They are oval in shape and have a smaller sweet spot.<br />
  <br />
  for the pros, may we suggest
</div>

  <div style="text-align: left;">
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="22189,40315,23783" showAddToCart="true"/>
  </div>



  <img src="<hk:vhostImage/>/buying-guide/badminton/images/line.png" style="margin-top:20px;" />

  <h3 class="bmHeading" id="shuttles"><strong>SHUTTLES</strong><br />
    THE RIGHT SHUTTLES FOR YOU</h3>
  <div class="p-text">
    As shiny or perfect a racket may seem but you always need <br />
    a shuttle to play a game.<br />
    The official badminton shuttle is made using a variety of goose <br />
    and duck feathers whereas; synthetic shuttle is made out of plastic. <br />
    Feathered shuttles are preferred over synthetic ones because <br />
    feathered shuttles are lighter and provide more drag during travel.<br />
    The speed at which the shuttle travels is also affected by the weather,<br />
    altitude and temperature. Shuttle flies faster when it is hot and slower during cold days.

  </div>

  <div style="text-align: left;">
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="20710,45593,23824" showAddToCart="true"/>
  </div>



  <img src="<hk:vhostImage/>/buying-guide/badminton/images/cross-line.png" style="margin-top:20px;" />



</div>
<!-- bmContainerMiddle2 close-->
<div class="cl"></div>

<div class="bmContainer" id="healthBenefits">


  <h4 class="bmHeading">BADMINTON IS GOOD FOR YOU!</h4>



  <div class="gfu-left">
    <img src="<hk:vhostImage/>/buying-guide/badminton/images/gfu-image1.png" alt="About Badminton Rackets" style="padding-bottom:30px;" />

    <div class="p-text">Indulging in physical activities is always a good idea and <br />
      it is all the more awesome,<br />
      if you relish it. There is no doubt about badminton being one <br />
      of the popular games amongst different age groups but then <br />
      most of us are unaware about the number of health benefits <br />
      associated with the game.<br />
      Playing badminton is a good aerobic activity that improves fitness<br />
      with more oxygen circulated around the body. Apart from boosting <br />
      flexibility, strength and sprint speed, it also improves your hand-eye<br />
      co-ordination and concentration.
    </div>

  </div>

  <div class="gfu-right"><img src="<hk:vhostImage/>/buying-guide/badminton/images/gfu-image2.png" alt="Badminton Rules" /></div>

  <div class="cl"></div>


</div>
<!-- container3 close -->
<div class="cl"></div>



<div class="bmContainerMiddle">

  <img src="<hk:vhostImage/>/buying-guide/badminton/images/line.png" />
  <h4 class="bmHeading" id="perfectKit">THE PERFECT KIT</h4>
  <div class="p-text">
    <strong>For the pros,</strong> may we suggest a kit that comprises <br />
    conventional framed rackets and shuttles that could give your game that extra kick.<br />
    <br /><strong>For the enthusiasts,</strong> may we suggest a kit that could maintain <br />
    your enthusiasm with rackets, shuttles, net poles and a net. <br />
    <br />
    <strong>For the beginners,</strong> may we suggest a kit that has isometric <br />
    framed rackets, shuttles and a shuttle key chain.</div>

  <div style="text-align: left;">
    <s:layout-render name="/buying-guide/badminton/bmCatalogLayout.jsp" vid="45603,22182,45600" showAddToCart="true"/>
  </div>

  <!-- bmContainerMiddle3 close-->
</div>


</div>


</s:layout-component>

<s:layout-component name="bgScriptComponent">
  <script>
    $(document).ready(function () {

    });

  </script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
</s:layout-component>
</s:layout-render>