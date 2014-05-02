<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/templates/landingPageContest.jsp" pageTitle="Kill your Bill!">

  <s:layout-component name="htmlHead">
    <style>
      #header .row {
        display: none;
      }
      .wrapper h2 {
        padding-bottom: 15px;
        padding-top: 5px;
        /*background-color: yellow;*/
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
      /* jQuery Countdown styles 1.6.3. */
      .hasCountdown {
      	border: 1px solid #ccc;
      	background-color: #eee;
          font-size: 2em;
          text-align: center;
          margin: 10px 0;
          padding: 10px 0;
      }
      .countdown_rtl {
      	direction: rtl;
      }
      .countdown_holding span {
      	color: #888;
      }
      .countdown_row {
      	clear: both;
      	width: 100%;
      	padding: 0px 2px;
      	text-align: center;
      }
      .countdown_show1 .countdown_section {
      	width: 98%;
      }
      .countdown_show2 .countdown_section {
      	width: 48%;
      }
      .countdown_show3 .countdown_section {
      	width: 32.5%;
      }
      .countdown_show4 .countdown_section {
      	width: 24.5%;
      }
      .countdown_show5 .countdown_section {
      	width: 19.5%;
      }
      .countdown_show6 .countdown_section {
      	width: 16.25%;
      }
      .countdown_show7 .countdown_section {
      	width: 14%;
      }
      .countdown_section {
      	display: block;
      	float: left;
      	font-size: 75%;
      	text-align: center;
      }
      .countdown_amount {
      	font-size: 200%;
      }
      .countdown_descr {
      	display: block;
      	width: 100%;
      }
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.countdown.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        $('.menuContest').css('font-weight', 'bold');
        var austDay = new Date();
        austDay = new Date("Dec 03, 2013 09:59 PM");
        var sinceDay = new Date();
        sinceDay = new Date("Dec 03, 2013 12:00 PM");
        var currDate = new Date();
        if (false) {
          $('#countdown').countdown({
            until: austDay,
            since: sinceDay,
            significant: 4,
            layout : '<strong>{dn}</strong> D : <strong>{hn}</strong> H : <strong>{mn}</strong> M : <strong>{sn}</strong> S left. Enter Now!'
          });
        }
      });
    </script>
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

    <%--<h1 style="text-align: center; padding: 20px 0 30px 0">Twitter Contest : Win Rs. 250 vouchers every hour!</h1>--%>

    <div class="span16" style="margin-bottom: 20px;">
      <div id="countdown"></div>
      <img src="${pageContext.request.contextPath}/lp/images/killbill.png"/>
    </div>

    <div style="min-height: 700px;">
    <div class="span8">
      <div style="padding: 10px; background-color: #fff100;">
      <h2><strong>10 Grand Prizes!</strong></h2>
      <p><strong>10 winners will get their HealthKart orders for free!</strong></p>
      <p style="font-size: .9em;">
        For every winner, the full amount of their order will be refunded as HealthKart reward points.
        See rules below for full details and terms and conditions.<br/><br/>
        <strong>You must enter your order id in the contest form on the right to be eligible for the grand prize.</strong> The order id option will reveal only
        after you complete the first two entry options (like on facebook and enter registered email)
      </p>
      </div>
      <br/>
      <div style="padding: 10px; background-color: #ffef6c;">
      <h2><strong>Everyone</strong> gets Consolation Prizes</h2>
      <p>Don't trust your luck? No worries.. <br/><strong>No one will go empty handed</strong></p>
      <br/>
      <p style="font-size: .9em;">
        Everyone can earn reward points (redeemable on any HealthKart order) by entering this contest. We will give you
        reward points equal to the "Your Entries" count on the form on the right. See a sample below :
      </p>
      <br/>
      <p><img src="${pageContext.request.contextPath}/lp/images/contestWidgetEntries2.png"/></p>
      <p style="font-size: .9em">So for eg. If you have earned <strong>120 entries</strong>, we will credit <strong>120 reward points</strong> to your HealthKart account. 1 reward point equals 1 rupee.</p>
      <p style="font-size: .9em">You'll ofcourse have to leave your registered email id on the contest form.</p>
      </div>
      <br/>

      <h2>Tips to get more points/entries</h2>
      <ul class="rules" style="font-size: .9em;">
        <li>Refer friends to earn 10 points per friend! Points get credited only when you refer through the contest widget and the referred person takes part in the contest.</li>
      </ul>

      <h2>Rules</h2>
      <ul class="rules" style="font-size: .9em;">
        <li>Only prepaid orders will be eligible for the grand prize. COD orders are eligible for consolation prizes only.</li>
        <li>Participants who have entered an incorrect registered email id will not be eligible for the contest. The email id entered, must be a registered and verified email id on HealthKart.</li>
        <li>Contest open to Indian residents only.</li>
        <li>Contest is open on 5th December 2013. Contest starts at 12 noon (12PM) and ends at 10PM.</li>
        <li>One winner per hour will be declared. Total of 10 winners will be announced.</li>
        <li>For each hour, one randomly selected order will be declared the winner. Reward points equal to the order amount will be credited to the winners' accounts.</li>
        <li>One person cannot win twice.</li>
        <li>Our judgement will be final.</li>
        <li>For consolation prizes, the maximum reward points will be limited to 500</li>
        <li>Rewards points will be credited by 7th of December 2013</li>
        <li>Reward points will be valid till 10th December 2013</li>
      </ul>
      <br/>

      <%--<div class="storify"><iframe src="//storify.com/Healthkart/happy-healthkarters/embed" width="100%" height=750 frameborder=no allowTransparency=true></iframe><script src="//storify.com/Healthkart/happy-healthkarters.js" type="text/javascript" language="javascript"></script><noscript>[<a href="//storify.com/Healthkart/happy-healthkarters" target="_blank">View the story "Healthkart Delights." on Storify</a>]</noscript></div>--%>
    </div>

    <div class="span8">
      <h2>The 'Kill your Bill' contest form</h2>
      <a class='e-gleam' href="https://gleam.io/2qqbi/the-kill-bill-giveaway" rel="nofollow">The &#39;Kill Bill&#39; giveaway.</a>
      <script type="text/javascript" src="https://js.gleam.io/e.js" async="true"></script>
      <div class="fb-comments" data-href="http://www.healthkart.com/lp/12ordersContest.jsp" data-width="460" data-numposts="5" data-colorscheme="light"></div>
    </div>
    </div>
    <div class="clearfix"></div>

  </s:layout-component>
</s:layout-render>
