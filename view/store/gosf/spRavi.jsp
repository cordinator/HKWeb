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
          <div class="cateName">Ravi Sharma<br>
            <span>For Your Wellness</span>
          </div>

          <div class="cl"></div>

          <div class="recoDesig">
            Category Associate<br>
            Health and Wellness
          </div>

          <div class="recoDesig">
            These are a few <br>

            of my favorite things
          </div>


        </div>
        <!--- cateRec close --->



        <div class="recoPic">
          <img src="<hk:vhostImage/>/assets/images/gosf/ravi.png">
        </div>
        <!--- recoPic close --->



        <div class="recoTxt">
          <span>Lift your coolness quotient</span>
          <p>Amid the revelry that defines December, we encourage you to spend some time reflecting on your own best moments from 2013-all the outfits, quips, accomplishments, and good deeds that earned you your &quot;Man of the Year&quot; status.</p>

          <p>Whether you take year-end victory laps in black ties or woolly plaids, here&#39;s a list of products that help you pull your look together. Are you ready, yet?</p>
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
    <s:layout-render name="/store/gosf/gosfCatalogLayout.jsp" vid="46596,34436,5018,8212" showAddToCart="true"/>
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