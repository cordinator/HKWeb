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
          <div class="cateName">Anshul Sharma<br>
            <span>For Health Enthusiasts</span>
          </div>

          <div class="cl"></div>

          <div class="recoDesig">
            Manager<br>
            Nutrition
          </div>

          <div class="recoDesig">
            Ideas to keep one fit and healthy
          </div>


        </div>
        <!--- cateRec close --->



        <div class="recoPic">
          <img src="<hk:vhostImage/>/assets/images/gosf/anshul.png">
        </div>
        <!--- recoPic close --->



        <div class="recoTxt">
          <span>If you want to get fit, this is what you need, all you need</span>
          <p>I run the biggest category here at HealthKart. They say that with great responsibility, come streaks of white hair.
            Do not take it the wrong way, I really enjoy my work.
            My biggest satisfaction comes when I am able to give the very best of my catalog to my customers. Here are some of our best sellers. I hope you like them.</p>

          <p>
            For an improved physical performance, you can easily rely on these products. Made with premium ingredients and
            backed with noted manufactures, these not only feed those target muscles with nutrients, but help you reach your fitness goal much faster.</p>
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
    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="13478,14331,44909,45031" showAddToCart="true"/>
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