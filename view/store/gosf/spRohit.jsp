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
          <div class="cateName">Rohit Tekriwal<br>
            <span>For Health Enthusiasts</span>
          </div>

          <div class="cl"></div>

          <div class="recoDesig">
            Manager<br>
            Private Labelling
          </div>

          <div class="recoDesig">
            Recommendations to build muscle and more
          </div>


        </div>
        <!--- cateRec close --->



        <div class="recoPic">
          <img src="<hk:vhostImage/>/assets/images/gosf/rohit.png">
        </div>
        <!--- recoPic close --->



        <div class="recoTxt">
          <span>They don&#39;t call me &quot;Tasting Tekriwal&quot; for nothing</span>
          <p>They say grass is greener on the other side. But not when you have to taste ten different types of flavour before zeroing on one.
            However, there is much more to my job-making sure our customer needs are satisfied. Here is a list of recommendations you might like.</p>

          <p>These supplements keep you going throughout the day, keeping you active and energized. Giving you nothing but the best,
            these products are manufactured with quality ingredients to cover all aspects of all body types, from ripped to shredded. </p>
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
    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="13285,15003,37888,13489" showAddToCart="true"/>
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