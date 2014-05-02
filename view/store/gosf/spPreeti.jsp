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
    <div class="cateRecBox">
      <div class="wrapper">

        <div class="cateRec">
          <div class="cateName">Preeti Roopanwal<br>
            <span>For Health Enthusiasts</span>
          </div>

          <div class="cl"></div>

          <div class="recoDesig">
            Category Associate<br>
            Nutrition
          </div>

          <div class="recoDesig">
            Recommendations for the women on the go
          </div>

        </div>
        <!--- cateRec close --->



        <div class="recoPic">
          <img src="<hk:vhostImage/>/assets/images/gosf/preeti.png">
        </div>
        <!--- recoPic close --->



        <div class="recoTxt">
          <span>The only girl in a team? Ditto. </span>
          <p>I work in a place where I am the youngest and also the only girl. My work hours are so bad that my new BFF is my watchman. My stress levels are so high, I found &quot;The Conjuring&quot; poetic. </p>

          <p>
            Healthy, nutritious and full of antioxidants, these products boost my spirit, rejuvenate my system, manage my weight and keep me going.
            Anywhere close to what I face daily, try these products. Oh, by the way what do you call your watchman? </p>
        </div>




      </div>
      <!--- wrapper close --->
    </div>
    <!--- cateRecBox close --->
    <div class="cl"></div>
  </s:layout-component>
  <!---- banner close --->



  <s:layout-component name="msContent">





   <div class="wrapper">
    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="14838,45108,13479,45162" showAddToCart="true"/>
   </div>
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