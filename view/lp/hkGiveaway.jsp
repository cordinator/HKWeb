<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/templates/landingPageContest.jsp" pageTitle="HealthKart Badminton Giveaway">

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

    <div id='woobox-root' style="max-width:960px !important; margin: 0 auto; text-align: center;" ></div>
    <script>(function(d, s, id) {
      var js, fjs = d.getElementsByTagName(s)[0];
      if (d.getElementById(id)) return;
      js = d.createElement(s); js.id = id;
      js.src = "//woobox.com/js/plugins/woo.js";
      fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'woobox-sdk'));</script>

      <div id="fb-root"></div>
      <script>(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=130363280399851";
          fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>

      <div class="span14" style="margin-bottom: 20px; margin-left: 90px;">

    <%--<div style="text-align: center;"><img src="<hk:vhostImage/>/lp/images/MB_header_banner.jpg"/></div>--%>




    <div class='woobox-offer' data-offer='dkb2sh' style="max-width:960px !important; margin: 0 auto; text-align: center;"></div>

     </div>


    <div class="clearfix"></div>

    <div class="content span16">

            <h2 style="margin-bottom: 15px;">Comments</h2>
      <div class="fb-comments" data-href="http://www.healthkart.com/lp/mbStrongMan.jsp" data-width="960" data-numposts="5" data-colorscheme="light"></div>

    </div>

  </s:layout-component>
</s:layout-render>
