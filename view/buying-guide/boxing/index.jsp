<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>



<s:layout-render name="/buying-guide/bgGeneral.jsp" title="How to choose the right boxing gloves online at HealthKart.com">
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
  <meta name="description" content="Know all about boxing gloves: their types, various uses, simple tips on how to choose the right glove size for yourself and how to take care of them." />
  <meta name="keywords" content="Boxing Gloves, Boxing gloves Care tips Boxing Gloves Sizes" />
    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/buying-guide/boxing/css/boxing.css?v=1" media="screen">
    <!-- <link rel="stylesheet" type="text/css" href="css/boxing.css" media="screen">  -->


</s:layout-component>

<s:layout-component name="bgContent">

<!-- CONTENT \\ -->
<div class="container">
<div class="row">
    <div class="lp_header">
        <h3 class="lp_h3_mainHeading">CAN'T DECIDE WHICH </h3>
        <div class="lp_h1_mainHeading">
            <img src="images/star.png" alt="star" />
            BOXING GLOVES
            <img src="images/star.png" alt="star" />
        </div>
        <h2 class="lp_h2_mainHeading">TO BUY? </h3>
            <div class="lp_italic_SubHeading">You will, in the next 23 minutes.</div>
    </div>
</div>
<!-- /row -->

<div class="row">
    <div class="lp_banner">
        <img src="images/bannerImg.png" alt="boxing gloves" />
    </div>
    <div class="lp_nav">
        <p class="lp_text">
            Click on the contents below to learn what you should be looking at before buying a pair. Else, scroll down for a step by step read.
        </p>
        <ul class="lp_navList">
            <li>
                <a data-target="#uses" href="javascript:void(0);">
                    Different Types - When to use which boxing glove
                </a>
            </li>
            <li>
                <a data-target="#types" href="javascript:void(0);">
                    Different materials used in boxing gloves
                </a>
            </li>
            <li>
                <a data-target="#choose" href="javascript:void(0);">
                    How to choose the size of  boxing gloves online
                </a>
            </li>
            <li>
                <a data-target="#maintenance" href="javascript:void(0);">
                    How to wash and maintain your gloves
                </a>
            </li>
        </ul>
    </div>
</div>
<!-- /row -->

<div class="row lp_row redTop_border">
    <p class="lp_text lp_centeredText">
        Just about every boxer or those aspiring to be one keep a pair of boxing gloves for all purposes. As a beginner when you go to buy boxing gloves online, you see different kinds of gloves that leave you confused, and understandably so. This buying guide shares some simple tricks that'll help you pick the right size and type no matter where you are shopping your gloves from. So, let's read, shall we?
    </p>
</div>
<!-- /row -->


<!-- USES \\ -->
<div class="row lp_row">
    <h3 class="lp_heading" id="uses">
        WHEN TO USE WHICH BOXING GLOVES
    </h3>

    <h4 class="lp_subHeadingImg">
        <span class="lp_bold">BAG GLOVES :</span> Simply put, bag gloves are, well, for practising with bags
    </h4>
    <p class="lp_smallText">
        When you're in your training period you use bag gloves. These gloves feature a reduced level of padding in the knuckle area that allows you to 'feel' the impact of the shots, which helps to build your confidence. They tend to go up to 10 oz to 12 oz in weight and are known to be one of the cheapest types of boxing gloves.

    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_productsWrap  clearfix">
    <s:layout-render name="/buying-guide/boxing/boxingCatalogLayout.jsp" vid="38993,39009,39484" showAddToCart="true"/>
</div>
<div class="cl"></div>

<div class="row lp_row">
    <h4 class="lp_subHeadingImg">
        <span class="lp_bold">SPARRING GLOVES :</span> To practice beating the crows out of people.
    </h4>
    <p class="lp_smallText">
        Sparring can be explained as practice fighting, when you're boxing in the ring with a partner and not in an official fight it's called sparring. It helps in learning, conditioning and getting ready for an official fight. For sparring you need sparring gloves, these gloves feature thicker padding that protects both the athletes during practice bouts. They range from 16 oz to 20 oz in weight.
    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_productsWrap  clearfix">
    <s:layout-render name="/buying-guide/boxing/boxingCatalogLayout.jsp" vid="38945,38948,38947" showAddToCart="true"/>
</div>
<div class="cl"></div>


<div class="row lp_row">
    <h4 class="lp_subHeadingImg">
        <span class="lp_bold">PRO BOXING GLOVES : </span> To actually beat the crows out of people.
    </h4>
    <p class="lp_smallText">
        Pro boxing gloves feature an evenly distributed padding around the glove and the wrist band tends to be longer. Because of its evenly distributed weight the knuckle section is thinner, which results in throwing better punches or knock outs during pro boxing matches. They come in sizes 8 oz or 10 oz and they could feature either strings or Velcro straps to fasten.
    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_productsWrap clearfix">
    <s:layout-render name="/buying-guide/boxing/boxingCatalogLayout.jsp" vid="38940,21041,38943" showAddToCart="true"/>
</div>
<div class="cl"></div>

<!-- // USES -->

<!-- TYPES \\ -->
<div class="row lp_row">
    <h3 class="lp_heading" id="types">
        DIFFERENT materials OF BOXING GLOVES
    </h3>
    <h4 class="lp_subHeading">
        LEATHER V/S VINYL V/S PU
    </h4>
    <p class="lp_smallText lp_textCenter">
        Leather gloves are usually worn by pro boxers in professional bouts, as they are known for their breathability and durability. Vinly gloves are inexpensive and less durable and can be used for cardio kickboxing and other martial arts. PU gloves, on the other hand,  are recommended for starters or children who are yet to develop their boxing skills. They look and feel like leather but they aren't as durable and expensive as
        leather gloves.
    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_twoProducts clearfix">
    <s:layout-render name="/buying-guide/boxing/boxingCatalogLayout.jsp" vid="39468,21043" showAddToCart="true"/>
</div>
<div class="cl"></div>

<div class="row lp_row">
    <h4 class="lp_subHeading">
        LACES V/S VELCRO
    </h4>
    <p class="lp_smallText lp_textCenter">
        Boxing gloves are also available with different kinds of enclousers, they could be either laces or Velcro closures. Though lace up boxing gloves provide a more secure grip than a Velcro closure, it is impossible to lace up alone. Therefore, even if they are preferred in professional bouts, Velcro encloures can be more suitable when you are training alone.
    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_twoProducts clearfix">
    <s:layout-render name="/buying-guide/boxing/boxingCatalogLayout.jsp" vid="38941,23600" showAddToCart="true"/>
</div>
<div class="cl"></div>

<div class="row lp_row">
    <h4 class="lp_subHeading">
        HORSE HAIR PADDING V/S FOAM PADDING
    </h4>
    <p class="lp_smallText lp_textCenter">
        When it comes to the padding you could choose between horse hair padding and foam padding in boxing gloves. Horsehair padding are durable but they aren't not as good as foam padding when it comes to protecting your hands against an opponent's skull or a heavy bag. The material used in foam training and competition gloves consists of special combination of shock- absorbing PVC foam and latex. Since foam padding can be modified depending on the purpose of the gloves, they are known to be more versatile than horsehair filling.
    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_twoProducts clearfix">
    <s:layout-render name="/buying-guide/boxing/boxingCatalogLayout.jsp" vid="38939,23609" showAddToCart="true"/>
</div>
<div class="cl"></div>

<div class="row lp_row">
    <h4 class="lp_subHeading">
        FRONT WEIGHTED V/S BACK WEIGHTED
    </h4>
    <p class="lp_smallText lp_textCenter">
        Another type would be front weighted and back weight gloves. Front-weighted gloves feature heavy padding in the front which tends to temper the force of the blows, whereas rare-weighted are better suited for more professional bouts as they deliver harder blows.
    </p>
</div>
<!-- /row -->

<!-- DID YOU KNOW // -->

<!-- // TYPES -->
<div class="row lp_row">
    <div class="lp_redBox clearfix">
        <div class="lp_redBoxImage">
            <img src="images/youKnow.jpg" alt="Did you know" />
        </div>
        <div class="lp_redBoxText">
            <h3 class="lp_redBoxHeading">DID YOU KNOW?</h3>
            <p class="lp_smallText">
                Guess what boxers used before boxing gloves came into use- bare knuckles. Yup! Some just wrapped their knuckles with leather straps but that's just about it. Keeping your gloves on during a bout wasn't always the case with boxing, atleast not until the Olympics of 688 B.C.
            </p>
        </div>
    </div>
</div>
<!-- /row -->

<div class="row lp_row">
    <h3 class="lp_heading" id="choose">
        HOW TO CHOOSE THE RIGHT BOXING GLOVES
    </h3>
    <p class="lp_smallText">
        When it comes to choosing the right boxing gloves you must know that the glove size and glove weight are not the same things. A lot of times the sizing does correspond with the weight of the glove, but this does not always work. Thus usually you pick the weight of the glove according to the method of use, eg:- if you’re a pro boxer and you participate in official bouts, you’d pick a glove that weighs around 8 oz. You pick the right size for the best fit of the glove.
    </p>
    <div class="lp_BoxImage">
        <img src="images/hand.jpg" alt="HOW TO CHOOSE THE RIGHT BOXING GLOVES" />
    </div>
    <div class="lp_BoxText">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <th rowspan="2">
                </th>
                <th colspan="2">men</th>
                <th colspan="2">women</th>
            </tr>
            <tr>
                <td>S/M </td>
                <td>L/XL </td>
                <td>S/M </td>
                <td>L/XL </td>
            </tr>
            <tr>
                <td>AROUND PALM</td>
                <td>8" </td>
                <td>9.5" </td>
                <td>7" </td>
                <td>7.5" </td>
            </tr>
            <tr>
                <td>TIP TO WRIST</td>
                <td>7.5" </td>
                <td>8.5" </td>
                <td>7.5" </td>
                <td>8.5" </td>
            </tr>
            <tr>
                <td>TIP TO WRIST</td>
                <td>7" </td>
                <td>8" </td>
                <td>7" </td>
                <td>8" </td>
            </tr>
        </table>
    </div>
</div>
<!-- /row -->

<div class="row lp_row">
    <p class="lp_smallText">
        Common sizes for gloves run small, medium and large. The most common sizes of gloves can be categorized as:
    </p>
    <ul class="lp_basicList">
        <li>8 oz – common for competitive boxers</li>
        <li>10 oz – common for competitive boxers</li>
        <li>12 oz – common for women and people with small hands for training</li>
        <li>14 oz –  common for average size people for training.</li>
        <li>16 oz –  common for people of all sizes for training.</li>
        <li>18 oz – commonly used for larger weight classes for training</li>
    </ul>
    <p class="lp_smallText">
        Thus is it possible to have eg: a 10 oz gloves in small, medium and large. It also depends on the manufacturer of the glove.
    </p>
    <p class="lp_smallText">
        It is common for you to see this:
    </p>
    <ul>
        <li>Small – 12 oz</li>
        <li>Medium – 14 oz</li>
        <li>Large – 16 oz</li>
    </ul>
</div>
<!-- /row -->

<div class="row lp_row">
    <h3 class="lp_heading" id="maintenance">
        How to Maintain Your Boxing Gear
    </h3>
    <p class="lp_smallText lp_textCenter">
        Let's put it straight- we are humans and we are capable of awful sweat crimes. How much we sweat during about makes boxing gloves to get really smelly.

    </p>

    <p class="lp_centeredText">
        Here's what you can do to keep the smell off your dear, priceless boxing gloves :
    </p>

    <ul class="lp_list">
        <li>First off, dry your gloves completely. Get them out of your bag the soonest you can. Unlace/unstrap them as wide as possible. Open their mouths as much to allow maximum air flow. Air them under the sun or use a fan.
        </li>
        <li>Crumble some newspaper and stick it inside your glove when you aren't using it. Remember to change the newspaper regularly. This will absorb humidity. Use this in the thumb and finger area of your glove.
        </li>
        <li>Get a mixture of rubbing alcohol and water. You can alternately use vinegar too. Damp your hands and move them around the inside of your gloves.
        </li>
        <li>Mix 1/2 a cup of white vinegar, 1 cup of water and five drops of tea tree or lavender oil in a spray bottle. Spray your heart out in your goves. Air them next.
        </li>
        <li>Get a sock. Put some baking soda or baby powder in there and place the sock in your glove. Take sthe smell away.
        </li>
        <li>Else, use glove dogs. A cheap way to get them is to prepare one of your own. Follow the same 'sock method'.  Just this time, use cedar chips instead of soda or powder. You'll find cedar chips at your local pet store. They are usually used as bedding for small pets. Use this sock and cedar in the palm of your glove.
        </li>
    </ul>
    <p class="lp_centeredText">
        If you are in the mood, you can also do some bacteria-killing:
    </p>

</div>
<!-- /row -->

<div class="row lp_row">
    <div class="lp_blueBox clearfix">
        <div class="lp_blueBoxImage">
            <img src="images/freeze.png" alt="Did you know" />
        </div>
        <div class="lp_blueBoxText">
            <h3 class="lp_redBoxHeading">FREEZE 'EM</h3>
            <p class="lp_text">
                This may not sound normal but it
                does the trick. Wrap you gloves in a
                plastic bag and freeze them overnight.
                After freezing, air them for 24-48
                hours. This will take care of all
                the bacteria and you would have
                wiped hundreds of bacterial
                colonies clean.
            </p>
        </div>
    </div>


    <div class="lp_yellowBox clearfix">
        <div class="lp_yellowBoxImage">
            <img src="images/feed.png" alt="Did you know" />
        </div>
        <div class="lp_yellowBoxText">
            <h3 class="lp_redBoxHeading">FEED 'EM</h3>
            <p class="lp_text">
                With some salt. Try leaving your gloves
                in saltwater overnight if freezing them
                doesn't work for you. Make sure you
                let them dry before you out them
                back on.
            </p>
        </div>
    </div>


    <div class="lp_greenBox clearfix">
        <div class="lp_greenBoxImage">
            <img src="images/spray.png" alt="Did you know" />
        </div>
        <div class="lp_greenBoxText">
            <h3 class="lp_redBoxHeading">SPRAY IN 'EM</h3>
            <p class="lp_text">
                Use an anti-bacterial spray when all
                the above fail. Febreeze and Lysol
                work best
            </p>
        </div>
    </div>

    <p class="lp_text lp_textCenter">
        In a nutshell, never put your gloves in a bag unless they are all dry. If you do, the moisture will make your gloves give off a lifetime worth's stink you just won't like. They might also grow fungi into them, if you know what we mean. Yeah, gory-looking, thick masses of fungi colonies. Now, if you happen to be the person who believes in borrowing a pair for your bout, it just gets worse. You are mixing everybody's sweat with your own, combine that with all the fungi colonies you are reuniting in your glove. You get the message, right? Try buying your own pair and try  harder not to lend/borrow.

    </p>

</div>
<!-- /row -->

<!-- // DID YOU KNOW -->

</div>
<!-- // CONTENT -->

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

    <script type="text/javascript">
        $('body').on('click','a[data-target]',function(){
            HK.utils.Scroll.toElement($($(this).attr('data-target')));
        })

    </script>

  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
</s:layout-component>
</s:layout-render>