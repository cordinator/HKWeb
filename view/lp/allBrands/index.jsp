<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/templates/landingPageContest.jsp" pageTitle="All Brands Page">

<s:layout-component name="htmlHead">



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

    ul.brandLogo {
      list-style:none;
      margin-top:25px;}

    ul.brandLogo li {
      display:inline-block;
      margin-right:40px;
      width: 140px;
      margin-bottom: 15px;
    }
    ul.brandLogo li:last-child {
      margin-right:0;
    }

    .nav-box li a {
      display: inline-block;
      padding: 2px 15px;
      width: 145px;
    }
    .hdr1 {
      height: 30px;
      padding: 10px 0 0 0;
      text-transform: uppercase;
      font-size: 1.1em;
      font-weight: 700;
      color: #333;
    }

    .cl {
      clear: both;
    }


  </style>
</s:layout-component>

<s:layout-component name="header">
  <s:layout-render name="/lp/allBrands/allBrandsHeader.jsp"/>
</s:layout-component>

<s:layout-component name="content">
<div class="container">

<div class="row">
<div class="span4 nav-box-cntnr" id="NavBox">

  <div class="hdr1">Browse By Category</div>

  <ul class="accnt-nav-box">
    <li><a href="javascript:void(0)" data-target="#sportsNutrition">Sports Nutrition</a><span>»</span></li>
    <li><a href="javascript:void(0)" data-target="#fitness">Fitness </a><span>»</span></li>
    <li><a href="javascript:void(0)" data-target="#sports">Sports </a><span>»</span></li>
    <li><a href="javascript:void(0)" data-target="#vitamins">Vitamins Supplements </a><span>»</span></li>
    <li><a href="javascript:void(0)" data-target="#healthFood">Health Food &amp; Drinks </a><span>»</span></li>
    <li><a href="javascript:void(0)" data-target="#healthDevices">Health Devices </a><span>»</span></li>
    <li><a href="javascript:void(0)" data-target="#diabetes">Diabetes </a><span>»</span></li>
      <%--<li><a href="javascript:void(0)" data-target="#elderlyCare">Elderly &amp; Patient Care </a><span>»</span></li>--%>
    <li><a href="javascript:void(0)" data-target="#personalCare">Personal &amp; Baby Care </a><span>»</span></li>
    <li><a href="javascript:void(0)" data-target="#parenting">Parenting </a><span>»</span></li>
    <li><a href="javascript:void(0)" data-target="#beauty">Beauty </a><span>»</span></li>
      <%--<li><a href="javascript:void(0)" data-target="#winter">Winter Care </a><span>»</span></li>--%>
  </ul>
</div>

<!-- span4 close -->

<div class="span12 prdct-dtls-blck">


<div id="sportsNutrition" class="hide" style="display: block;">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>
    <h2 class="fnt-bolder fnt-caps">Sports Nutrition</h2>
  </div>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/on?navKey=BR-542" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/ON.png" alt="Optimum Nutrition" /></a></li>
    <li><a href="http://www.healthkart.com/brand/muscletech?navKey=BR-502" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/MUSCLETECH.png" alt="MuscleTech" /></a></li>
    <li><a href="http://www.healthkart.com/brand/dymatize?navKey=BR-497" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Dymatize.png" /></a></li>
    <li><a href="http://www.healthkart.com/brand/ultimate-nutrition?navKey=BR-510" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/ultimateNutrition.png" alt="Ultimate Nutrition" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/muscleblaze?navKey=BR-539" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/muscleBlaze.png" alt="MuscleBlaze"/></a></li>
    <li><a href="http://www.healthkart.com/brand/natures-best?navKey=BR-485" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/natures-best.png" alt="Natures Best" /></a></li>
    <li><a href="http://www.healthkart.com/brand/bsn?navKey=BR-541" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/BSN.png" alt="BSN" /></a></li>
    <li><a href="http://www.healthkart.com/brand/musclepharm?navKey=BR-509" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Muscle-Pharm.png" alt="MusclePharm" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/universal-nutrition?navKey=BR-547" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/universal.png" alt="Universal" /></a></li>
    <li><a href="http://www.healthkart.com/brand/ssn?navKey=BR-1137" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/SSN.png" alt="Scientific Sports Nutrition (SSN)" /></a></li>
    <li><a href="http://www.healthkart.com/brand/labrada?navKey=BR-511" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Labrada.png" alt="Labrada" /></a></li>
    <li><a href="http://www.healthkart.com/brand/domin8r-nutrition?navKey=BR-1136" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/dmn8r.png" alt="Domin8r Nutrition" /></a></li>
  </ul>
  <div class="disp-inln cont-rht mrgn-t-10"><a class="btn btn-gray" href="http://www.healthkart.com/beta/brand/BrandListing.action?pre=&primaryCatId=2">View All Brands</a></div>
</div>
<!-- sports nutrition close -->
<div class="cl"></div>

<div id="fitness" class="hide mrgn-t-30" style="display: block;">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>
    <h2 class="fnt-bolder fnt-caps">Fitness</h2>
  </div>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/harbinger?navKey=BR-610" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Harbinger.png" alt="Harbinger" /></a></li>
    <li><a href="http://www.healthkart.com/brand/adidas?navKey=BR-4" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/adidas.png" alt="Adidas" /></a></li>
    <li><a href="http://www.healthkart.com/brand/reebok?navKey=BR-315" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/reebok.png" alt="Reebok"/></a></li>
    <li><a href="http://www.healthkart.com/brand/tunturi?navKey=BR-607" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/tunturi.png" alt="Tunturi"/></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/polar?navKey=BR-853" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/polar.png" alt="Polar" /></a></li>
    <li><a href="http://www.healthkart.com/brand/co-fit?navKey=BR-1219" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Co-fit.png" alt="Co Fit" /></a></li>
    <li><a href="http://www.healthkart.com/brand/iso-solid?navKey=BR-1225" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/isoSolid.png" alt="Iso Solid" /></a></li>
    <li><a href="http://www.healthkart.com/brand/bh-fitness?navKey=BR-1239" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/bhFitness.png" alt="BH Fitness" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/salter?navKey=BR-1208" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/SALTER.png" alt=" Salter" /></a></li>
    <li><a href="http://www.healthkart.com/brand/turbuster?navKey=BR-863" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Turbuster.png" alt="Turbuster" /></a></li>
    <li><a href="http://www.healthkart.com/brand/grandslam?navKey=BR-612" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Grandslam.png" alt="Grandslam" /></a></li>
    <li><a href="http://www.healthkart.com/brand/magic-home-gym?navKey=BR-864" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/magicHome.png" alt="Magic Home Gym" /></a></li>
  </ul>
  <div class="disp-inln cont-rht mrgn-t-10"><a class="btn btn-gray" href="http://www.healthkart.com/beta/brand/BrandListing.action?pre=&primaryCatId=3">View All Brands</a></div>
</div>
<!-- Fitness close -->
<div class="cl"></div>

<div id="sports" class="hide mrgn-t-30" style="display: block;">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>
    <h2 class="fnt-bolder fnt-caps">Sports</h2>
  </div>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/yonex?navKey=BR-841" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/yonex.png" alt="Yonex" /></a></li>
    <li><a href="http://www.healthkart.com/brand/stag?navKey=BR-849" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/STAG.png" alt="Stag" /></a></li>
    <li><a href="http://www.healthkart.com/brand/nivia?navKey=BR-840" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/nivia.png" alt="Nivia" /></a></li>
    <li><a href="http://www.healthkart.com/brand/cosco?navKey=BR-842" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/cosco.png" alt="Cosco" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/head?navKey=BR-857" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/head.png" alt="Head" /></a></li>
    <li><a href="http://www.healthkart.com/brand/slazenger?navKey=BR-381" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/slzngr.png" alt="Slazenger" /></a></li>
    <li><a href="http://www.healthkart.com/brand/lonsdale?navKey=BR-850" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Lonsdale.png" alt="Lonsdale Londan" /></a></li>
    <li><a href="http://www.healthkart.com/brand/muscleblaze?navKey=BR-539" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/muscleBlaze.png" alt="MuscleBlaze" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/vector-x?navKey=BR-838" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Vector-X.png" alt="Vector X" /></a></li>
    <li><a href="http://www.healthkart.com/brand/newfeel?navKey=BR-1221" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/newfeel.png" alt="Newfeel" /></a></li>
    <li><a href="http://www.healthkart.com/brand/stiga?navKey=BR-843" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Stiga.png" alt="Stiga" /></a></li>
    <li><a href="http://www.healthkart.com/brand/carlton?navKey=BR-1236" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Carlton.png" alt="Carlton" /></a></li>
  </ul>
  <div class="disp-inln cont-rht mrgn-t-10"><a class="btn btn-gray" href="http://www.healthkart.com/beta/brand/BrandListing.action?pre=&primaryCatId=3">View All Brands</a></div>
</div>
<!-- sports close -->
<div class="cl"></div>

<div id="vitamins" class="hide mrgn-t-30" style="display: block;">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>
    <h2 class="fnt-bolder fnt-caps">Vitamin Supplements</h2>
  </div>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/vitamin-shoppe?navKey=BR-486" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/vitaminShoppe.png" alt="The Vitamin Shoppe" /></a></li>
    <li><a href="http://www.healthkart.com/brand/natures-bounty?navKey=BR-507" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/naturesBounty.png" alt="Nature's Bounty" /></a></li>
    <li><a href="http://www.healthkart.com/brand/health-aid?navKey=BR-564" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/HealthAid.png" alt="HealthAid" /></a></li>
    <li><a href="http://www.healthkart.com/brand/organic-india?navKey=BR-500" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/OrganicIndia.png" alt="Organic India" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/healthviva?navKey=BR-427" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/HealthViva.png" alt="HealthViva" /></a></li>
    <li><a href="http://www.healthkart.com/brand/ranbaxy?navKey=BR-499" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Ranbaxy.png" alt="Ranbaxy" /></a></li>
    <li><a href="http://www.healthkart.com/brand/herbal-hills?navKey=BR-573" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/herbalHill.png" alt="Herbal Hills" /></a></li>
    <li><a href="http://www.healthkart.com/brand/gaia?navKey=BR-540" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/gaia.png" alt="GAIA" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/jiva?navKey=BR-441" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Jiva.png" alt="Jiva Ayurveda" /></a></li>
    <li><a href="http://www.healthkart.com/brand/shivalik-herbals?navKey=BR-551" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/shivalikHerbals.png" alt="Shivali Herbals" /></a></li>
    <li><a href="http://www.healthkart.com/brand/zenith-nutrition?navKey=BR-1165" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/zenith_nutritions.png" alt="Zenith Nutrition" /></a></li>
    <li><a href="http://www.healthkart.com/brand/chemical-resources?navKey=BR-1173" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/chemicalResources.png" alt="Chemical Resources" /></a></li>
  </ul>
  <div class="disp-inln cont-rht mrgn-t-10"><a class="btn btn-gray" href="http://www.healthkart.com/beta/brand/BrandListing.action?pre=&primaryCatId=2">View All Brands</a></div>
</div>
<!-- Vitamin Supplements close -->
<div class="cl"></div>

<div id="healthFood" class="hide mrgn-t-30" style="display: block;">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>
    <h2 class="fnt-bolder fnt-caps">Health Food &amp; Drinks</h2>
  </div>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/abbott?navKey=BR-53" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/abbott.png" alt="Abbott" /></a></li>
    <li><a href="http://www.healthkart.com/brand/ritebite?navKey=BR-1039" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/rite-bite.png" alt="Rite Bite" /></a></li>
    <li><a href="http://www.healthkart.com/brand/organic-india?navKey=BR-500" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/OrganicIndia.png" alt="Organic India" /></a></li>
    <li><a href="http://www.healthkart.com/brand/horlicks?navKey=BR-615" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Horlicks.png" alt="Horlicks" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/bagrrys?navKey=BR-1089" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Bagrrys.png" alt="Bagrrys" /></a></li>
    <li><a href="http://www.healthkart.com/brand/nestle?navKey=BR-39" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Nestle.png" alt="Nestle" /></a></li>
    <li><a href="http://www.healthkart.com/brand/spray-lite?navKey=BR-629" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Spray-lite.png" alt="Spray Lite" /></a></li>
    <li><a href="http://www.healthkart.com/brand/traditional-medicinals?navKey=BR-515" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/traditionalMedicinals.png" alt="Traditional Medicinals" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/chamong?navKey=BR-1175" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/chamong.png" alt="Chamong" /></a></li>
    <li><a href="http://www.healthkart.com/brand/strombss?navKey=BR-530" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Strombss.png" alt="Strombss" /></a></li>
    <li><a href="http://www.healthkart.com/brand/nourish-organics?navKey=BR-556" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Nourish-Organic.png" alt="Nourish Organic" /></a></li>
    <li><a href="http://www.healthkart.com/brand/boost?navKey=BR-614" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Boost.png" alt="Boot" /></a></li>
  </ul>
  <div class="disp-inln cont-rht mrgn-t-10"><a class="btn btn-gray" href="http://www.healthkart.com/beta/brand/BrandListing.action?pre=&primaryCatId=2">View All Brands</a></div>
</div>
<!-- Health Food &amp; Drinks close -->
<div class="cl"></div>


<div id="healthDevices" class="hide mrgn-t-30" style="display: block;">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>
    <h2 class="fnt-bolder fnt-caps">Health Devices</h2>
  </div>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/omron?navKey=BR-170" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/omron.png" alt="Omron" /></a></li>
    <li><a href="http://www.healthkart.com/brand/healthviva?navKey=BR-427" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/HealthViva.png" alt="HealthViva" /></a></li>
    <li><a href="http://www.healthkart.com/brand/equinox?navKey=BR-221" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Equinox.png" alt="Equinox" /></a></li>
    <li><a href="http://www.healthkart.com/brand/littmann?navKey=BR-23" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/littmann.png" alt="Littmann" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/jsb?navKey=BR-22" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/JSB.png" alt="JSB Health Care" /></a></li>
    <li><a href="http://www.healthkart.com/brand/niscomed?navKey=BR-392" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/nisco.png" alt="NicscoMed" /></a></li>
    <li><a href="http://www.healthkart.com/brand/rossmax?navKey=BR-718" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Rossmax.png" alt="Rossmax" /></a></li>
    <li><a href="http://www.healthkart.com/brand/hicks?navKey=BR-400" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/hicks.png" alt="Hicks" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/beurer?navKey=BR-84" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Beurer.png" alt="Beurer" /></a></li>
      <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/morepen.png" /></a></li>--%>
    <li><a href="http://www.healthkart.com/brand/pulse-wave?navKey=BR-394" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/pulsewave.png" alt="Pulse Wave" /></a></li>
  </ul>
  <div class="disp-inln cont-rht mrgn-t-10"><a class="btn btn-gray" href="http://www.healthkart.com/beta/brand/BrandListing.action?pre=&primaryCatId=5">View All Brands</a></div>
</div>
<!-- Health Devices close -->
<div class="cl"></div>


<div id="diabetes" class="hide mrgn-t-30" style="display: block;">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>
    <h2 class="fnt-bolder fnt-caps">Diabetes</h2>
  </div>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/onetouch?navKey=BR-164" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/OneTouch.png" alt="OneTouch" /></a></li>
    <li><a href="http://www.healthkart.com/brand/accu-chek?navKey=BR-165" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/accu_chek.png" alt="Accu chek" /></a></li>
    <li><a href="http://www.healthkart.com/brand/abbott-freestyle?navKey=BR-162" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/abbott.png" alt="Abott" /></a></li>
    <li><a href="http://www.healthkart.com/brand/contour?navKey=BR-205" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/contour.png" alt="Bayer Contour" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/omron?navKey=BR-170" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/omron.png" alt="Omron" /></a></li>
    <li><a href="http://www.healthkart.com/brand/splenda?navKey=BR-489" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/SPLENDA.png" alt="Splenda" /></a></li>
      <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Freestyle.png" /></a></li>--%>
    <li><a href="http://www.healthkart.com/brand/sugar-free-natura?navKey=BR-487" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/sugarFree.png" alt="Suger Free" /></a></li>
    <li><a href="http://www.healthkart.com/brand/extend?navKey=BR-163" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/EXTEND.png" alt="Extend Nutrition" /></a></li>
  </ul>

    <%--<ul class="brandLogo">--%>
    <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/EXTEND.png" /></a></li>--%>
    <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/unistar.png" /></a></li>--%>

    <%--</ul>--%>
  <div class="disp-inln cont-rht mrgn-t-10"><a class="btn btn-gray" href="http://www.healthkart.com/beta/brand/BrandListing.action?pre=&primaryCatId=4">View All Brands</a></div>
</div>
<!-- Diabetes close -->
<div class="cl"></div>


  <%--<div id="elderlyCare" class="hide mrgn-t-30" style="display: block;">--%>
  <%--<div class="ttl-cntnr ttl-left">--%>
  <%--<span class="icn icn-dot"></span>--%>
  <%--<h2 class="fnt-bolder fnt-caps">Elderly &amp; Patient Care</h2>--%>
  <%--</div>--%>

  <%--<ul class="brandLogo">--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--</ul>--%>

  <%--<ul class="brandLogo">--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--</ul>--%>

  <%--<ul class="brandLogo">--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--</ul>--%>
  <%--<div class="disp-inln cont-rht mrgn-t-10"><a class="btn btn-gray" href="#">View All Brands</a></div>--%>
  <%--</div>--%>
  <%--<!-- Elderly &amp; Patient Care close -->--%>


<div id="personalCare" class="hide mrgn-t-30" style="display: block;">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>
    <h2 class="fnt-bolder fnt-caps">Personal &amp; Baby Care</h2>
  </div>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/healthviva?navKey=BR-427" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/HealthViva.png" alt="HealthViva" /></a></li>
    <li><a href="http://www.healthkart.com/brand/knockout?navKey=BR-161" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/KnockOut.png" alt="KnockOut" /></a></li>
    <li><a href="http://www.healthkart.com/brand/moods?navKey=BR-458" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Moods_Condoms.png" alt="Moods Condoms" /></a></li>
    <li><a href="http://www.healthkart.com/brand/durex?navKey=BR-213" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/durex.png" alt="Durex" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/vacurect?navKey=BR-930" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Vacurect.png" alt="Vacurect" /></a></li>
    <li><a href="http://www.healthkart.com/brand/oral-b?navKey=BR-636" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Oral-B.png" alt="Oral B" /></a></li>
    <li><a href="http://www.healthkart.com/brand/roots?navKey=BR-695" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/RootsCanada.png" alt="Roots" /></a></li>
      <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/havens.png" /></a></li>--%>
  </ul>


  <div class="disp-inln cont-rht mrgn-t-10"><a class="btn btn-gray" href="http://www.healthkart.com/beta/brand/BrandListing.action?pre=&primaryCatId=7">View All Brands</a></div>
</div>
<!-- Personal &amp; Baby Care close -->
<div class="cl"></div>

<div id="parenting" class="hide mrgn-t-30" style="display: block;">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>
    <h2 class="fnt-bolder fnt-caps">Parenting</h2>
  </div>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/pigeon?navKey=BR-35" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/pigeon.png" alt="Pigeon" /></a></li>
    <li><a href="http://www.healthkart.com/brand/farlin?navKey=BR-38" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/farlin.png" alt="Farlin" /></a></li>
    <li><a href="http://www.healthkart.com/brand/philips-avent?navKey=BR-76" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/philips.png" alt="Philips" /></a></li>
    <li><a href="http://www.healthkart.com/brand/chicco?navKey=BR-47" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/chicco.png" alt="Chicco" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/nuby?navKey=BR-61" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/nuby.png" alt="Nuby" /></a></li>
    <li><a href="http://www.healthkart.com/brand/sebamed?navKey=BR-976" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Sebamed.png" alt="Sebamed" /></a></li>
    <li><a href="http://www.healthkart.com/brand/medela?navKey=BR-60" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/medela.png" alt="Medela" /></a></li>
    <li><a href="http://www.healthkart.com/brand/flowline?navKey=BR-1305" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/flowline.png" alt="Flowline Healthcare Co" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/palmers?navKey=BR-1183" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/palmers.png" alt="Palmers" /></a></li>
    <li><a href="http://www.healthkart.com/brand/pampers?navKey=BR-32" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/pampers.png" alt="Pampers" /></a></li>
    <li><a href="http://www.healthkart.com/brand/johnson-n-johnson?navKey=BR-37" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Johnson.png" alt="Johnson & Johnson" /></a></li>
    <li><a href="http://www.healthkart.com/brand/littles?navKey=BR-65" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Littles.png" alt="Little's" /></a></li>
  </ul>
  <div class="disp-inln cont-rht mrgn-t-10"><a class="btn btn-gray" href="http://www.healthkart.com/beta/brand/BrandListing.action?pre=&primaryCatId=9">View All Brands</a></div>
</div>
<!-- Parenting close -->
<div class="cl"></div>

<div id="beauty" class="hide mrgn-t-30" style="display: block;">
  <div class="ttl-cntnr ttl-left">
    <span class="icn icn-dot"></span>
    <h2 class="fnt-bolder fnt-caps">Beauty</h2>
  </div>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/lakme?navKey=BR-111" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/lakme.png" alt="Lakme" /></a></li>
    <li><a href="http://www.healthkart.com/brand/gillette?navKey=BR-121" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Gillette.png" Gillette/></a></li>
    <li><a href="http://www.healthkart.com/brand/kaya?navKey=BR-1338" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Kaya-Skin-Clinic.png" alt="Kaya Skin Clinic" /></a></li>
    <li><a href="http://www.healthkart.com/brand/loreal-paris?navKey=BR-107" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/lorea.png" alt="Loreal Paris" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/sebamed?navKey=BR-976" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Sebamed.png" alt="Sebamed" /></a></li>
    <li><a href="http://www.healthkart.com/brand/vichy?navKey=BR-105" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Vichy.png" alt="Vichy Laboratoires" /></a></li>
    <li><a href="http://www.healthkart.com/brand/philips?navKey=BR-670" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/philips.png" alt="Philips" /></a></li>
    <li><a href="http://www.healthkart.com/brand/olay?navKey=BR-97" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Olay.png" alt="Olay" /></a></li>
  </ul>

  <ul class="brandLogo">
    <li><a href="http://www.healthkart.com/brand/vedic-line?navKey=BR-934" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/vedicline.png" alt="Vedicline" /></a></li>
    <li><a href="http://www.healthkart.com/brand/nivea?navKey=BR-122" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/nivea.png" alt="Nivea" /></a></li>
    <li><a href="http://www.healthkart.com/brand/revlon?navKey=BR-128" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Revlon.png" alt="Revlon" /></a></li>
    <li><a href="http://www.healthkart.com/brand/fabindia?navKey=BR-80" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/Fabindia.png" Fabindia/></a></li>
  </ul>
  <div class="disp-inln cont-rht mrgn-t-10"><a class="btn btn-gray" href="http://www.healthkart.com/beta/brand/BrandListing.action?pre=&primaryCatId=8">View All Brands</a></div>
</div>
<!-- Beauty close -->
<div class="cl"></div>

  <%--<div id="winter" class="hide mrgn-t-30" style="display: block;">--%>
  <%--<div class="ttl-cntnr ttl-left">--%>
  <%--<span class="icn icn-dot"></span>--%>
  <%--<h2 class="fnt-bolder fnt-caps">Winter Care</h2>--%>
  <%--</div>--%>

  <%--<ul class="brandLogo">--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--</ul>--%>

  <%--<ul class="brandLogo">--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--</ul>--%>

  <%--<ul class="brandLogo">--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--<li><a href="#" target="_blank"><img src="<hk:vhostImage/>/lp/allBrands/images/" /></a></li>--%>
  <%--</ul>--%>
  <%--<div class="disp-inln cont-rht mrgn-t-10"><a class="btn btn-gray" href="#">View All Brands</a></div>--%>
  <%--</div>--%>
  <%--<!-- Winter Care close -->--%>


</div>
<!-- span12 close -->



</div>
<!-- row close -->


  <%--<s:layout-component name="header">--%>
  <%--<s:layout-render name="/lp/allBrands/allBrandsFooter.jsp"/>--%>
  <%--</s:layout-component>--%>
</div>
<!-- wrapper close -->

</s:layout-component>
<s:layout-component name="scriptComponent">
  <script type="text/javascript">
    $('body').on('click','a[data-target]',function(){
      HK.utils.Scroll.toElement($($(this).attr('data-target')));
    })
    $(window).load(function(){
      function fixLeftNav() {
        var initialHeight = $(".prdct-dtls-blck").offset().top + 20;
        var bottomHeight = $("#footer").offset().top - $(".nav-box-cntnr").height();
        $(".nav-box-cntnr").css("top", initialHeight);

        if ($(window).scrollTop() > initialHeight) {
          if ($(window).scrollTop() < bottomHeight) {
            $('.nav-box-cntnr').css({
              position: 'fixed',
              top: 10
            });
          } else {
            $('.nav-box-cntnr').css({
              position: 'absolute',
              top: bottomHeight
            });
          }
        } else {
          $('.nav-box-cntnr').css({
            position: 'absolute',
            top: initialHeight
          });
        }

      }
      $(window).scroll(function (e) {
        fixLeftNav();

      })
    });

  </script>
</s:layout-component>
</s:layout-render>
