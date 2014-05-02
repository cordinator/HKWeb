<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>



<s:layout-render name="/buying-guide/bgGeneral.jsp" title="Women's Health Vitamins & Supplements">
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
  <meta name="description" content="Find out all necessary women's health vitamins and supplements that you require for daily use. Learn various benefits and solutions from these nutrients & promote overall wellness." />
  <meta name="keywords" content="Womens Health, Womens supplements, Womens Vitamins, Women's Health Benefits" />


  <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/buying-guide/womenHealth/womenHealth.css"
        media="screen">

</s:layout-component>

<s:layout-component name="bgContent">

  <div class="container mrgn-bt-30">
    <img class="cont-lft" src="<hk:vhostImage/>/buying-guide/womenHealth/images/women-ca.gif" />
    <div class="topCont">
      <h1>Vitamins &amp; Supplements<br />
        For <b>Women Health</b>
      </h1>
      <p class="mrgn-t-10">It is important to keep yourself healthy, as you have to cater to the
        wellness of everyone in your family. Let&#39;s walk through and find out
        various vitamins and supplements that you need to maintain your
        overall health and wellness. This page will help you learn about:</p>
      <ul>
        <li>Chronic health hazards for women</li>
        <li>Vitamins your body need</li>
        <li>Various vitamins and minerals in your diet</li>
        <li>Necessary vitamins and supplements that bridge your nutrition gap</li>
      </ul>

      <div>
        <span class="nScroll">A Fitter And Healthier You Is Just A Scroll Away.</span>
        <a href="javascript:void(0)" data-target="#next"><img src="<hk:vhostImage/>/buying-guide/womenHealth/images/downArrow.png" /></a></div>
    </div>

  </div>
  <div class="cl"></div>
  <!--- container Close ---->
  <div class="pinkCont" id="next"><div class="container" style="background:#f072ab;">
    <h2>WHAT&#39;S YOUR BAR? </h2>
    <p class="mrgn-b-25">If you aren&#39;t eating healthy, there is no way supplements can fulfil the gap. However, if you fall under the categories of women we are going to mention, you would need to pop-in one or two tablets along with a balanced meal:</p>
    <div class="cl"></div>


    <div class="barPoing">
      <p>Pregnant or could be pregnant women who need 400mcg of folic acid
        daily to lower risk of certain birth defects</p>
      <p>You are over 50 and thus may need more vitamin B12</p>
      <p>If you are old, have dark skin, or don&#39;t get much exposure to sun - you need vitamin D</p>
      <p>If you have frequent bone fractures, bone pain, teeth pain etc. you
        need calcium</p>
      <p>If you are suffering from low levels of red blood cells in your blood/anaemia - you need iron</p>
    </div>
    <img class="cont-rht" src="<hk:vhostImage/>/buying-guide/womenHealth/images/womenRun.png" />
  </div></div>
  <div class="cl"></div>
  <!--- Pink container Close ---->
  <div class="container mrgn-t-50">
    <h3>NECESSARY MULTIVITAMINS TO BE CONSUMED DAILY</h3>
    <p>We all can&#39;t eat healthy and balanced food all the time. To balance that gap, we should consume multivitamins daily with meal to control various conditions. Some of these are: </p>

    <h4>Glucosamine</h4>
    <p class="cl mrgn-b-20">May control arthritis and joint pains. Found in Glucosamine sulfate.</p>
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="13595,13958,15737" showAddToCart="true"/>

    <h4>Echinacea</h4>
    <p class="cl mrgn-b-20">May lessen severity of cold and infections. Found in major brand multivitamins.</p>
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="14964,12812,37925" showAddToCart="true"/>

    <h4>Ginseng</h4>
    <p class="cl mrgn-b-20">May promote immunity, boost metabolism and improves memory and concentration. Found in supplements
      and also as Korean ginseng root.</p>
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="45165,42578,15164" showAddToCart="true"/>

    <h4>Ginger</h4>
    <p class="cl mrgn-b-20">May lessen severity of nausea and vomiting, morning sickness etc. Fresh peeled ginger serves the purpose.</p>
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="13936,37981" showAddToCart="true"/>

    <hr />

    <h3>NECESSARY VITAMINS AND MINERALS IN DIET</h3>
    <p>Sometimes, diet alternatives help you cut down on popping in more and more multivitamin pills. Some of them are:</p>


    <div class="necVitamin">
      <h4>Vitamin A</h4>
      <div class="cl"></div>
      <div class="dividerVitamin">Boosts immunity, improves vision,  maintains heart health,
        controls skin ageing</div>
      <p>Recommended Daily Dosage:  2300 IU<br />
        Food Source: Best taken from Beta-carotene source like a large carrot, a cup of cantaloupe sliced</p>
    </div>
    <!--- necVitamin Close ---->

    <div class="necVitamin mrgn-l-300">
      <h4>Vitamin B</h4>
      <div class="cl"></div>
      <div class="dividerVitamin">Maintains metabolism,  tones muscles, sharpens mind, increases B9 (folic acid) count</div>
      <p>Recommended Daily Dosage:  400 mcg<br />
        Food Source: Fortified breakfast cereals, whole grain bread, beans, asparagus</p>
    </div>
    <!--- necVitamin Close ---->

    <div class="necVitamin">
      <h4>Vitamin c</h4>
      <div class="cl"></div>
      <div class="dividerVitamin">Antioxidant, boosts immunity, controls heart health, maintains eye health</div>
      <p>Recommended Daily Dosage: 75 mg<br />
        Food Source: Citrus fruits and colourful vegetables like an orange, A cup of broccoli or a red pepper</p>
    </div>
    <!--- necVitamin Close ---->

    <div class="necVitamin mrgn-l-300">
      <h4>Vitamin D</h4>
      <div class="cl"></div>
      <div class="dividerVitamin">Often termed as a wonder drug, it may reduce
        chances of breast cancer, diabetes and
        ovarian cancer. It helps in calcium absorption,
        plays a key role in muscle function</div>
      <p>Recommended Daily Dosage: 1000 - 2000 IU<br />
        Food Source: Milk, orange juice, salmon
        (in small quantities)</p>
    </div>
    <!--- necVitamin Close ---->

    <div class="necVitamin">
      <h4>Iron</h4>
      <div class="cl"></div>
      <div class="dividerVitamin">Lack of iron causes anaemia and  results in weak immune system. Important for women who have  heavy periods</div>
      <p>Recommended Daily Dosage: 18 mg<br />
        Food Source: A cup of breakfast cereals, red meat etc.</p>
    </div>
    <!--- necVitamin Close ---->

    <div class="necVitamin mrgn-l-300">
      <h4>Calcium</h4>
      <div class="cl"></div>
      <div class="dividerVitamin">Maintains bone density, strengthens teeth and bones, nourishes nervous system</div>
      <p>Recommended Daily Dosage: 1000 mcg<br />
        Food Source: Milk, cheese,  yoghurt
        (in small quantities)</p>
    </div>
    <!--- necVitamin Close ---->

    <hr />

    <h3>CHOOSE THE BEST SUPPLEMENT FOR A SPECIFIC CONDITION</h3>

    <h4>FOR BETTER BONE HEALTH</h4>
    <p class="cl mrgn-b-20">Women need 1000mg calcium every-day for maintaining bone health. With age, the body&#39;s ability to absorb calcium goes down. However, vitamin D helps absorb calcium. </p>
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="45103,45314,48532,42634" showAddToCart="true"/>


    <h4>FOR IRON DEFICIENCY</h4>
    <p class="cl mrgn-b-20">Iron makes haemoglobin in blood, which in turn, regulates the oxygen and carbon dioxide flow in and outof blood. If body goes out ofenough iron, you mayget anaemia, condition where body can&#39;t make enough red blood cells.</p>
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="13384,37955,48544,42640" showAddToCart="true"/>


    <h4>FOR BETTER SKIN, HAIR AND NAILS</h4>
    <p class="cl mrgn-b-20">Your hair, skin and nails are a mirror of how your physical health is. If you are having troubles with skin, hair or nails; your body must be lacking enough nutrients like vitamins A,B, C, E, omega-3 fatty acids and zinc. </p>
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="12946,15347,15188,42202" showAddToCart="true"/>


    <h4>FOR COMPLETE CALCIUM INTAKE</h4>
    <p class="cl mrgn-b-20">Calcium and minerals are needed by bones, teeth as well as muscles. While calcium in bones and teeth supporttheir structure and hardness, muscles need them to move and nerves need them to carry messages from brain to each body part. </p>
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="15350,15176,13643,48534" showAddToCart="true"/>


    <h4>FOR MAINTAINING MENSTRUAL HEALTH</h4>
    <p class="cl mrgn-b-20">Your body loses key vitamins during menstruation.Extra vitamins like Vitmain A, C, E, B6, B12 etc. can help replenish what you have lost in<br />
      your cycle. </p>
    <s:layout-render name="/buying-guide/bgCatalogLayout.jsp" vid="15680,13732,37924,14524" showAddToCart="true"/>

    <hr />
    <h3>A WORD OF CAUTION</h3>
    <p class="mrgn-b-20">It is important to remember, however, that supplements cannot fully substitute the nutrients found in whole foods. For e.g. Spinach is a great source of iron and also contains thousands of other nutrients whereas an iron supplement would only have iron as the only nutrient. You should know that there are many disease-causing devils around you and popping in only vitamin supplements may not be enough. Also, taking too much of these supplements may only worsen the case. In cases like this, make sure you consume only the prescribed amounts of vitamin supplements. </p>

  </div>
  <!--- Container 2 Close ---->


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