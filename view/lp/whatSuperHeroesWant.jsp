<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/templates/landingPageContest.jsp" pageTitle="#WhatSuperHeroesWant">

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
    </style>
  </s:layout-component>

  <s:layout-component name="content">
    <%--<h1 style="text-align: center; padding: 20px 0 30px 0">Twitter Contest : Win Rs. 250 vouchers every hour!</h1>--%>
      <div id="fb-root"></div>
      <script>(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=130363280399851";
          fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>

      <div class="span16" style="margin-bottom: 20px;">
      <div id="countdown"></div>
      <img src="${pageContext.request.contextPath}/assets/images/lp/superHeroes.png" alt="Twitter Contest : Win Rs. 250 vouchers every hour!"/>
    </div>

    <div style="min-height: 700px;">
    <div class="span8">

      <h2>How to participate?</h2>

      <p>Tell us what your favorite Superhero would want to buy at this <a href="http://www.healthkart.com/gosf" target="_blank">GOSF</a> from our website & why? Most interesting answers will be picked. Two simple ways to enter the contest..</p><br/>
        <p><strong>Way 1: Via Twitter</strong>
        <ol class="rules" style="font-size: .9em;">
        <li>Tweet your answer using the hashtag #WhatSuperHeroesWant <a href="https://twitter.com/intent/tweet?button_hashtag=WhatSuperHeroesWant&text=" class="twitter-hashtag-button" data-related="HealthKart" data-dnt="true">Tweet #WhatSuperHeroesWant</a>
              <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script> and <a href="https://twitter.com/Healthkart" class="twitter-follow-button" data-show-count="false">Follow @Healthkart</a>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>                         <br></li>
        <li>More ReTweets, better chances to win. </li>
        </ol>

        <p>
            <strong>Way 2: Via Facebook</strong>
        <ol class="rules" style="font-size: .9em;">
            <li>Like us on Facebook. <div class="fb-like" data-href="http://facebook.com/healthkart" data-layout="button_count" data-action="like" data-show-faces="false" data-share="false"></div></li>
            <li>Answer in the comments section on this page. </li>
            <li>Get more likes to your answer for better chances to win.</li>
        </ol>
        </p><br/>
      <h2>The Prize</h2>
      <p style="font-size: .9em;">
         Rs. 500 vouchers (coupon code). No strings attached.. shop for anything on HealthKart and get upto Rs. 500 off!
        Valid till December 31st, 2013. 10 Winners to be declared.
      </p>
      <br/>
      <h2>Rules</h2>
      <ul class="rules" style="font-size: .9em;">
        <li>Contest open to Indian residents only.</li>
        <li>Contest is open on 11th December 2013. Contest starts at 12 noon (1200 HRS) and ends at 12 midnight (00 HRS).</li>
        <li>Winners will be declared on 12th December 2013. Total of 10 winners will be announced.</li>
        <li>One person cannot win twice.</li>
        <li>Our judgement will be final.</li>
      </ul>
      <br/>
      <h2>Sample #WhatSuperHeroWants Answers</h2>
      <p style="color: gray; font-size: .8em;">Tweet these only if you're lazy. More chances of winning if you're crazy and original :)</p>
      <br/>
      <div class="samples">
      <p>Wonder woman needs cover ums.</p>
      <a href="https://twitter.com/intent/tweet?button_hashtag=WhatSuperHeroWants&text=Wonder woman needs cover ums." class="twitter-hashtag-button" data-related="HealthKart" data-dnt="true">Tweet #CrazyHealthConfessions</a>
      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
      <br/><br/>
      <p>Odin needs some contraceptives. His family is too big.</p>
      <a href="https://twitter.com/intent/tweet?button_hashtag=WhatSuperHeroWants&text=Odin needs some contraceptives. His family is too big." class="twitter-hashtag-button" data-related="HealthKart" data-dnt="true">Tweet #CrazyHealthConfessions</a>
      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
      <br/><br/>
      <p>Darth Vader needs fair and lovely.</p>
      <a href="https://twitter.com/intent/tweet?button_hashtag=WhatSuperHeroWants&text=Darth Vader needs fair and lovely." class="twitter-hashtag-button" data-related="HealthKart" data-dnt="true">Tweet #CrazyHealthConfessions</a>
      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
      <br/><br/>
      <p>Wolverine needs an electric shaver.</p>
      <a href="https://twitter.com/intent/tweet?button_hashtag=WhatSuperHeroWants&text=Wolverine needs an electric shaver" class="twitter-hashtag-button" data-related="HealthKart" data-dnt="true">Tweet #CrazyHealthConfessions</a>
      <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
      </br>
      </div>

      <%--<div class="storify"><iframe src="//storify.com/Healthkart/happy-healthkarters/embed" width="100%" height=750 frameborder=no allowTransparency=true></iframe><script src="//storify.com/Healthkart/happy-healthkarters.js" type="text/javascript" language="javascript"></script><noscript>[<a href="//storify.com/Healthkart/happy-healthkarters" target="_blank">View the story "Healthkart Delights." on Storify</a>]</noscript></div>--%>
    </div>

    <div class="span8">
        <a class="twitter-timeline" href="https://twitter.com/search?q=%23WhatSuperHeroesWant" data-widget-id="410417261858402304">Tweets about "#WhatSuperHeroesWant"</a>
        <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
        <h2>Post your answers in the comments section below</h2>
        <div class="fb-comments" data-href="http://www.healthkart.com/lp/whatSuperHeroesWant.jsp" data-width="460" data-numposts="5" data-colorscheme="light"></div>
    </div>
    </div>
    <div class="clearfix"></div>

  </s:layout-component>
</s:layout-render>
