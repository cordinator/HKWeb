<%@ page import="com.hk.web.filter.WebContext" %>
<%@ page import="com.shiro.PrincipalImpl" %>
<%@ page import="org.apache.shiro.SecurityUtils" %>
<%@include file="/includes/taglibInclude.jsp" %>

<s:layout-render name="/store/msGeneral.jsp">
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


<s:layout-component name="msHeader">
  <s:layout-render name="/store/gosf/gosfHeader.jsp"/>
</s:layout-component>

<s:layout-component name="msHeading">

  <div class="cl"></div>
</s:layout-component>
<!---- banner close --->


<s:layout-component name="msContent">
<div class="wrapper gosfCombo">
<div class="gosfValid">*All coupons are valid till December 14th 2013.</div>
<div class="clearfix"></div>
  <span class="gosfH2">Sports Nutrition</span>


  <%--<div class="gosfCoupon" style="background-color: #fafad2;">
    <p><b>10% CashBack across <a href="http://www.healthkart.com/sports-nutrition?navKey=CP-nt-sn">Sports Nutrition</a>*</b> <br> Excluding Optimum Nutrition<br>maximum cashback upto Rs. 1000<br>

    </p>

    <div class="gosfCode">Use Coupon Code: <span>HKGOSFSN</span></div>
  </div>--%>

  <div class="clearfix"></div>

  <div class="gosfCoupon">
    <p><b>Get <a href="http://www.healthkart.com/sv/muscleblaze-gym-carry-bag/SP-24037?navKey=VRNT-46386">MuscleBlaze
      Gym Carry Bag</a> FREE<br> (Worth Rs 499)</b> <br> When you buy for Rs 1500 and above <br>from <a
        href="${pageContext.request.contextPath}/store/gosf/sportsNutrition.jsp">Sports Nutrition</a></p>

    <div class="gosfCode">Use Coupon Code: <span>HKSN2GOSF</span></div>
  </div>


  <div class="gosfCoupon">
    <p><b>Get <a href="http://www.healthkart.com/sv/muscleblaze-creatine/SP-8688?navKey=VRNT-13489">MuscleBlaze Creatine
      300g</a> FREE<br> (Worth Rs 419)</b> <br> When you buy for Rs 2000 and above <br>from <a
        href="${pageContext.request.contextPath}/store/gosf/sportsNutrition.jsp">Sports Nutrition</a></p>

    <div class="gosfCode">Use Coupon Code: <span>	HKSN3GOSF</span></div>
  </div>


  <div class="gosfCoupon">
    <p><b>Get <a href="http://www.healthkart.com/sv/muscleblaze-gym-bag/SP-19804?navKey=VRNT-39787">MuscleBlaze Gym
      Bag</a> FREE<br> (Worth Rs 999)</b> <br> When you buy for Rs 3000 and above <br>from <a
        href="${pageContext.request.contextPath}/store/gosf/sportsNutrition.jsp">Sports Nutrition</a></p>

    <div class="gosfCode">Use Coupon Code: <span>HKSN4GOSF</span></div>
  </div>


  <div class="gosfCoupon">
    <p><b>Get <a href="http://www.healthkart.com/sv/muscleblaze-mass-gainer/SP-8687?navKey=VRNT-13479">Muscleblaze Mass
      Gainer 3.3lb</a> FREE<br> (Worth Rs 1579)</b> <br> When you buy for Rs 5000 and above <br>from <a
        href="${pageContext.request.contextPath}/store/gosf/sportsNutrition.jsp">Sports Nutrition</a></p>

    <div class="gosfCode">Use Coupon Code: <span>	HKSN5GOSF</span></div>
  </div>


  <div class="gosfCoupon">
    <p><b>Get <a
        href="http://www.healthkart.com/sv/healthviva-digital-weighing-scale--glass-platform-(black)/SP-23336?navKey=VRNT-45000">HealthViva
      Digital Weighing Scale <br>Glass Platform</a> FREE (Worth Rs 2499)</b> <br> When you buy for Rs 8000 and above
      <br>from <a href="${pageContext.request.contextPath}/store/gosf/sportsNutrition.jsp">Sports Nutrition</a></p>

    <div class="gosfCode">Use Coupon Code: <span>HKSN6GOSF</span></div>
  </div>


  <div class="gosfCoupon">
    <p><b>Get <a href="http://www.healthkart.com/sv/muscleblaze-post-workout/SP-22093?navKey=VRNT-42650">MuscleBlaze
      Post Workout 3.3lb</a> FREE<br> (Worth Rs 2499)</b> <br> When you buy for Rs 10000 and above <br>from <a
        href="${pageContext.request.contextPath}/store/gosf/sportsNutrition.jsp">Sports Nutrition</a></p>

    <div class="gosfCode">Use Coupon Code: <span>HKSN8GOSF</span></div>
  </div>

  <div class="gosfCoupon">
    <p><b>Get <a href="http://www.healthkart.com/sv/muscleblaze-power-bar/SP-22091?navKey=VRNT-42646">MuscleBlaze
      Power Bar (Pack of 6)</a> <br>FREE (Worth Rs 594)</b> <br> When you buy for Rs 3000 and above <br>across <a
        href="http://www.healthkart.com/brand/muscleblaze?navKey=BR-539">MuscleBlaze Products</a></p>

    <div class="gosfCode">Use Coupon Code: <span>HKMBPB6</span></div>
  </div>


  <div class="cl"></div>


  <span class="gosfH2">HEALTH NUTRITION</span>

  <div class="gosfCoupon">
    <p>Upto 45% discount on <a href="http://www.healthkart.com/brand/vitamin-shoppe?navKey=BR-486">Vitamin Shoppe</a>
    </p>

    <p><b>Get Additional 10% Cashback</b> <br>on purchase of Rs 1499 and above</p>

    <div class="gosfCode">Use Coupon Code: <span>HKVS10CB</span></div>
  </div>


  <div class="gosfCoupon">
    <p>Upto 45% discount on <a href="http://www.healthkart.com/brand/vitamin-shoppe?navKey=BR-486">Vitamin Shoppe</a>
    </p>

    <p><b>Get Additional 20% Cashback</b> <br>on purchase of Rs 2499 and above</p>

    <div class="gosfCode">Use Coupon Code: <span>HKVSCB20</span></div>
  </div>


  <div class="cl"></div>


  <span class="gosfH2">HEALTH DEVICES &amp; DIABETES</span>

  <div class="gosfCoupon">
    <p><b>Get <a
        href="http://www.healthkart.com/sv/healthviva-daily+-%28multivitamin-n-multimineral-with-ginseng%29/SP-23416?navKey=VRNT-45165">HealthViva
      Daily+ (Multivitamin &amp; Multimineral)</a> FREE (Worth Rs 249)</b><br> When you buy for Rs 2500 and above <br>from
      <a href="${pageContext.request.contextPath}/store/gosf/healthCare.jsp">Health Devices &amp; Diabetes</a></p>

    <div class="gosfCode">Use Coupon Code: <span>HKMVHDD</span></div>
  </div>

  <div class="gosfCoupon">
    <p><b>Get <a
        href="http://www.healthkart.com/sv/healthviva-digital-weighing-scale--glass-platform-(black)/SP-23336?navKey=VRNT-45000">HealthViva
      Digital Weighing Scale-<br>Glass Platform</a> FREE (Worth Rs 2499)</b> <br> When you buy for Rs 8000 and above
      <br>from <a href="${pageContext.request.contextPath}/store/gosf/healthCare.jsp">Health Devices &amp; Diabetes</a>
    </p>

    <div class="gosfCode">Use Coupon Code: <span>HKHVHDD</span></div>
  </div>

  <div class="cl"></div>


  <span class="gosfH2">Sports and Fitness</span>

  <div class="gosfCoupon">
    <p><b>Get 25% Off on All <a href="http://www.healthkart.com/brand/reebok?navKey=BR-315&ac_sel=Reebok">Reebok
      Products</a></b></p>

    <div class="gosfCode">Use Coupon Code: <span>HKRBKGOSF</span></div>
  </div>


  <div class="gosfCoupon">
    <p><b>Get 35% Off on All <a
        href="http://www.healthkart.com/brand/stag-fitness?navKey=BR-1226&ac_sel=STAG%20Fitness">Stag Fitness</a></b>
    </p>

    <div class="gosfCode">Use Coupon Code: <span>HKSTAGGOSF</span></div>
  </div>


  <div class="gosfCoupon">
    <p><b>Get 35% Off on All <a href="http://www.healthkart.com/brand/adidas?navKey=BR-4&ac_sel=Adidas">Adidas
      Products</a></b></p>

    <div class="gosfCode">Use Coupon Code: <span>HKADIGOSF</span></div>
  </div>


  <div class="cl"></div>


  <span class="gosfH2">Personal Care</span>

  <div class="gosfCoupon">

    <p>
      <br> Get 10% cash back on purchase of Rs 1000 from
      <a href="${pageContext.request.contextPath}/store/gosf/personalCare.jsp">Personal Care Category</a>
    </p>

    <div class="gosfCode">Use Coupon Code: <span>HKPC10CB</span></div>
  </div>


  <div class="cl"></div>


  <span class="gosfH2">Beauty</span>

  <div class="gosfCoupon">
    <p><b>Get Lotus Herbal Facewash FREE <br>(Worth Rs 75)</b>
      When you buy for Rs 750 and above from <a
          href="${pageContext.request.contextPath}/store/gosf/beauty.jsp">Beauty</a>
      <br>Also get 10% cash back on minimum purchase of Rs 1000
    </p>

    <div class="gosfCode">Use Coupon Code: <span>HKBEAUTY10</span></div>
  </div>


  <div class="cl"></div>


  <span class="gosfH2">Women Care</span>

  <div class="gosfCoupon">
    <p><b>Get <a href="http://www.healthkart.com/sv/knockout-pepper-spray---key-ring-style/SP-7482?navKey=VRNT-11083">Knockout
      Pepper Spray (Key Ring Style)</a> FREE (Worth Rs 249)</b><br> When you buy for Rs 2000 and above <br>from <a
        href="${pageContext.request.contextPath}/store/gosf/womenCare.jsp">Women Care</a></p>

    <div class="gosfCode">Use Coupon Code: <span>HKPSWC</span></div>
  </div>


  <div class="cl"></div>
  <div class="gosfValid">*All coupons are valid till December 14th 2013.</div>
</div>
<div class="cl"></div>
</s:layout-component>

<s:layout-component name="msFooter">

  <s:layout-render name="/store/gosf/gosfFooter.jsp"/>
</s:layout-component>

<s:layout-component name="msScriptComponent">
  <script>
    $(document).ready(function () {

    });

  </script>
  <script type="text/javascript" src="<hk:vhostJs/>/assets/js/cart/cart.js"></script>
</s:layout-component>
</s:layout-render>