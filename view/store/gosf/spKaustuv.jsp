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
          <div class="cateName">spKaustuv.jsp<br>
            <span>For Sports Enthusiast</span>
          </div>

          <div class="cl"></div>

          <div class="recoDesig">
            Manager<br>
            Branding
          </div>

          <div class="recoDesig">
            Items to keep you active
          </div>


        </div>
        <!--- cateRec close --->



        <div class="recoPic">
          <img src="<hk:vhostImage/>/assets/images/gosf/kaustav.png">
        </div>
        <!--- recoPic close --->



        <div class="recoTxt">
          <span>Some people bike to work, I bike at work</span>
          <p>Stuck at work but still want to work out? Ditto. I know office isn&#39;t the perfect replacement for the gym, but it is an awesome place to get in some accessory work while hacking through the inbox.</p>

          <p>Few push ups, dumbbell curls and leg lifts keep me fit and active at work. Here are few of my recommendation that you can place in your office cabin. </p>
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
    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="45849,39704,22147,45937,21542" showAddToCart="true"/>
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