<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>



<s:layout-render name="/buying-guide/bgGeneral.jsp" title="All about hand wraps">
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
  <meta name="description" content="Know all about Hand Wraps: their types, various uses, simple steps of how to ready a hand wrap for yourself." />
  <meta name="keywords" content="Hand Wraps, Hand Wraps Sizes and Hand Wraps types" />
    <!-- <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/buying-guide/boxing/css/boxing.css" media="screen">  -->
    <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/buying-guide/handWraps/css/handwraps.css" media="screen">

</s:layout-component>

<s:layout-component name="bgContent">

<!-- CONTENT \\ -->
<div class="container">
<div class="row">
    <div class="lp_header">
        <h2 class="lp_titleNormal">ALL ABOUT</h2>
        <p class="lp_line">&nbsp;</p>
        <h1 class="lp_titleBold">HAND WRAPS</h1>
        <ul class="lp_navList">
            <li>
                <a href="javascript:void(0);" data-target="#need">
                    Why do you need hand wraps?
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" data-target="#types">
                    Types of hand wraps
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" data-target="#size">
                    Size of hand wraps
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" data-target="#styles">
                    Different styles of hand wraps
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" data-target="#ready">
                    How to ready a hand wrap yourself
                </a>
            </li>
            <li>
                <a href="javascript:void(0);" data-target="#quickTips">
                    Quick tips
                </a>
            </li>
        </ul>
    </div>
</div>
<!-- /row -->

<div class="row lp_row">
    <p class="lp_text">
        At first glance, wraps will look like a menial piece of equipment. But they are not. They are by far the most crucial boxing equipement you'll come across. Hand wraps are a must-have if you want to indulge in striking a person or an object.  Contrary to common perception, you need hand wraps over and above your boxing gloves to protect the smaller bones and joints of your knuckles, palm and your wrist. Simply put, hand wraps minimize the impact of a blow being delivered, particularly on your thumb and wrist, where boxing gloves fail to provide enough impact protection.
    </p>
</div>
<!-- /row -->


<!-- NEEDS \\ -->
<div class="row lp_row">
    <h3 class="lp_heading" id="need">
        WHY DO YOU NEED HAND WRAPS
    </h3>

    <p class="lp_smallText">
        Hand wraps are the first line of defense against smaller injuries that boxing gloves can't protect you from. Going on a heavy bag or a huge human head without sufficient wrapping around your knuckles can leave you with enough sprains and twists to bring down  your boxing routine to a minimum. Even if you don't injure your kunckles and wrists as much, you sure will get good amount of nicks and cuts that'll keep you sufficiently irritated throughout your bout/training.
    </p>
</div>
<!-- /row -->

<div class="row lp_row">
    <h3 class="lp_subHeading">
        Here's a quick draw to why you need wraps
    </h3>

    <ul class="lp_basicList">
        <li>Hand wraps keep the tiny bones of your palm, called the metacarpals, aligned together. The alignment prevents your bones from spreading out or bending under the impact of a punch.</li>

        <li>If you watch closely, a hand wrap actually changes your palm from a collection of fragile bones into a semi-solid mass that doesn't expand during impact. In simpler words, it gives you a firmer fist.</li>

        <li>A proper fist reduces the chances of strains, sprains and the notorious 'boxer's break' (fracture of the fifth metacarpal).</li>

        <li>Wrapping attaches the base of your thumb to your hand that protects it during missed punches. You may break the base of your thumb when you are training with sparring gloves as easily as a boxer would in a bout. Securely wrapped hand wrap provides safety against such thumb injuries.</li>

        <li>Wrapping protects the ligaments of your wrist that keep the carpal bones aligned. Aligned carpal bones mean a stronger wrist area, what boxers usually refer to as 'tie' the wrist and the hand together.</li>

        <li>This tie creates a more solid mass that can take the impact of powerful punches easily.</li>

        <li>Wrapping is most crucial for beginners and during training on heavy punching bags to reduce the likelihood of wrist pain which is often notced in amateur boxers. </li>
    </ul>
</div>
<!-- /row -->
<!-- \\ TYPES -->


<div class="row lp_row">
    <h4 class="lp_heading" id="types">
        TYPES OF HAND WRAPS
    </h4>
    <p class="lp_smallText">
        Hand wraps can be differentiated on a lot of factors, based on their function (reusable and disposable), style, size and of course, personal preferences. Almost all the training hand wraps are reusable and washable, with only gauze wraps reserved for the disposable kind because they are used during competitions.
    </p>
</div>
<!-- /row -->

<div class="row lp_row">
    <h4 class="lp_heading" id="size">
        SIZE OF HAND WRAPS
    </h4>
    <p class="lp_smallText">
        The common sizes for hand wraps range from 120 inches to 180 inches. If you have smaller hands, it is best to pick wraps that are shorter in length. If your hand wraps are too long, you'll be tired halfway through the wrapping because of the extra wrap-arounds you'll have to make to form a tight wrap. Too lengthy hand wraps will obviously alter the fit of your glove, making them too tight in most cases.
    </p>
</div>
<!-- /row -->

<div class="row lp_row">
    <h4 class="lp_heading" id="styles">
        DIFFERENT STYLES OF HAND WRAPS
    </h4>
    <h4 class="lp_subHeading">
        TRAINING WRAPS
    </h4>
    <p class="lp_smallText">
        Wraps that are used in training differ in style from those used in competitions. Training wraps are secured by a velcro/hook, are generally reusable and can easily be wrapped on your own. The basic training wraps are made of cotton, elastic or gel.
    </p>
</div>
<!-- /row -->


<div class="row lp_row">
    <h4 class="lp_subHeadingImg lp_bold">
        TRADITIONAL COTTON HERRINGBONE WRAPS
    </h4>
    <p class="lp_smallText">
        They are long-lasting, inexpensive and reusable. And they most definitely do not stretch. All that makes them the best kind of wraps available for training. Cotton wraps have a loop that goes around the thumb before you begin wrapping them. There is velcro on the other end to secure the wrap firmly, which makes it easy to wrap one on your own.
        <br /><br />
        Cotton wraps are two inches wide and fall within the range of 150 to 170 inches in length. If you have large hands, this a good length of wraps to get yourself enough knuckle padding. In case you are looking to buy wraps for a junior boxer or if you have smaller hands, wraps ranging from 95 to 120 inches work well.

    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_productsWrap  clearfix">
    <s:layout-render name="/buying-guide/handWraps/handWrapsCatalogLayout.jsp" vid="24463,39053" showAddToCart="true"/>
</div>
<div class="cl"></div>


<div class="row lp_row">
    <h4 class="lp_subHeadingImg lp_bold">
        ELASTICIZED MEXICAN WRAPS
    </h4>
    <p class="lp_smallText">
        Elastic-style wraps are a blend of traditional  hand wrap combined with gauze-type wraps used for competitions. They stretch a little and are more comfortable than traditional hand wraps. They are an inexpensive option and are more popular among beginners because they contour better than cotton wraps. They range from 180 to 200 inches in length and can be washed and reused like a traditional cotton wrap. Although they stand out for more comfort and convenience, they are less durable than cotton wraps.
    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_productsWrap  clearfix">
    <s:layout-render name="/buying-guide/handWraps/handWrapsCatalogLayout.jsp" vid="39057" showAddToCart="true"/>
</div>
<div class="cl"></div>


<div class="row lp_row">
    <h4 class="lp_subHeadingImg lp_bold">
        GEL WRAPS
    </h4>
    <p class="lp_smallText">
        These wraps look and feel completely different from Mexican and cotton wraps. That's because they are not wraps in the strict sense of the word. Instead, they are slipped on like a regular pair of gloves. Though they do not cover your fingers like a glove would, but they protect your knuckles with an embedded foam padding.
        <br /><br />
        Their padding to the knuckles and the rest of the palm is exceptional but they are thought to be not as good at protecting your wrists. They are relatively expensive but are a very convenient method of wrapping your hands before you put on your boxing gloves, especially if you train by your self and are put off by the tedious process of wrapping your hands. Like cotton and Mexican wraps, these too are machine washable.
    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_productsWrap  clearfix">
    <s:layout-render name="/buying-guide/handWraps/handWrapsCatalogLayout.jsp" vid="39748" showAddToCart="true"/>
</div>
<div class="cl"></div>

<div class="row lp_row">
    <h4 class="lp_subHeading" id="styles">
        COMPETITION WRAPS
    </h4>
    <p class="lp_smallText">
        Wraps used in competition are made of gauze and use a tape instead of a vlecro or a pin/hook.  They are never reusable, need more precision in wrapping than training wraps and are usually wrapped by someone else.
    </p>
</div>
<!-- /row -->


<div class="row lp_row">
    <h4 class="lp_subHeadingImg lp_bold">
        GAUZE BANDAGE HAND WRAPS
    </h4>
    <p class="lp_smallText">
        Gauze bandage wraps are the only wraps that are set aside for competition use. The wrap is secured by a medical/sports tape, the specifications of which are outlined by the boxing organisations. They are inherently used by professional boxers and solely during official bouts. Because they are not reusable, using gauze-type hand wraps during training sessions can get costly for you. Also, securing a gauze/tape-type hand wrap inevitably requires the assistance of a trainer to form a firm wrap of gauze around your wrists and palm. It is so tough to get the wrap to accurately form a contour around your hands that even professional boxers hire specialized trainers to wrap their hands before a match.
    </p>
</div>
<!-- /row -->

<div class="row lp_row">
    <h3 class="lp_heading" id="ready">
        HOW TO READY A HAND-WRAP FOR YOURSELF
    </h3>
    <p class="lp_smallText lp_textCenter">
        Wrapping your hands before a training session actually depends on your preferred method of wrapping. But this is applicable only if you are halfway through your training and have a good sense of what style of wrapping works for you. Until you develop your own style of wrapping, which by the way you totally can, you can use the basic method of wrapping as a beginner. Just remember to keep it tight and fit for enough knuckle protection and wrist support. You may have to practise the wrapping a few times before you get it right.
    </p>
    <div style="" class="youtubeVideo">
        <iframe width="600" height="420"
                src="http://www.youtube.com/embed/b2TFzA97BZw" frameborder="0" allowfullscreen>
        </iframe>
    </div>
</div>
<!-- /row -->
<div class="row lp_row">
    <h4 class="lp_heading" id="quickTips">
        QUICK TIPS
    </h4>
    <ul class="lp_basicList">
        <li>
            Remember not to roll your wraps immediately after a training session. Air them dry, else they'll get musty and smelly. The same can happen to your boxing gloves too. Here's how you can avoid it all in 5 minutes flat.

        </li>
        <li>
            Remember not to roll your wraps immediately after a training session. Air them dry, else they'll get musty and smelly. The same can happen to your boxing gloves too.
            <a href="http://www.healthkart.com/buying-guide/boxing/index.jsp" target="_blank">
                Here's how you can avoid it all in 5 minutes flat.
            </a>
        </li>
        <li>
            No matter how much you air dry your wraps, they'd need to be washed eventually. Wash them with your heart out atleast once in 7 days.
        </li>
        <li>Your hand wrap will have a thumb loop. It is a nasty piece when it comes to laundering. It loops other cloth pieces in and gives a tangled mess. To avoid this, get a wash bag for your wraps.</li>

        <li>The bag will be a mesh that will wash your wraps but without letting the loop spread to the rest of your clothes.</li>

        <li>If you don't have a mesh bag, go old school and hand wash them in a sink.</li>

        <li>If your wraps are brightly colored, chances are that they'll bleed. Unless you like all things pink in your wardrobe, wash them separately.</li>

        <li>Remember not to use a dryer to dry your hand wraps. Machine wash will do but when it comes to drying them, use a clothes line to avoid shrinkage and creases in the fabric.</li>

        <li>Make sure you always wrap your hands before you train with your boxing and bag gloves.</li>

        <li>Before putting on/buying your boxing gloves, wrap your hands with a hand wrap for a better glove fit. When you are buying your gloves online, it is recommended that you wrap your hands to size your palm for glove measurement. To learn how to size your palm before buying a boxing glove, refer to
            <a href="http://www.healthkart.com/buying-guide/boxing/index.jsp" target="_blank">
                'How to measure your palm before buying boxing gloves'.
            </a>
        </li>

        <li>Don't treat your wraps lightly. They come with wash and care instructions. It is good to read them before putting them in a sea of detergent and spinning them in your machine.</li>

        <li>Always spread your fingers when you are wrapping your palm.</li>

        <li>Try keeping your wraps wrinkle-free. Wrinkles can cause your wrap to cut off blood circulation, making you feel really uncomfortable during your training</li>
    </ul>
    <p class="lp_smallText mrgnTop">
        You may be convinced that boxing gloves will get you the protection you need while you are in the ring or outside of it, training. But there is an obvious misconception around hand wraps. They are seriously under-rated by a lot of practising boxers. The truth is that boxing gloves do protect. But they are made to protect the opponent from your hard blows. Hand wraps, on the other hand, are made to protect your own knuckles and wrists.
        <br /><br />
        Your fists are your weapons in a boxing match and throughout your training. Simply put, you need wraps to keep your weapon strong and going. Hand wraps protect your wrists and hands from injury of course, but what you should also keep in mind is that hand wraps also let you throw your punches well without getting months of downtime injury.
    </p>


</div>
<!-- /row -->

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



    <script type="text/javascript">
        $('body').on('click','a[data-target]',function(){
            HK.utils.Scroll.toElement($($(this).attr('data-target')));
        })

    </script>

    <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
</s:layout-component>
</s:layout-render>