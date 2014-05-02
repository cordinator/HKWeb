<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/templates/landingPageContest.jsp" pageTitle="MuscleBlaze Strongman">

  <s:layout-component name="htmlHead">
    <style>

      img, a, img a, img a:hover, a:hover {border:none;}

      body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,form,fieldset,input,textarea,p,blockquote,th,td {
        margin:0;
        padding:0;
      }
      table {
        border-collapse:collapse;
        border-spacing:0;
      }

      body {
        font-size: 13px;
      }

      p, ul {
        margin : 10px 0;
      }
      ol,ul {
        list-style:none;
      }

      h1,h2,h3,h4,h5,h6 {
        font-size:100%;
        font-weight:normal;
      }

      .cl {
        clear:both;}

      .flot-l {
        float:left;}

      .flot-r {
        float:right;}

      a {color:#000;
        text-decoration:none;
        margin: 0;
        padding: 0;
      }

      a:hover {
        color:#285ca9;
      }
        /* Reset CSS close */

      #header .row {
        display: none;
      }
      .samples p {
        font-size: .9em;
      }
      .samples {
        padding: 10px;
        background-color: #d6ffff;
      }
      .rules li {
        list-style-position:inside;
        padding-bottom: 3px;
      }

     .content {
       line-height: 1.5em;
       margin-bottom: 20px;
     }

      h2 {
        font-size: 24px;
        margin-top: 20px;
        text-transform: uppercase;
      }

      li {
        margin-bottom: 10px;
      }
    </style>
  </s:layout-component>

  <s:layout-component name="content">
      <div id="fb-root"></div>
      <script>(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=130363280399851";
          fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>

      <div class="span16" style="margin-bottom: 20px;">

    <div style="text-align: center;"><img src="<hk:vhostImage/>/lp/images/MB_header_banner.jpg"/></div>

    <p>
      You have been working out, lifting heavy, panting and sweating for a long time. If strength is glory for you, then
      it’s time to amaze the world with your one feat of strength. Make everyone’s jaw drop by lifting an elephant or by
      pulling a loaded bus or by bench pressing double your body weight or by tossing huge logs through the air- choice
      is completely yours! If you are out of ideas- then it's probably a good idea to show us what your 1 rep max is.
    </p>

    <p>
      Demonstrate your unbelievable feat of power and take away the title of MuscleBlaze Strongman, a <strong>whopping cash prize of Rs.15,000</strong>
      and MuscleBlaze vouchers worth Rs.5000. Many more prizes to be won, scroll down for details and rules.
      <span style="font-weight: bold; font-style: italic;">Do you have it in you?</span>
    </p>

    <iframe src='http://woobox.com/9oub5y'
            frameborder='0'
            height='920'
            width='100%'
            >
    </iframe>

    <div class="clearfix"></div>

    <div class="content span16">

      <h2>Scoring Procedure</h2>

      <p>Every &#39;like&#39; on your video will fetch you one point. To increase your chances to win, get your friends and
        family to like and share your video. The hunt ends on 31st January 2014. The winner(s) will be announced
        shortly, once all&nbsp;the votes are processed.&nbsp;</p>

      <h2>Prizes</h2>

      <ul>
        <li>1. <b>First Prize:</b> Rs.15,000 cash with MuscleBlaze vouchers worth Rs. 5000</li>
        <li>2. <b>Second Prize:</b> Rs.10,000 cash &nbsp;with MuscleBlaze vouchers worth Rs. 5000</li>
        <li>3. <b>Third Prize:</b> Rs. 5000 cash with MuscleBlaze vouchers worth Rs. 5000</li>
        <li>4. <b>5 Consolation Prizes:</b> MuscleBlaze vouchers worth Rs.1000 each</li>
      </ul>

      <h2>Rules</h2>

      <ul>
        <li>1. This competition is open to Indian residents and anyone above 18 years or above</li>
        <li>2. One entry per person only</li>
        <li>3. Its mandatory for the participants to say the introductory line - &quot;This is my entry for MuscleBlaze StrongMan&quot; either in hindi or english in <br>the video</li>
        <li>4. Obscene display, foul language, poor picture quality and non-youtube videos will lead to
          disqualification
        </li>
        <li>5. All the submitted videos will be the sole property of the organizers</li>
        <li>6. TDS applicable on prizes</li>
        <li>7. <a target="_blank" href="http://bit.ly/1c10gVg">Terms and conditions</a> apply*</li>

      </ul>

      <h2 style="margin-bottom: 15px;">Comments</h2>
      <div class="fb-comments" data-href="http://www.healthkart.com/lp/mbStrongMan.jsp" data-width="960" data-numposts="5" data-colorscheme="light"></div>

    </div>

  </s:layout-component>
</s:layout-render>
