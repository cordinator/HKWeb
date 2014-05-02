<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>



<s:layout-render name="/buying-guide/bgGeneral.jsp" title="All about Punching Bags">
<%
    boolean isSecure = WebContext.isSecure();
    pageContext.setAttribute("isSecure", isSecure);

    PrincipalImpl principal = (PrincipalImpl) SecurityUtils.getSubject().getPrincipal();
    if (principal != null) {
        pageContext.setAttribute("user_has  h", principal.getUserHash());
        pageContext.setAttribute("gender", principal.getGender());
        pageContext.setAttribute("orderCount", principal.getOrderCount());
    } else {
        pageContext.setAttribute("user_hash", "guest");
        pageContext.setAttribute("gender", null);
        pageContext.setAttribute("orderCount", null);
    }
%>

<s:layout-component name="htmlHead">
  <meta name="description" content="Get all information related to Punching Bag" />

   <link rel="stylesheet" type="text/css" href="<hk:vhostCss/>/buying-guide/punchingBag/css/punchingBag.css" media="screen">

</s:layout-component>

<s:layout-component name="bgContent">

<!-- CONTENT \\ -->
<div class="container">
<div class="row">
    <div class="lp_header">
        <h2 class="lp_titleNormal">ALL ABOUT</h2>
        <p class="lp_line">&nbsp;</p>
        <h1 class="lp_titleBold">PUNCHING BAGS</h1>
        <ul class="lp_navList">
            <li>
                <a data-target="#types" href="javascript:void(0);">
                    Types of punching bags
                </a>
            </li>
            <li>
                <a data-target="#materialUsed" href="javascript:void(0);">
                    How to choose the right punching bag online
                </a>
            </li>
        </ul>
    </div>
</div>
<!-- /row -->

<div class="row lp_row">
    <p class="lp_text">
        While shadow boxing or forms of doing techniques "in the air" will give you a bit of cardiovascular work-out, depending on your effort – and such activities do burn movement into muscle memory, the brain, and neural- pathways- it is still good to be able to hit something which has resistance, to get the body used to the shock of making contact with an actual solid object. As boxers and other fighters need to use punching bags, before you go out and buy one for yourself, these are few types of punching bags you'd want to know about:
    </p>
</div>
<!-- /row -->


<!-- TYPES \\ -->
<div class="row lp_row">
    <h3 class="lp_heading" id="types">
        TYPES OF PUNCHING BAGS
    </h3>

    <h4 class="lp_subHeadingImg lp_bold">
        HEAVY BAGS
    </h4>
    <p class="lp_smallText">
        Heavy bags are hung from wall-mounted brackets and they feature a free-standing system. They are cylindrical and are made from tough-wearing leather which comes in various sizes and weights. These come with a set of chains or toughened straps. The heavy bags allows you to use different styles and techniques, either moving side to side and pinging off the jabs, right crosses and other long range punches, or stepping close and using crunching short range hooks and short range uppercuts.

    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_productsWrap  clearfix">
    <s:layout-render name="/buying-guide/punchingBag/punchingBagCatalogLayout.jsp" vid="24283,21050" showAddToCart="true"/>
</div>
<div class="cl"></div>


<div class="row lp_row">
    <h4 class="lp_subHeadingImg lp_bold">
        SPEED BAGS
    </h4>
    <p class="lp_smallText">
        Speed bags are designed to help develop your slipping, ducking and rolling skills. They're tear-drop shaped and filled with maize. They come in either a small or a large size that weighs 15 kg or 30 kg+ respectively.
        Teardrop shaped punching bags are great for developing quickness for boxing, kickboxing and mixed martial arts, due to their unique shape and light weight compared to other kinds of bags. Teardrop bags can be hung in ways that will allow for drills in both punching and kicking, as well as Muay thai moves.
    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_productsWrap  clearfix">
    <s:layout-render name="/buying-guide/punchingBag/punchingBagCatalogLayout.jsp" vid="39264,21049" showAddToCart="true"/>
</div>
<div class="cl"></div>


<div class="row lp_row">
    <h4 class="lp_subHeadingImg lp_bold">
        ANGLED HEAVY BAGS
    </h4>
    <p class="lp_smallText">
        Angled bags are a combination of heavy bags and maize bags; they allow using uppercuts and hooks which targets your pectorals, biceps and traps, giving you a complete upper-body workout. They're not as dense and solid as maize bags but they're much more practical for prolonged use. Angled bags help you brush the core of your long range punches; they also allow you to practice uppercuts and hooks because of their unique shape.

    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_productsWrap  clearfix">
    <s:layout-render name="/buying-guide/punchingBag/punchingBagCatalogLayout.jsp" vid="24282" showAddToCart="true"/>
</div>
<div class="cl"></div>


<div class="row lp_row">
    <h4 class="lp_subHeadingImg lp_bold">
        WALL MOUNTED PAD SYSTEMS
    </h4>
    <p class="lp_smallText">
        Wall mounted pad systems help you improve your footwork with dynamic body movements, their solidity helps to improve your punching power but they're reserved/ recommended for a full-sized gym as they require more space.
    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_productsWrap  clearfix">
    <s:layout-render name="/buying-guide/punchingBag/punchingBagCatalogLayout.jsp" vid="39323" showAddToCart="true"/>
</div>
<div class="cl"></div>


<div class="row lp_row">
    <h4 class="lp_subHeadingImg lp_bold">
        FREE STANDING PUNCHING BAGS
    </h4>
    <p class="lp_smallText">
        Free-standing systems are nothing but mounted bags on a vertical pole into a heavy base. They can be stored away when not in use. They are very mobile and you do not need a ceiling to hang it on, but they let you do your training wherever you want. These bags help you develop your jabbing, power punching and roundhouse kicking techniques.
    </p>
</div>
<!-- /row -->

<div class="cl"></div>
<div class="lp_productsWrap  clearfix">
    <s:layout-render name="/buying-guide/punchingBag/punchingBagCatalogLayout.jsp" vid="39302,21800" showAddToCart="true"/>
</div>
<div class="cl"></div>

<!-- // TYPES -->

<!-- MATERIALS USED \\ -->
<div class="row lp_row">
    <h3 class="lp_heading" id="materialUsed">
        MATERIALS USED
    </h3>
    <p class="lp_smallText lp_textCenter">
        They're either made of synthetic leather, vinyl or canvas
    </p>
    <h4 class="lp_subHeading">
        Leather bags
    </h4>
    <p class="lp_smallText lp_textCenter">
        These are chosen for premium martial arts and they provide a great natural feel. They also offer a better striking experience as they don't cut knuckles and are lot more durable than other bags.
    </p>
</div>
<!-- /row -->

<div class="row lp_row">
    <h4 class="lp_subHeading">
        Vinyl bags
    </h4>
    <p class="lp_smallText lp_textCenter">
        They look and feel similar as leather bags but they're not as durable and they're not as expensive as leather bags.
    </p>
</div>
<!-- /row -->

<div class="row lp_row">
    <h4 class="lp_subHeading">
        Canvas bags
    </h4>
    <p class="lp_smallText lp_textCenter">
        These are lower quality punching bags and are cheaper than leather and vinyl bags. They can withstand moisture, unlike leather bags.
    </p>
</div>
<!-- /row -->

<div class="row lp_row">
    <h4 class="lp_headingTopBorder">
        Fillings
    </h4>
    <p class="lp_smallText lp_paragraphMargin">
        <span class="lp_bold">Sand :</span>
        Sand bags are heavier than any other bags, they provide consistent resistance experience. They    aren't affected by temperature and are easy to clean and replace.
    </p>
    <p class="lp_smallText lp_paragraphMargin">
        <span class="lp_bold">Water :</span>
        Water filled bags provide a realistic striking experience and they help avoid injuries. These bags can be unfilled and moved around easily.
    </p>
    <p class="lp_smallText lp_paragraphMargin">
        <span class="lp_bold">Shredded fiber/ compressed fabric :</span>
        They provide even resistance throughout the bag and designed to provide a similar experience as that of a sand bag.
    </p>
</div>
<!-- /row -->

<div class="row lp_row">
    <h3 class="lp_heading" id="materialUsed">
        HOW TO CHOOSE THE RIGHT PUNCHING BAG WEIGHT
    </h3>
    <p class="lp_smallText">
        The general rule is - to get a bag that is around half your body weight (recommended for amateurs/ beginners), or equal to your body weight or more (if you're a pro).
    </p>
    <ul class="lp_basicList">
        <li>
            18-22 kg bags are usually recommended for ladies or children
        </li>
        <li>
            32- 36 kg bags are recommended for people who weigh around 77 kg
        </li>
        <li>
            If you're someone who weighs more than 77 kg then you should go for bags that weigh close to or over 45 kg
        </li>
    </ul>
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

  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
</s:layout-component>
</s:layout-render>