<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/templates/landingPageContest.jsp" pageTitle="#CrazyHealthConfessions">

  <s:layout-component name="htmlHead">
    <style>
      #header .row {
        display: none;
      }
      .wrapper h2 {
        padding-bottom: 15px;
        padding-top: 5px;
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
    <%--<h1 style="text-align: center; padding: 20px 0 30px 0">Twitter Contest : Win Rs. 250 vouchers every hour!</h1>--%>

    <div class="span16" style="margin-bottom: 20px;">
      <div id="countdown"></div>
      <img src="${pageContext.request.contextPath}/assets/images/lp/crazyHealth.png" alt="Twitter Contest : Win Rs. 250 vouchers every hour!"/>
    </div>

    <div style="min-height: 700px;">
    <div class="span8">
      <h2>The contest has ended!</h2>
      <p>
        Congrats to the winners :
      </p>
      <ul class="rules">
        <li><a href="https://twitter.com/imbevda" target="_blank">@iambevda</a></li>
        <li><a href="https://twitter.com/Sweet_Liqueur" target="_blank">@Sweet_Liqueur</a></li>
        <li><a href="https://twitter.com/karmagal91" target="_blank">@karmagal91</a></li>
        <li><a href="https://twitter.com/TheAkashKumar" target="_blank">@TheAkashKumar</a></li>
        <li><a href="http://twitter.com/docavneet" target="_blank">@docavneet</a></li>
        <li><a href="http://twitter.com/MehekMahtani" target="_blank">@MehekMahtani</a></li>
        <li><a href="http://twitter.com/anoopsuri" target="_blank">@anoopsuri</a></li>
        <li><a href="http://twitter.com/hain_jii" target="_blank">@hain_jii</a></li>
        <li><a href="http://twitter.com/Saanvi82" target="_blank">@Saanvi82</a></li>
        <li><a href="http://twitter.com/rohanbajaj2008" target="_blank">@rohanbajaj2008</a></li>
      </ul>
      <br/>
      <br/>
      <h2>How to participate?</h2>
      <p>Come Clean. Confess. We know you've done those unspeakable things to stay fit. Two simple steps to enter the contest..</p><br/>
        <p><strong>Step 1</strong> : Tweet about it with pride using the hashtag #CrazyHealthConfessions and mention @HealthKart <a href="https://twitter.com/intent/tweet?button_hashtag=CrazyHealthConfessions&text=" class="twitter-hashtag-button" data-related="HealthKart" data-dnt="true">Tweet #CrazyHealthConfessions</a>
              <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script></p>
        <p style="color: gray; font-size: .8em;">The crazier the better! Checkout some samples below.</p><br/>
        <p><strong>Step 2</strong> : <a href="https://twitter.com/Healthkart" class="twitter-follow-button" data-show-count="false">Follow @Healthkart</a>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script></p>
      <br/>
      <h2>The Prize</h2>
      <p style="font-size: .9em;">
         Rs. 250 voucher (coupon code). No strings attached.. shop for anything on HealthKart and get upto Rs. 250 off!
        Valid till December 10th, 2013.
      </p>
      <br/>
      <h2>Rules</h2>
      <ul class="rules" style="font-size: .9em;">
        <li>Contest open to Indian residents only.</li>
        <li>Contest is open on 3rd December 2013. Contest starts at 12 noon (12PM) and ends at 10PM.</li>
        <li>One winner per hour will be declared. Total of 10 winners will be announced.</li>
        <li>For each hour, the most crazy confession will win the prize</li>
        <li>One person cannot win twice.</li>
        <li>Our judgement will be final.</li>
      </ul>
      <br/>
      <h2>Sample #CrazyHealthConfessions</h2>
      <p style="color: gray; font-size: .8em;">Tweet these only if you're lazy. More chances of winning if you're crazy and original :)</p>
      <br/>
      <div class="samples">
      <p>To cover up vitamin c deficiency, I end up eating lemon cheesecake. Now I'm fat.</p>
      <a href="https://twitter.com/intent/tweet?button_hashtag=CrazyHealthConfessions&text=To cover up vitamin c deficiency, I end up eating lemon cheesecake. Now I'm fat. @HealthKart" class="twitter-hashtag-button" data-related="HealthKart" data-dnt="true">Tweet #CrazyHealthConfessions</a>
      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
      <br/><br/>
      <p>I squat on the commode when I poo; I like the dynamic tension; my quads explode.</p>
      <a href="https://twitter.com/intent/tweet?button_hashtag=CrazyHealthConfessions&text=I squat on the commode; I like the dynamic tension; my quads explode. @HealthKart" class="twitter-hashtag-button" data-related="HealthKart" data-dnt="true">Tweet #CrazyHealthConfessions</a>
      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
      <br/><br/>
      <p>They said that 6 eggs a day will make my hair shine. They didn't tell me about constipation.</p>
      <a href="https://twitter.com/intent/tweet?button_hashtag=CrazyHealthConfessions&text=They said that 6 eggs a day will make my hair shine. They didn't tell me about constipation. @HealthKart" class="twitter-hashtag-button" data-related="HealthKart" data-dnt="true">Tweet #CrazyHealthConfessions</a>
      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
      <br/><br/>
      <p>I'm vegan and am paranoid about Calcium deficiency. So I eat 20 paans every Friday for the 'choona'.</p>
      <a href="https://twitter.com/intent/tweet?button_hashtag=CrazyHealthConfessions&text=I'm vegan and am paranoid about Calcium deficiency. So I eat 20 paans every Friday for the 'choona'. @HealthKart" class="twitter-hashtag-button" data-related="HealthKart" data-dnt="true">Tweet #CrazyHealthConfessions</a>
      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
      </br>
      </div>

      <%--<div class="storify"><iframe src="//storify.com/Healthkart/happy-healthkarters/embed" width="100%" height=750 frameborder=no allowTransparency=true></iframe><script src="//storify.com/Healthkart/happy-healthkarters.js" type="text/javascript" language="javascript"></script><noscript>[<a href="//storify.com/Healthkart/happy-healthkarters" target="_blank">View the story "Healthkart Delights." on Storify</a>]</noscript></div>--%>
    </div>

    <div class="span8">
      <a class="twitter-timeline"  href="https://twitter.com/search?q=%23CrazyHealthConfessions"  data-widget-id="407566360445612032">Tweets about "#CrazyHealthConfessions"</a>
          <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
    </div>
    </div>
    <div class="clearfix"></div>

  </s:layout-component>
</s:layout-render>
