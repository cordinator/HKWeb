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
      <h1 style="text-align: center; font-size: 2em; font-weight: bold;">HealthKart Strongman Contest</h1>
      <h2 style="text-align: center; padding: 15px; line-height: 1.2em;">
        Jo Hai Balwaan, Jeetega Inaam!<br/>
        Introduce yourself & make a video of your workout or insane feats of strength.
      </h2>
    </div>

    <div style="min-height: 700px;">

      <div class="span16">
        <iframe src='http://woobox.com/9swxqv'
           frameborder='0'
           height='750'
           width='100%'
           scrolling='no'>
        </iframe>
      </div>

    </div>
    <div class="clearfix"></div>

  </s:layout-component>
</s:layout-render>
